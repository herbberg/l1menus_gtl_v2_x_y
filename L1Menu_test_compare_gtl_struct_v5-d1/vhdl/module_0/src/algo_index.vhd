-- ========================================================
-- from VHDL producer:

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

-- HB 2016-09-16: constants for algo_mapping_rop.
type global_index_array is array (0 to NR_ALGOS-1) of integer;
constant global_index: global_index_array := (
          0, -- module_index: 0, name: L1_Test_Jet30_Tau45_Rmovlp
          1, -- module_index: 1, name: L1_Test_DoubleJet30_Tau45_Rmovlp
          2, -- module_index: 2, name: L1_Test_TripleJet30_Tau45_Rmovlp
          3, -- module_index: 3, name: L1_Test_QuadJet30_Tau45_Rmovlp
    others => 0
);

-- ========================================================