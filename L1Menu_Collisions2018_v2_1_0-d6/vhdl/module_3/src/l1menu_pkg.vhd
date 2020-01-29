-- Description:
-- Package generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 3

-- Name of L1 Trigger Menu:
-- L1Menu_Collisions2018_v2_1_0

-- Unique ID of L1 Trigger Menu:
-- e36612e2-bee8-45eb-a685-f6cea687ce3d

-- Unique ID of firmware implementation:
-- d2f1046e-e336-4df3-97cd-c4913821408e

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
constant NR_ALGOS : positive := 13; -- number of algorithmns (min. 32 for FDL registers width !!!) - written by TME

constant MODULE_ID : integer := 3;
-- -- HB 2014-02-28: changed to UUID generated by TME (128 bits = 4 x 32 bits)
constant L1TM_UID : std_logic_vector(127 downto 0) := X"e36612e2bee845eba685f6cea687ce3d";
-- -- HB 2014-05-21: L1TM_NAME generated by TME (1024 bits = 32 x 32 bits)
-- -- has to be interpreted as 128 ASCII-characters (from right to left)
constant L1TM_NAME : std_logic_vector(128*8-1 downto 0) := X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000305f315f32765f38313032736e6f6973696c6c6f435f756e654d314c";

-- -- Unique fireware instance ID generated by the compiler, provided to keep track of multiple menu implementations.
constant L1TM_FW_UID : std_logic_vector(127 downto 0) := X"d2f1046ee3364df397cdc4913821408e";
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
constant L1TM_UID_HASH : std_logic_vector(31 downto 0) := X"7D5D2BCD";
constant FW_UID_HASH : std_logic_vector(31 downto 0) := X"336901BA";

-- content of algo_index.vhd generated by VHDL Producer formerly

-- HB 2016-09-16: constants for algo_mapping_rop.
type global_index_array is array (0 to NR_ALGOS-1) of integer;
constant global_index: global_index_array := (
        425, -- module_index: 0, name: L1_ETMHF140
        398, -- module_index: 1, name: L1_HTT120er
        405, -- module_index: 2, name: L1_HTT400er
        166, -- module_index: 3, name: L1_SingleEG28er1p5
        168, -- module_index: 4, name: L1_SingleEG36er2p5
        172, -- module_index: 5, name: L1_SingleEG45er2p5
        184, -- module_index: 6, name: L1_SingleIsoEG24er1p5
        185, -- module_index: 7, name: L1_SingleIsoEG26er2p5
        192, -- module_index: 8, name: L1_SingleIsoEG30er2p5
        312, -- module_index: 9, name: L1_SingleJet120
        361, -- module_index: 10, name: L1_DoubleJet_120_45_DoubleJet45_Mass_Min620_Jet60TT28
        360, -- module_index: 11, name: L1_DoubleJet_115_40_DoubleJet40_Mass_Min620_Jet60TT28
        136, -- module_index: 12, name: L1_Mu12er2p3_Jet40er2p1_dR_Max0p4_DoubleJet40er2p1_dEta_Max1p6
    others => 0
);

end package;