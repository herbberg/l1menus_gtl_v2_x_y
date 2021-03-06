-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 4

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
    signal comp_pt_etm_bx_0_0x00f0 : etm_obj_t;
    signal comp_pt_ett_bx_0_0x0c80 : ett_obj_t;
    signal comp_pt_htt_bx_0_0x01fe : htt_obj_t;
    signal comp_pt_htt_bx_0_0x0384 : htt_obj_t;
-- Correlation cuts
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_etm_bx_0_pt_00f0_phi_0000_0000_0000_0000 : etm_obj_t;
   signal comb_ett_bx_0_pt_0c80_phi_0000_0000_0000_0000 : ett_obj_t;
   signal comb_htt_bx_0_pt_01fe_phi_0000_0000_0000_0000 : htt_obj_t;
   signal comb_htt_bx_0_pt_0384_phi_0000_0000_0000_0000 : htt_obj_t;
-- Signal definition for conditions names
    signal single_etm_i27 : std_logic;
    signal single_ett_i25 : std_logic;
    signal single_htt_i20 : std_logic;
    signal single_htt_i23 : std_logic;
-- Signal definition for algorithms names
    signal l1_htt255er : std_logic;
    signal l1_htt450er : std_logic;
    signal l1_ett1600 : std_logic;
    signal l1_etm120 : std_logic;
begin
-- First stage: calculations
    
-- Second stage: comparisons
    comp_pt_etm_bx_0_0x00f0_i: entity work.comparators_obj_cuts
        generic map(
            N_ETM_OBJECTS, ETM_PT_WIDTH,  
            GE,  
            X"00F0", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.etm(bx(0)).pt, comp_pt_etm_bx_0_0x00f0
        );
    comp_pt_ett_bx_0_0x0c80_i: entity work.comparators_obj_cuts
        generic map(
            N_ETT_OBJECTS, ETT_PT_WIDTH,  
            GE,  
            X"0C80", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.ett(bx(0)).pt, comp_pt_ett_bx_0_0x0c80
        );
    comp_pt_htt_bx_0_0x01fe_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,  
            GE,  
            X"01FE", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, comp_pt_htt_bx_0_0x01fe
        );
    comp_pt_htt_bx_0_0x0384_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,  
            GE,  
            X"0384", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, comp_pt_htt_bx_0_0x0384
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_etm_bx_0_pt_00f0_phi_0000_0000_0000_0000 <= 
    comp_pt_etm_bx_0_0x00f0
    ;

    comb_ett_bx_0_pt_0c80_phi_0000_0000_0000_0000 <= 
    comp_pt_ett_bx_0_0x0c80
    ;

    comb_htt_bx_0_pt_01fe_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x01fe
    ;

    comb_htt_bx_0_pt_0384_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x0384
    ;

    -- Instantiations of conditions
    single_etm_i27 <= 
            comb_etm_bx_0_pt_00f0_phi_0000_0000_0000_0000(0);
    single_ett_i25 <= 
            comb_ett_bx_0_pt_0c80_phi_0000_0000_0000_0000(0);
    single_htt_i20 <= 
            comb_htt_bx_0_pt_01fe_phi_0000_0000_0000_0000(0);
    single_htt_i23 <= 
            comb_htt_bx_0_pt_0384_phi_0000_0000_0000_0000(0);    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 401 L1_HTT255er : HTT255
    l1_htt255er <= single_htt_i20;
    algo(2) <= l1_htt255er;
-- 406 L1_HTT450er : HTT450
    l1_htt450er <= single_htt_i23;
    algo(3) <= l1_htt450er;
-- 411 L1_ETT1600 : ETT1600
    l1_ett1600 <= single_ett_i25;
    algo(1) <= l1_ett1600;
-- 416 L1_ETM120 : ETM120
    l1_etm120 <= single_etm_i27;
    algo(0) <= l1_etm120;

end architecture rtl;
