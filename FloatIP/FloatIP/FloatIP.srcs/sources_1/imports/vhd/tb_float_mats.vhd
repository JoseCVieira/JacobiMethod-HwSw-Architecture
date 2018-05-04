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

library ieee_proposed;
use ieee_proposed.float_pkg.all;

entity tb_float_mats is
--  Port ( );
end tb_float_mats;

architecture Behavioral of tb_float_mats is
 component my_axis_float_matp
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

    signal rdataA : real := 0.0;
    signal rdataB : real := 0.0;
    type rarray is array (0 to 15) of real;
    signal ra : rarray :=   (-0.644191, -1.023739, -0.909266,  0.682072,
                              -0.781614,  1.286125,  0.289488, -2.379306,
                               0.767548, -2.108128,  1.123454, -2.172636,
                               0.650794,  1.963091,  0.621686,  1.719622);
    signal rb : rarray :=   ( 1.631001, -0.839133,  1.372659,  1.167124,
                              -0.823036,  0.222919, -0.771357,  1.151162,
                              1.713731, -1.198254,  0.670293, -1.756123,
                              -1.845573, -0.747190, -1.564946,  0.989296);
    signal rdataR : real := 0.0;
    
  begin
      -- Instantiate the Unit Under Test (UUT)
    uut: my_axis_float_matp 
       PORT MAP (
          S_AXIS_ACLK    => clk, S_AXIS_ARESETN => rstn, 
          S_AXIS_TREADY => S_AXIS_TREADY,    S_AXIS_TDATA => S_AXIS_TDATA,  
          S_AXIS_TLAST => S_AXIS_TLAST, S_AXIS_TVALID => S_AXIS_TVALID,
          M_AXIS_ACLK    => clk, M_AXIS_ARESETN => rstn,
          M_AXIS_TVALID => M_AXIS_TVALID, M_AXIS_TDATA => M_AXIS_TDATA,
          M_AXIS_TLAST => M_AXIS_TLAST, M_AXIS_TREADY => M_AXIS_TREADY);
      
      -- Clock definition
      clk <= not clk after clk_period/2;
   
      -- Converting between real and std_logic_vector is a two step process:
       S_AXIS_TDATA <= to_slv( to_float(rdataB)) when selB='1'else 
                       to_slv( to_float(rdataA));   

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
            rdataB <= rb(j*4+i);  -- sending 1 column
                
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
   
            rdataA <= ra(k*4+j);
             
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
    
             rdataR <= 0.0; wait for 1 ns;
             for k in 0 to 3 loop 
               rdataR <= rdataR + ra(j*4+k) * rb(k*4+i);
               wait for 1 ns;
             end loop;
           end loop;
         end loop;
       end process;   
       
  end Behavioral;
