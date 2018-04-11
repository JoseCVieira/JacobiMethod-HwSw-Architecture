----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2017 05:45:48 PM
-- Design Name: 
-- Module Name: tb_stream_mats - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_stream_mats is
--  Port ( );
end tb_stream_mats;

architecture Behavioral of tb_stream_mats is
 component my_axis_int_matp_cnt
--   generic (
--     C_S_AXIS_TDATA_WIDTH    : integer    := 32;
--     C_M_AXIS_TDATA_WIDTH    : integer    := 32;
--     C_M_AXIS_START_COUNT    : integer    := 32);
   port (
     -- Ports of Axi Slave Bus Interface S_AXIS
     s_axis_aclk    : in std_logic;
     s_axis_aresetn    : in std_logic;
     s_axis_tready    : out std_logic;
--     s_axis_tdata    : in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
--     s_axis_tstrb    : in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
     s_axis_tdata    : in std_logic_vector(31 downto 0);
     s_axis_tlast    : in std_logic;
     s_axis_tvalid    : in std_logic;

     -- Ports of Axi Master Bus Interface M_AXIS
     m_axis_aclk    : in std_logic;
     m_axis_aresetn    : in std_logic;
     m_axis_tvalid    : out std_logic;
--     m_axis_tdata    : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
--     m_axis_tstrb    : out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
     m_axis_tdata    : out std_logic_vector(31 downto 0);
     m_axis_tlast    : out std_logic;
     m_axis_tready    : in std_logic );
  end component;

--Inputs
      signal clk : std_logic := '0';
      signal rstn : std_logic := '0';
  
      signal S_AXIS_TDATA : std_logic_vector(31 downto 0) := (others => '0');
      signal S_AXIS_TLAST : std_logic := '0';
      signal S_AXIS_TVALID : std_logic := '0';
      signal M_AXIS_TREADY : std_logic := '0';
      
      --Outputs
      signal M_AXIS_TDATA : std_logic_vector(31 downto 0);
      signal M_AXIS_TLAST : std_logic := '0';
      signal M_AXIS_TVALID : std_logic;
      signal S_AXIS_TREADY : std_logic;
      
      -- Clock period definitions
      constant clk_period : time := 10 ns;
      constant t_hdelay : time := 5 ns;
      
    signal selB : std_logic := '0';
    signal idataA : integer := 0;
    signal idataB : integer := 0;
    type iarray is array (0 to 15) of integer;
    -- Matrix A by rows 
    signal ia : iarray := (2, 3, 4, 5, -17, -60, 3, -54, 0, 62, 36, 53, -9, 60, -44, 52);
    -- Matrix B by rows
    signal ib : iarray := (-1, -10, 20, -20, -42, -13, -4, -25, -42, -28, 10, -9, -28, -6, -5, -29);
    signal idataR : integer := 0;
    
  begin
      -- Instantiate the Unit Under Test (UUT)
    uut: my_axis_int_matp_cnt 
       PORT MAP (
          S_AXIS_ACLK    => clk, S_AXIS_ARESETN => rstn, 
          S_AXIS_TREADY => S_AXIS_TREADY,    S_AXIS_TDATA => S_AXIS_TDATA,  
          S_AXIS_TLAST => S_AXIS_TLAST, S_AXIS_TVALID => S_AXIS_TVALID,
          M_AXIS_ACLK    => clk, M_AXIS_ARESETN => rstn,
          M_AXIS_TVALID => M_AXIS_TVALID, M_AXIS_TDATA => M_AXIS_TDATA,
          M_AXIS_TLAST => M_AXIS_TLAST, M_AXIS_TREADY => M_AXIS_TREADY);
      
      -- Clock definition
      clk <= not clk after clk_period/2;
   
      S_AXIS_TDATA <= std_logic_vector( to_signed(idataB, 32)) when selB='1' else
                      std_logic_vector( to_signed(idataA, 32));
      M_AXIS_TREADY <= '1' after 200 ns;
      -- M_AXIS_TREADY <= not M_AXIS_TREADY after 13*clk_period;
      
       -- Stimulus process
             stim_proc: process
       begin        
         -- hold reset state for 100 ns.
         wait for 100 ns;    
         rstn <= '1';
         -- insert stimulus here 
         wait for 10*clk_period; 
         wait until rising_edge(clk); wait for t_hdelay; -- to synchronize input variation with positive clock edge + hdelay 
         
         for i in 0 to 3 loop
           -- do 4 vector products
          
          for j in 0 to 3 loop
            -- send 1 column of b elements
            -- wait for clk_period*10;
            selB <= '1';
            idataB <= ib(j*4+i);  -- sending 1 column
                
            if j = 3 then
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
           end loop;   -- j loop
          
          wait for clk_period;       
         
          for k in 0 to 3 loop
           -- send 4 lines of a elements
           selB <= '0'; 
    
           for j in 0 to 3 loop
            -- send 1 line of a elements
   
            idataA <= ia(k*4+j);
             
            if j = 3 and k = 3 then
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
            end loop;  -- j
           
          end loop;  -- k
   
         wait until rising_edge(clk); wait for t_hdelay+clk_period*10;
   --       wait for clk_period*10;
         end loop; -- i
    
         wait;
       end process;
   
       r_proc: process
       begin
         for i in 0 to 3 loop  -- C column 
           for j in 0 to 3 loop -- A row
             wait until M_AXIS_TVALID='1';
    
             idataR <= 0; wait for 1 ns;
             for k in 0 to 3 loop 
               idataR <= idataR + ia(j*4+k) * ib(k*4+i);
               wait for 1 ns;
             end loop;
           end loop;
         end loop;
       end process;   
       
  end Behavioral;

