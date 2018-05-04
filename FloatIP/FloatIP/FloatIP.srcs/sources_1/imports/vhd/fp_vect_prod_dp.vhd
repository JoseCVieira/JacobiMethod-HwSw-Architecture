----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2017 11:23:28 AM
-- Design Name: 
-- Module Name: fp_vect_prod_dp - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fp_vect_prod_dp is
  generic (DATA_SIZE : natural := 32);
  port ( data_A, data_B : in  std_logic_vector (DATA_SIZE-1 downto 0);
         clk, init_acc, valid_A, last_A : in std_logic;
         valid_res, last_res : out std_logic;
         data_out : out  std_logic_vector (DATA_SIZE-1 downto 0));
end fp_vect_prod_dp;

architecture Behavioral of fp_vect_prod_dp is
COMPONENT floating_point_mult_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_a_tlast : IN STD_LOGIC;
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tlast : OUT STD_LOGIC
  );
END COMPONENT;
COMPONENT floating_point_acc_0
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_a_tlast : IN STD_LOGIC;
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_result_tlast : OUT STD_LOGIC
  );
END COMPONENT;
signal m_valid, m_last, acc_last, init_acc_d1 : std_logic;
signal acc_reset_n : std_logic;
signal rvalid_A, rlast_A : std_logic;
signal m_data, reg_A, acc_out : std_logic_vector(31 downto 0);

begin

inst_fp_mul : floating_point_mult_0
  PORT MAP (
    aclk => clk,
    s_axis_a_tvalid => rvalid_A,
    s_axis_a_tdata => reg_A,
    s_axis_a_tlast => rlast_A,
    s_axis_b_tvalid => rvalid_A,
    s_axis_b_tdata => data_B,
    m_axis_result_tvalid => m_valid,
    m_axis_result_tdata => m_data,
    m_axis_result_tlast => m_last
  );

inst_fp_acc : floating_point_acc_0
  PORT MAP (
    aclk => clk,
    aresetn => acc_reset_n,
    s_axis_a_tvalid => m_valid,
    s_axis_a_tdata => m_data,
    s_axis_a_tlast => m_last,
    m_axis_result_tvalid => valid_res,
    m_axis_result_tdata => acc_out,
    m_axis_result_tlast => acc_last
  );
  
  acc_reset_n <= init_acc_d1 nor init_acc; -- guarantees assertion for a minimum of two clock cycles     
  process (clk)
   begin
    if clk'event and clk='1' then  
      init_acc_d1 <= init_acc;
      reg_A <= data_A;
      rvalid_A <= valid_A;
      rlast_A <= last_A;
      last_res <= acc_last;
    end if;
  end process;

  process (clk)
   begin
    if clk'event and clk='1' then
      if init_acc='1' then 
        data_out <= (others => '0');
      elsif acc_last='1' then 
        data_out <= acc_out;
      end if;
    end if;
  end process;  
end Behavioral;
