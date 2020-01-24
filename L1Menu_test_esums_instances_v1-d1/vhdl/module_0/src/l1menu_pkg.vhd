-- Description:
-- Package generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_test_esums_instances_v1

-- Unique ID of L1 Trigger Menu:
-- f7b5ee69-e72e-4011-aa54-9fdcb44159a6

-- Unique ID of firmware implementation:
-- 0192500b-b6f5-4bad-97c3-cd089407f968

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
constant NR_ALGOS : positive := 41; -- number of algorithmns (min. 32 for FDL registers width !!!) - written by TME

constant MODULE_ID : integer := 0;
-- -- HB 2014-02-28: changed to UUID generated by TME (128 bits = 4 x 32 bits)
constant L1TM_UID : std_logic_vector(127 downto 0) := X"f7b5ee69e72e4011aa549fdcb44159a6";
-- -- HB 2014-05-21: L1TM_NAME generated by TME (1024 bits = 32 x 32 bits)
-- -- has to be interpreted as 128 ASCII-characters (from right to left)
constant L1TM_NAME : std_logic_vector(128*8-1 downto 0) := X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000031765f7365636e6174736e695f736d7573655f747365745f756e654d314c";

-- -- Unique fireware instance ID generated by the compiler, provided to keep track of multiple menu implementations.
constant L1TM_FW_UID : std_logic_vector(127 downto 0) := X"0192500bb6f54bad97c3cd089407f968";
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
constant L1TM_UID_HASH : std_logic_vector(31 downto 0) := X"0875ED65";
constant FW_UID_HASH : std_logic_vector(31 downto 0) := X"D9702A97";

-- content of algo_index.vhd generated by VHDL Producer formerly

-- HB 2016-09-16: constants for algo_mapping_rop.
type global_index_array is array (0 to NR_ALGOS-1) of integer;
constant global_index: global_index_array := (
        416, -- module_index: 0, name: L1_ETM120
        417, -- module_index: 1, name: L1_ETM150
        421, -- module_index: 2, name: L1_ETMHF100
        444, -- module_index: 3, name: L1_ETMHF110_HTT60er_NotSecondBunchInTrain
        429, -- module_index: 4, name: L1_ETMHF100_HTT60er
        461, -- module_index: 5, name: L1_MinimumBiasHF0_AND_BptxAND
        150, -- module_index: 6, name: L1_DoubleMu3_SQ_HTT220er
        431, -- module_index: 7, name: L1_ETMHF120_HTT60er
        151, -- module_index: 8, name: L1_DoubleMu3_SQ_HTT240er
        423, -- module_index: 9, name: L1_ETMHF120
        148, -- module_index: 10, name: L1_DoubleMu3_SQ_ETMHF60_Jet60er2p5
        428, -- module_index: 11, name: L1_ETMHF90_HTT60er
        152, -- module_index: 12, name: L1_DoubleMu3_SQ_HTT260er
        145, -- module_index: 13, name: L1_DoubleMu3_SQ_ETMHF50_HTT60er
        132, -- module_index: 14, name: L1_Mu6_HTT250er
        443, -- module_index: 15, name: L1_ETMHF120_NotSecondBunchInTrain
        422, -- module_index: 16, name: L1_ETMHF110
        432, -- module_index: 17, name: L1_ETMHF130_HTT60er
        430, -- module_index: 18, name: L1_ETMHF110_HTT60er
        146, -- module_index: 19, name: L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5_OR_DoubleJet40er2p5
        424, -- module_index: 20, name: L1_ETMHF130
        131, -- module_index: 21, name: L1_Mu6_HTT240er
        147, -- module_index: 22, name: L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5
        425, -- module_index: 23, name: L1_ETMHF140
        426, -- module_index: 24, name: L1_ETMHF150
        410, -- module_index: 25, name: L1_ETT1200
        411, -- module_index: 26, name: L1_ETT1600
        412, -- module_index: 27, name: L1_ETT2000
        398, -- module_index: 28, name: L1_HTT120er
        399, -- module_index: 29, name: L1_HTT160er
        400, -- module_index: 30, name: L1_HTT200er
        401, -- module_index: 31, name: L1_HTT255er
        402, -- module_index: 32, name: L1_HTT280er
        384, -- module_index: 33, name: L1_HTT280er_QuadJet_70_55_40_35_er2p4
        403, -- module_index: 34, name: L1_HTT320er
        385, -- module_index: 35, name: L1_HTT320er_QuadJet_70_55_40_40_er2p4
        387, -- module_index: 36, name: L1_HTT320er_QuadJet_80_60_er2p1_50_45_er2p3
        386, -- module_index: 37, name: L1_HTT320er_QuadJet_80_60_er2p1_45_40_er2p3
        404, -- module_index: 38, name: L1_HTT360er
        405, -- module_index: 39, name: L1_HTT400er
        406, -- module_index: 40, name: L1_HTT450er
    others => 0
);

end package;