-- Description:
-- Package generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 5

-- Name of L1 Trigger Menu:
-- L1Menu_test_compare_gtl_struct_v8

-- Unique ID of L1 Trigger Menu:
-- dfda5134-41bb-44ca-b09b-2ec83164a685

-- Unique ID of firmware implementation:
-- fc8947cc-1165-4041-9a39-d7b797848edd

-- Scale set:
-- scales_2017_05_23

-- VHDL producer version
-- v3.1.1
-- ========================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package l1menu_pkg is

-- content of ugt_constants.vhd generated by VHDL Producer formerly

-- Algorithms
constant NR_ALGOS : positive := 3; -- number of algorithmns (min. 32 for FDL registers width !!!) - written by TME

constant MODULE_ID : integer := 5;
-- -- HB 2014-02-28: changed to UUID generated by TME (128 bits = 4 x 32 bits)
constant L1TM_UID : std_logic_vector(127 downto 0) := X"dfda513441bb44cab09b2ec83164a685";
-- -- HB 2014-05-21: L1TM_NAME generated by TME (1024 bits = 32 x 32 bits)
-- -- has to be interpreted as 128 ASCII-characters (from right to left)
constant L1TM_NAME : std_logic_vector(128*8-1 downto 0) := X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000038765f7463757274735f6c74675f657261706d6f635f747365745f756e654d314c";

-- -- Unique fireware instance ID generated by the compiler, provided to keep track of multiple menu implementations.
constant L1TM_FW_UID : std_logic_vector(127 downto 0) := X"fc8947cc116540419a39d7b797848edd";
--
-- -- Trigger Menu Editor software version - written by TME
constant L1TM_COMPILER_MAJOR_VERSION      : integer range 0 to 255 := 3;
constant L1TM_COMPILER_MINOR_VERSION      : integer range 0 to 255 := 1;
constant L1TM_COMPILER_REV_VERSION        : integer range 0 to 255 := 1;
constant L1TM_COMPILER_VERSION : std_logic_vector(31 downto 0) := X"00" &
           std_logic_vector(to_unsigned(L1TM_COMPILER_MAJOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(L1TM_COMPILER_MINOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(L1TM_COMPILER_REV_VERSION, 8));

constant SVN_REVISION_NUMBER : std_logic_vector(31 downto 0) := X"00000000";
constant L1TM_UID_HASH : std_logic_vector(31 downto 0) := X"0FEF1253";
constant FW_UID_HASH : std_logic_vector(31 downto 0) := X"7DF19FC3";

-- content of algo_index.vhd generated by VHDL Producer formerly

-- HB 2016-09-16: constants for algo_mapping_rop.
type global_index_array is array (0 to NR_ALGOS-1) of integer;
constant global_index: global_index_array := (
         13, -- module_index: 0, name: L1_test_13
         19, -- module_index: 1, name: L1_test_19
          6, -- module_index: 2, name: L1_test_6
    others => 0
);

end package;