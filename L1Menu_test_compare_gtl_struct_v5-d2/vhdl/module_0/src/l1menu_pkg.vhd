-- Description:
-- Package generated by VHDL Producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_test_compare_gtl_struct_v5

-- Unique ID of L1 Trigger Menu:
-- 7980afa2-2223-470a-a8cd-d79883406ff9

-- Unique ID of firmware implementation:
-- b73191c2-b016-4684-be31-cd40e5e1e44c

-- Scale set:
-- scales_2018_08_07

-- VHDL producer version
-- v2.7.1

-- ========================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package l1menu_pkg is

-- content of ugt_constants.vhd generated by VHDL Producer formerly

-- Algorithms
constant NR_ALGOS : positive := 4; -- number of algorithmns (min. 32 for FDL registers width !!!) - written by TME

constant MODULE_ID : integer := 0;
-- -- HB 2014-02-28: changed to UUID generated by TME (128 bits = 4 x 32 bits)
constant L1TM_UID : std_logic_vector(127 downto 0) := X"7980afa22223470aa8cdd79883406ff9";
-- -- HB 2014-05-21: L1TM_NAME generated by TME (1024 bits = 32 x 32 bits)
-- -- has to be interpreted as 128 ASCII-characters (from right to left)
constant L1TM_NAME : std_logic_vector(128*8-1 downto 0) := X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000035765f7463757274735f6c74675f657261706d6f635f747365745f756e654d314c";

-- -- Unique fireware instance ID generated by the compiler, provided to keep track of multiple menu implementations.
constant L1TM_FW_UID : std_logic_vector(127 downto 0) := X"b73191c2b0164684be31cd40e5e1e44c";
--
-- -- Trigger Menu Editor software version - written by TME
constant L1TM_COMPILER_MAJOR_VERSION : integer range 0 to 255 := 2;
constant L1TM_COMPILER_MINOR_VERSION : integer range 0 to 255 := 7;
constant L1TM_COMPILER_REV_VERSION : integer range 0 to 255 := 1;
constant L1TM_COMPILER_VERSION : std_logic_vector(31 downto 0) := X"00" &
           std_logic_vector(to_unsigned(L1TM_COMPILER_MAJOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(L1TM_COMPILER_MINOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(L1TM_COMPILER_REV_VERSION, 8));

constant SVN_REVISION_NUMBER : std_logic_vector(31 downto 0) := X"00000000"; -- not used anymore
constant L1TM_UID_HASH : std_logic_vector(31 downto 0) := X"E30DE96A";
constant FW_UID_HASH : std_logic_vector(31 downto 0) := X"F317DC65";

-- content of algo_index.vhd generated by VHDL Producer formerly

-- HB 2016-09-16: constants for algo_mapping_rop.
type global_index_array is array (0 to NR_ALGOS-1) of integer;
constant global_index: global_index_array := (
          0, -- module_index: 0, name: L1_Test_Jet30_Tau45_Rmovlp
          1, -- module_index: 1, name: L1_Test_DoubleJet30_Tau45_Rmovlp
          2, -- module_index: 2, name: L1_Test_TripleJet30_Tau45_Rmovlp
          3, -- module_index: 3, name: L1_Test_QuadJet30_Tau45_Rmovlp
    others => 0
);

end package;
