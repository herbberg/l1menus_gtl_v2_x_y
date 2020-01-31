-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 2

-- Name of L1 Trigger Menu:
-- L1Menu_test_esums_minbias_asym_instances_v1

-- Unique ID of L1 Trigger Menu:
-- edfc849a-10f6-4370-9364-b48895bb5776

-- Unique ID of firmware implementation:
-- 37294b6c-0ba0-452e-ba85-9e56ac7d03b7

-- Scale set:
-- scales_2018_08_07

-- VHDL producer version
-- v3.1.1
-- ========================================================

library ieee;
use ieee.std_logic_1164.all;

use work.lhc_data_pkg.all;
use work.gtl_pkg.all;
use work.lut_pkg.all;
use work.l1menu_pkg.all;

entity l1menu is
    port(
        lhc_clk : in std_logic;
        data : in data_pipeline_record;
        conv : in conv_pipeline_record;
        algo : out std_logic_vector(NR_ALGOS-1 downto 0));
end l1menu;

architecture rtl of l1menu is
-- Calculations outputs
    -- Differences
    -- Correlation cuts
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_count_asymht_bx_0_0x003c : asymht_obj_t;
    signal comp_pt_etmhf_bx_0_0x012c : etmhf_obj_t;
    signal comp_pt_htt_bx_0_0x0140 : htt_obj_t;
    signal comp_pt_htt_bx_0_0x02d0 : htt_obj_t;
-- Correlation cuts
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_asymht_bx_0_count_003c : asymht_obj_t;
   signal comb_etmhf_bx_0_pt_012c_phi_0000_0000_0000_0000 : etmhf_obj_t;
   signal comb_htt_bx_0_pt_0140_phi_0000_0000_0000_0000 : htt_obj_t;
   signal comb_htt_bx_0_pt_02d0_phi_0000_0000_0000_0000 : htt_obj_t;
-- Signal definition for conditions names
    signal single_asymht_i44 : std_logic;
    signal single_etmhf_i34 : std_logic;
    signal single_htt_i18 : std_logic;
    signal single_htt_i21 : std_logic;
-- Signal definition for algorithms names
    signal l1_asymht60 : std_logic;
    signal l1_htt160er : std_logic;
    signal l1_htt360er : std_logic;
    signal l1_etmhf150 : std_logic;
begin
-- First stage: calculations
    
-- Second stage: comparisons
    comp_count_asymht_bx_0_0x003c_i: entity work.comparators_obj_cuts
        generic map(
            N_ASYMHT_OBJECTS, ASYMHT_WIDTH,
            GE, X"003c", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.asymht(bx(0)).count, comp_count_asymht_bx_0_0x003c
        );
    comp_pt_etmhf_bx_0_0x012c_i: entity work.comparators_obj_cuts
        generic map(
            N_ETMHF_OBJECTS, ETMHF_PT_WIDTH,  
            GE,  
            X"012C", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.etmhf(bx(0)).pt, comp_pt_etmhf_bx_0_0x012c
        );
    comp_pt_htt_bx_0_0x0140_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,  
            GE,  
            X"0140", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, comp_pt_htt_bx_0_0x0140
        );
    comp_pt_htt_bx_0_0x02d0_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,  
            GE,  
            X"02D0", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, comp_pt_htt_bx_0_0x02d0
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_asymht_bx_0_count_003c <= 
    comp_count_asymht_bx_0_0x003c;

    comb_etmhf_bx_0_pt_012c_phi_0000_0000_0000_0000 <= 
    comp_pt_etmhf_bx_0_0x012c
    ;

    comb_htt_bx_0_pt_0140_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x0140
    ;

    comb_htt_bx_0_pt_02d0_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x02d0
    ;

    -- Instantiations of conditions
    single_asymht_i44 <=
        comb_asymht_bx_0_count_003c(0);
    single_etmhf_i34 <= 
            comb_etmhf_bx_0_pt_012c_phi_0000_0000_0000_0000(0);
    single_htt_i18 <= 
            comb_htt_bx_0_pt_0140_phi_0000_0000_0000_0000(0);
    single_htt_i21 <= 
            comb_htt_bx_0_pt_02d0_phi_0000_0000_0000_0000(0);    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 1 L1_Asymht60 : ASYMHT60
    l1_asymht60 <= single_asymht_i44;
    algo(0) <= l1_asymht60;
-- 399 L1_HTT160er : HTT160
    l1_htt160er <= single_htt_i18;
    algo(2) <= l1_htt160er;
-- 404 L1_HTT360er : HTT360
    l1_htt360er <= single_htt_i21;
    algo(3) <= l1_htt360er;
-- 426 L1_ETMHF150 : ETMHF150
    l1_etmhf150 <= single_etmhf_i34;
    algo(1) <= l1_etmhf150;

end architecture rtl;
