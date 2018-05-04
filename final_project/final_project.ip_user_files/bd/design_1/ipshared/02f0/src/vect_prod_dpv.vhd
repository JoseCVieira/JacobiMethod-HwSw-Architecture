library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vect_prod_dpv is
  generic (DATA_SIZE : natural := 32);
  port ( data_A, data_B : in  std_logic_vector (DATA_SIZE-1 downto 0);
         clk, init_acc, valid_A, last_A : in std_logic;
         valid_res, last_res : out std_logic;
         data_out : out  std_logic_vector (DATA_SIZE-1 downto 0));
end vect_prod_dpv;

architecture behavioral of vect_prod_dpv is
  signal regA, regB : signed (DATA_SIZE-1 downto 0);
  signal mult_out, regM : signed (DATA_SIZE*2-1 downto 0);
  signal sum_out, regACC : signed (DATA_SIZE*2+2-1 downto 0);
  signal valid_delayed, last_delayed : std_logic_vector (2 downto 0);
  signal acc_en : std_logic;
begin
  process (clk)
  begin
    if clk'event and clk='1' then
      valid_delayed <= valid_delayed(valid_delayed'high-1 downto 0) & valid_A;
        -- simple 1 cycle delay registers
      last_delayed <= last_delayed(last_delayed'high-1 downto 0) & last_A;
        -- simple 1 cycle delay registers
      regM <= mult_out;           -- multiplier output register
      regA <= signed(data_A);            -- A register
    end if;
  end process;
  regB <= signed(data_B);            -- B register

  process (clk)
  begin  -- accumulator
    if clk'event and clk='1' then
      if init_acc='1' then
        regACC <= (others => '0');
      elsif acc_en='1' then
        regACC <= sum_out;
      end if;
    end if;
  end process;

  mult_out <= regA * regB;
  sum_out <= (regM(regM'high) & regM(regM'high) & regM) + regACC;

  data_out <= std_logic_vector(regACC(data_out'range));

  acc_en <= valid_delayed(valid_delayed'high-1);
  valid_res <= valid_delayed(valid_delayed'high);
  last_res <= last_delayed(last_delayed'high);

end Behavioral;
