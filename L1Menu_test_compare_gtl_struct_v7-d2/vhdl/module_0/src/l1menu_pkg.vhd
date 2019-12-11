-- Description:
-- Package generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_test_compare_gtl_struct_v7

-- Unique ID of L1 Trigger Menu:
-- c2577a01-8fb4-4ced-9e9e-100c8cb51099

-- Unique ID of firmware implementation:
-- 48842132-7411-4907-9715-652bc27e5f0b

-- Scale set:
-- scales_2018_08_07

-- VHDL producer version
-- v2.4.0
-- ========================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package l1menu_pkg is

-- content of ugt_constants.vhd generated by VHDL Producer formerly

-- Algorithms
constant NR_ALGOS : positive := 29; -- number of algorithmns (min. 32 for FDL registers width !!!) - written by TME

constant MODULE_ID : integer := 0;
-- -- HB 2014-02-28: changed to UUID generated by TME (128 bits = 4 x 32 bits)
constant L1TM_UID : std_logic_vector(127 downto 0) := X"c2577a018fb44ced9e9e100c8cb51099";
-- -- HB 2014-05-21: L1TM_NAME generated by TME (1024 bits = 32 x 32 bits)
-- -- has to be interpreted as 128 ASCII-characters (from right to left)
constant L1TM_NAME : std_logic_vector(128*8-1 downto 0) := X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000037765f7463757274735f6c74675f657261706d6f635f747365745f756e654d314c";

-- -- Unique fireware instance ID generated by the compiler, provided to keep track of multiple menu implementations.
constant L1TM_FW_UID : std_logic_vector(127 downto 0) := X"48842132741149079715652bc27e5f0b";
--
-- -- Trigger Menu Editor software version - written by TME
constant L1TM_COMPILER_MAJOR_VERSION      : integer range 0 to 255 := 2;
constant L1TM_COMPILER_MINOR_VERSION      : integer range 0 to 255 := 4;
constant L1TM_COMPILER_REV_VERSION        : integer range 0 to 255 := 0;
constant L1TM_COMPILER_VERSION : std_logic_vector(31 downto 0) := X"00" &
           std_logic_vector(to_unsigned(L1TM_COMPILER_MAJOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(L1TM_COMPILER_MINOR_VERSION, 8)) &
           std_logic_vector(to_unsigned(L1TM_COMPILER_REV_VERSION, 8));

constant SVN_REVISION_NUMBER : std_logic_vector(31 downto 0) := X"00000000";
constant L1TM_UID_HASH : std_logic_vector(31 downto 0) := conv_std_logic_vector(1917747160, 32);
constant FW_UID_HASH : std_logic_vector(31 downto 0) := conv_std_logic_vector(-656537375, 32);

-- content of algo_index.vhd generated by VHDL Producer formerly

-- HB 2016-09-16: constants for algo_mapping_rop.
type global_index_array is array (0 to NR_ALGOS-1) of integer;
constant global_index: global_index_array := (
         27, -- module_index: 0, name: L1_Centrality_50_100
         28, -- module_index: 1, name: L1_Centrality_Saturation
         21, -- module_index: 2, name: L1_UnpairedBunchBptxMinus
         20, -- module_index: 3, name: L1_UnpairedBunchBptxPlus
         18, -- module_index: 4, name: L1_ETM120
         19, -- module_index: 5, name: L1_ETMHF120
         25, -- module_index: 6, name: L1_ETTAsym40
         26, -- module_index: 7, name: L1_ETTAsym50
         17, -- module_index: 8, name: L1_HTT280er
         24, -- module_index: 9, name: L1_MinimumBiasHF0_AND_BptxAND
          4, -- module_index: 10, name: L1_DoubleEG5
          6, -- module_index: 11, name: L1_SingleJet120_FWD3p0
          5, -- module_index: 12, name: L1_SingleJet60_FWD3p0
         14, -- module_index: 13, name: L1_TripleJet_95_75_65_DoubleJet_75_65_er2p5
         15, -- module_index: 14, name: L1_QuadJet_95_75_65_20_DoubleJet_75_65_er2p5_Jet20_FWD3p0
          1, -- module_index: 15, name: L1_DoubleMu0
         10, -- module_index: 16, name: L1_TripleMu0_OQ
          0, -- module_index: 17, name: L1_QuadMuOpen_OS
         16, -- module_index: 18, name: L1_QuadJet60er2p5
         22, -- module_index: 19, name: L1_DoubleJet_100_30_DoubleJet30_Mass_Min620
         23, -- module_index: 20, name: L1_DoubleJet_110_35_DoubleJet35_Mass_Min620
          7, -- module_index: 21, name: L1_DoubleJet30er2p5_Mass_Min250_dEta_Max1p5
          8, -- module_index: 22, name: L1_DoubleJet30er2p5_Mass_Min300_dEta_Max1p5
          9, -- module_index: 23, name: L1_DoubleJet30er2p5_Mass_Min330_dEta_Max1p5
          2, -- module_index: 24, name: L1_SingleEG12_SingleJet28_MidEta2p7_MinDr0p4
          3, -- module_index: 25, name: L1_SingleEG15_SingleJet28_MidEta2p7_MinDr0p4
         11, -- module_index: 26, name: L1_Mu3_Jet35er2p5_dR_Max0p4
         12, -- module_index: 27, name: L1_Mu3_Jet60er2p5_dR_Max0p4
         13, -- module_index: 28, name: L1_DoubleJet35_Mass_Min450_IsoTau45_RmOvlp
    others => 0
);

end package;