-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package ahir_system_global_package is -- 
  constant ADDOP : std_logic_vector(7 downto 0) := "00000000";
  constant MULOP : std_logic_vector(7 downto 0) := "00000010";
  constant SUBOP : std_logic_vector(7 downto 0) := "00000001";
  constant aPosteriori1_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant aPosteriori2_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant aPriori1_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant aPriori2_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant c_ONE_64 : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
  constant c_ZERO_1 : std_logic_vector(0 downto 0) := "0";
  constant code_block1_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant code_block2_base_address : std_logic_vector(13 downto 0) := "00000000000000";
  constant ebbyNo_base_address : std_logic_vector(0 downto 0) := "0";
  constant ext_info11_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant ext_info12_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant ext_info21_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant ext_info22_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant fp_d_ZERO : std_logic_vector(63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
  constant maxNitr_base_address : std_logic_vector(0 downto 0) := "0";
  constant mem11_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant mem12_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant mem21_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant mem22_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant message11_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant message12_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant message21_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant message22_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant rate_base_address : std_logic_vector(0 downto 0) := "0";
  constant trans_info11_12_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant trans_info12_11_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant trans_info21_22_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  constant trans_info22_21_base_address : std_logic_vector(14 downto 0) := "000000000000000";
  -- 
end package ahir_system_global_package;
