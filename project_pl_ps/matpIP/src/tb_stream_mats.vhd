library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_stream_mats is
--  Port ( );
end tb_stream_mats;

architecture Behavioral of tb_stream_mats is
    component my_axis_int_matp_cnt
        port (
        -- Ports of Axi Slave Bus Interface S_AXIS
        s_axis_aclk    : in std_logic;
        s_axis_aresetn : in std_logic;
        s_axis_tready  : out std_logic;
        s_axis_tdata   : in std_logic_vector(31 downto 0);
        s_axis_tlast   : in std_logic;
        s_axis_tvalid  : in std_logic;

        -- Ports of Axi Master Bus Interface M_AXIS
        m_axis_aclk    : in std_logic;
        m_axis_aresetn : in std_logic;
        m_axis_tvalid  : out std_logic;
        m_axis_tdata   : out std_logic_vector(31 downto 0);
        m_axis_tlast   : out std_logic;
        m_axis_tready  : in std_logic );
    end component;

    --Inputs
    signal clk  : std_logic := '0';
    signal rstn : std_logic := '0';

    signal S_AXIS_TDATA  : std_logic_vector(31 downto 0) := (others => '0');
    signal S_AXIS_TLAST  : std_logic := '0';
    signal S_AXIS_TVALID : std_logic := '0';
    signal M_AXIS_TREADY : std_logic := '0';

    --Outputs
    signal M_AXIS_TDATA  : std_logic_vector(31 downto 0);
    signal M_AXIS_TLAST  : std_logic := '0';
    signal M_AXIS_TVALID : std_logic;
    signal S_AXIS_TREADY : std_logic;

    -- Clock period definitions
    constant clk_period : time := 10 ns;
    constant t_hdelay   : time := 5 ns;

    signal selB   : std_logic := '0';
    signal idataA : integer := 0;
    signal idataB : integer := 0;
    type iarraya is array (0 to 63) of integer;
    type iarrayb is array (0 to 7) of integer;
    
    -- Matrix A by rows
    signal ia : iarraya := (0, -17,  60,  63, -45, -34, -35,  -1,
                            1,   0, -35,  57,  17,  -6,  13, -49,
                           33,   1,   0,  22,  19,  41, -51, -56,
                           51, -16,  60,   0,  -3,  49, -50, -55,
                           57,  12, -14, -17,   0,  19, -62,  32,
                           23, -61,  -8,  63,  56,   0, -12, -61,
                          -14,  28,  39,   0,  -9,   7,   0,  39,
                           12, -57,  41,  47,  30, -29, -18,  0);
    
    -- Matrix B by rows
    signal ib : iarrayb := (57, 55, 43, 50, 57, 61, -41, 11);
    
    signal idataR : integer := 0;

    begin
        -- Instantiate the Unit Under Test (UUT)
        uut: my_axis_int_matp_cnt
        PORT MAP (
            S_AXIS_ACLK   => clk, S_AXIS_ARESETN         => rstn,
            S_AXIS_TREADY => S_AXIS_TREADY, S_AXIS_TDATA => S_AXIS_TDATA,
            S_AXIS_TLAST  => S_AXIS_TLAST, S_AXIS_TVALID => S_AXIS_TVALID,
            M_AXIS_ACLK   => clk, M_AXIS_ARESETN         => rstn,
            M_AXIS_TVALID => M_AXIS_TVALID, M_AXIS_TDATA => M_AXIS_TDATA,
            M_AXIS_TLAST  => M_AXIS_TLAST, M_AXIS_TREADY => M_AXIS_TREADY);

        -- Clock definition
        clk <= not clk after clk_period/2;

        S_AXIS_TDATA <= std_logic_vector( to_signed(idataB, 32)) when selB='1' else std_logic_vector( to_signed(idataA, 32));
        
        M_AXIS_TREADY <= '1' after 200 ns;

        -- Stimulus process
        stim_proc: process
            begin
                -- hold reset state for 100 ns.
                wait for 100 ns;
                rstn <= '1';
                
                -- insert stimulus here
                wait for 10*clk_period;
                wait until rising_edge(clk); wait for t_hdelay; -- to synchronize input variation with positive clock edge + hdelay


                for i in 0 to 7 loop
                    -- send 1 column of b elements
                    -- wait for clk_period*10;
                    selB <= '1';
                    idataB <= ib(i);

                    if i = 7 then
                        S_AXIS_TLAST <= '1';
                    else
                        S_AXIS_TLAST <= '0';
                    end if;
                    
                    S_AXIS_TVALID <= '1';
                    wait until rising_edge(clk);
                    
                    if S_AXIS_TREADY /= '1' then
                        wait until S_AXIS_TREADY='1';
                        wait until rising_edge(clk);
                    end if;
                    
                    wait for t_hdelay;
                    S_AXIS_TVALID <= '0';
                    S_AXIS_TLAST <= '0';
                end loop;

                wait for clk_period;

                for i in 0 to 7 loop
                    -- send 4 lines of a elements
                    selB <= '0';

                    for j in 0 to 7 loop
                        -- send 1 line of a elements

                        idataA <= ia(i*8+j);

                        if j = 7 and i = 7 then
                            S_AXIS_TLAST <= '1';
                        else
                            S_AXIS_TLAST <= '0';
                        end if;
                    
                        S_AXIS_TVALID <= '1';
                        wait until rising_edge(clk);
                        
                        if S_AXIS_TREADY /= '1' then
                            wait until S_AXIS_TREADY='1';
                            wait until rising_edge(clk);
                        end if;
                        
                        wait for t_hdelay;
                        S_AXIS_TVALID <= '0';
                        S_AXIS_TLAST <= '0';
                    end loop;
                end loop;

                wait until rising_edge(clk); wait for t_hdelay+clk_period*10;
                    
                
                wait;
                
                end process;

        r_proc: process
            begin
       
                for i in 0 to 7 loop -- A row
                    wait until M_AXIS_TVALID='1';

                    idataR <= 0; wait for 1 ns;
                    
                    for j in 0 to 7 loop
                    
                    idataR <= idataR + ia(i*8+j) * ib(j);
                    wait for 1 ns;
                    
                    end loop;
                end loop;

            end process;

end Behavioral;
