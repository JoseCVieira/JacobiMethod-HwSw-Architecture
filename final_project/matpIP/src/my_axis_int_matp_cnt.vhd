library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity my_axis_int_matp_cnt is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_AXIS
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M_AXIS
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		C_M_AXIS_START_COUNT	: integer	:= 32
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S_AXIS
		s_axis_aclk	: in std_logic;
		s_axis_aresetn	: in std_logic;
		s_axis_tready	: out std_logic;
		s_axis_tdata	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		s_axis_tlast	: in std_logic;
		s_axis_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface M_AXIS
		m_axis_aclk	: in std_logic;
		m_axis_aresetn	: in std_logic;
		m_axis_tvalid	: out std_logic;
		m_axis_tdata	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		m_axis_tlast	: out std_logic;
		m_axis_tready	: in std_logic
	);
end my_axis_int_matp_cnt;

architecture arch_imp of my_axis_int_matp_cnt is
  -- Signal definitions
  signal rdcount, wrcount, vect_size : unsigned(9 downto 0);  -- address counter
  signal rst_rdcount, rst_rdcnt, en_rdcount, store_size : std_logic;
  signal a_last, a_valid : std_logic;
  signal rst_wrcount, rst_wrcnt, en_wrcount, last_read_row, last_write, last_acc, last_acc_reg : std_logic;
  signal f_can_write, f_can_read, last_col_elem, last_read_A : std_logic;
  signal mem_out, accum_res : std_logic_vector(31 downto 0);
  signal mem_wr_en : std_logic_vector(0 downto 0);
  
--  type state_type is (st_read_B, st_read_A, st_wait_processing, st_write); 
  type state_type is (st_read_B, st_read_A, st_write); 
  signal state, next_state : state_type; 
  
  -- component declaration
  COMPONENT blk_mem_gen_0
    PORT (
        clka : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
  END COMPONENT;
  component vect_prod_dpv
    generic (DATA_SIZE : natural := 32);
    port ( 
      data_A, data_B : in  std_logic_vector (DATA_SIZE-1 downto 0);
      clk, init_acc, valid_A, last_A : in std_logic;
      valid_res, last_res : out std_logic;
      data_out : out  std_logic_vector (DATA_SIZE-1 downto 0));
  end component;

begin

M_AXIS_TVALID <= f_can_write;
S_AXIS_TREADY  <= f_can_read;
M_AXIS_TLAST <= last_col_elem;
--M_AXIS_TSTRB <= "1111";
  
FSM_state_reg: process (S_AXIS_ACLK)
begin
  if (S_AXIS_ACLK'event and S_AXIS_ACLK = '1') then
    if (S_AXIS_ARESETN='0') then
      state <= st_read_B;
    else
      state <= next_state;
    end if;        
  end if;
end process;

FSM_comb_logic: process (state, S_AXIS_TVALID, S_AXIS_TLAST, M_AXIS_TREADY, last_acc, last_write, last_read_row)
begin
  -- declare default values to avoid latches
  next_state <= state;  -- default is to stay in current state
  f_can_write <= '0';
  f_can_read <= '0';
  mem_wr_en(0) <= '0';
  store_size <= '0';
  a_last <= '0';
  a_valid <= '0';
  en_wrcount <= '0';
  rst_wrcount <= '0'; 
  en_rdcount <= '0';
  rst_rdcount <= '0'; 
  last_col_elem <= '0';
  last_read_A <= '0';

case (state) is
  when st_read_B =>
    if (S_AXIS_TVALID = '1') then
      f_can_read <= '1';
      en_rdcount <= '1';
      mem_wr_en(0) <= '1';
      if (S_AXIS_TLAST = '1') then
        next_state <= st_read_A;
        rst_rdcount <= '1'; 
        store_size <= '1'; 
        rst_wrcount <= '1'; 
      end if;
    end if;
  when st_read_A =>
    if (S_AXIS_TVALID = '1') then
      f_can_read <= '1';
      a_valid <= '1';
      en_rdcount <= '1';
      if (S_AXIS_TLAST = '1') then
        next_state <= st_write;
        a_last <= '1';
        last_read_A <= '1';
      elsif (last_read_row = '1') then
        a_last <= '1';
        next_state <= st_write;
      end if;
    end if;
--  when st_wait_processing =>
--    if (last_acc = '1') then
--      next_state <= st_write;
--    end if;
  when st_write =>
   if (last_acc_reg = '1') then
    f_can_write <= '1';
    if (M_AXIS_TREADY = '1') then
      en_wrcount <= '1';
      rst_rdcount <= '1';
      if last_write='1' then
        next_state <= st_read_B;
        last_col_elem <= '1';
      else
        next_state <= st_read_A;
      end if;
    end if;
   end if;
  end case;      
end process;

  rst_rdcnt <= rst_rdcount or (not S_AXIS_ARESETN);
  rst_wrcnt <= rst_wrcount or (not S_AXIS_ARESETN);
  -- last_write <= '1' when wrcount = vect_size else '0';
  last_read_row <= '1' when rdcount = vect_size else '0';
  
  -- Read Counter
  process (S_AXIS_ACLK) 
  begin
    if S_AXIS_ACLK='1' and S_AXIS_ACLK'event then
      if rst_rdcnt='1' then 
        rdcount <= (others => '0');
      elsif en_rdcount='1' then
        rdcount <= rdcount + 1;
      end if;
    end if;
  end process;
  -- Write Counter
  process (S_AXIS_ACLK) 
  begin
    if S_AXIS_ACLK='1' and S_AXIS_ACLK'event then
      if rst_wrcnt='1' then 
        wrcount <= (others => '0');
      elsif en_wrcount='1' then
        wrcount <= wrcount + 1;
      end if;
    end if;
  end process;
  -- Column Size Register
  process (S_AXIS_ACLK) 
  begin
    if S_AXIS_ACLK='1' and S_AXIS_ACLK'event then
      if store_size='1' then
        vect_size <= rdcount;
      end if;
    end if;
  end process;
  -- Result Register (result is registered when/if waiting for M_AXIS_TREADY)
--  process (S_AXIS_ACLK) 
--  begin
--    if S_AXIS_ACLK='1' and S_AXIS_ACLK'event then
--      if last_acc = '1' then
--        M_AXIS_TDATA <= accum_res;
--      end if;
--    end if;
--  end process;
  process (S_AXIS_ACLK) 
  begin
    if S_AXIS_ACLK='1' and S_AXIS_ACLK'event then
      if rst_rdcnt = '1' then
        last_acc_reg <= '0';
      elsif last_acc='1' then 
        last_acc_reg <= '1';
      end if;
    end if;
  end process;
  process (S_AXIS_ACLK) 
  begin
    if S_AXIS_ACLK='1' and S_AXIS_ACLK'event then
      if rst_rdcnt = '1' then
        last_write <= '0';
      elsif last_read_A='1' then 
        last_write <= '1';
      end if;
    end if;
  end process;
  
    M_AXIS_TDATA <= accum_res;
        
dp_inst: vect_prod_dpv 
  generic map (DATA_SIZE => C_S_AXIS_TDATA_WIDTH)
  port map (data_A => S_AXIS_TDATA, data_B => mem_out,
            clk => S_AXIS_ACLK, init_acc => rst_rdcount,
            valid_A => a_valid, last_A => a_last,
            data_out => accum_res, valid_res => open, 
            last_res => last_acc);

inst_mem : blk_mem_gen_0
  port map (clka => S_AXIS_ACLK,
            wea => mem_wr_en,
            addra => std_logic_vector(rdcount),
            dina => S_AXIS_TDATA,
            douta => mem_out);

end arch_imp;
