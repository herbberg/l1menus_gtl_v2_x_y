-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 5

-- Name of L1 Trigger Menu:
-- L1Menu_test_esums_instances_v1

-- Unique ID of L1 Trigger Menu:
-- f7b5ee69-e72e-4011-aa54-9fdcb44159a6

-- Unique ID of firmware implementation:
-- 0f60d609-97a3-4ed7-b9ca-23c30a19b2c6

-- Scale set:
-- scales_2017_05_23

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
    signal comp_pt_ett_bx_0_0x0960 : ett_obj_t;
    signal comp_pt_htt_bx_0_0x0190 : htt_obj_t;
    signal comp_pt_htt_bx_0_0x0320 : htt_obj_t;
-- Correlation cuts
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_ett_bx_0_pt_0960_phi_0000_0000_0000_0000 : ett_obj_t;
   signal comb_htt_bx_0_pt_0190_phi_0000_0000_0000_0000 : htt_obj_t;
   signal comb_htt_bx_0_pt_0320_phi_0000_0000_0000_0000 : htt_obj_t;
-- Signal definition for conditions names
    signal single_ett_i36 : std_logic;
    signal single_htt_i2 : std_logic;
    signal single_htt_i7 : std_logic;
-- Signal definition for algorithms names
    signal l1_htt200er : std_logic;
    signal l1_htt400er : std_logic;
    signal l1_ett1200 : std_logic;
begin
-- First stage: calculations
    
-- Second stage: comparisons
    comp_pt_ett_bx_0_0x0960_i: entity work.comparators_obj_cuts
        generic map(
            N_ETT_OBJECTS, ETT_PT_WIDTH,  
            GE,  
            X"0960", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.ett(bx(0)).pt, comp_pt_ett_bx_0_0x0960
        );
    comp_pt_htt_bx_0_0x0190_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,  
            GE,  
            X"0190", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, comp_pt_htt_bx_0_0x0190
        );
    comp_pt_htt_bx_0_0x0320_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,  
            GE,  
            X"0320", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, comp_pt_htt_bx_0_0x0320
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_ett_bx_0_pt_0960_phi_0000_0000_0000_0000 <= 
    comp_pt_ett_bx_0_0x0960
    ;

    comb_htt_bx_0_pt_0190_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x0190
    ;

    comb_htt_bx_0_pt_0320_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x0320
    ;

    -- Instantiations of conditions
    cond_single_ett_i36_i: entity work.combinatorial_conditions
        generic map(
            N_ETT_OBJECTS, 1,
            ((0,0), (0,0), (0,0), (0,0)), 
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_ett_bx_0_pt_0960_phi_0000_0000_0000_0000,
            cond_o => single_ett_i36
        );
    cond_single_htt_i2_i: entity work.combinatorial_conditions
        generic map(
            N_HTT_OBJECTS, 1,
            ((0,0), (0,0), (0,0), (0,0)), 
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_htt_bx_0_pt_0190_phi_0000_0000_0000_0000,
            cond_o => single_htt_i2
        );
    cond_single_htt_i7_i: entity work.combinatorial_conditions
        generic map(
            N_HTT_OBJECTS, 1,
            ((0,0), (0,0), (0,0), (0,0)), 
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_htt_bx_0_pt_0320_phi_0000_0000_0000_0000,
            cond_o => single_htt_i7
        );    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 400 L1_HTT200er : HTT200
    l1_htt200er <= single_htt_i2;
    algo(1) <= l1_htt200er;
-- 405 L1_HTT400er : HTT400
    l1_htt400er <= single_htt_i7;
    algo(2) <= l1_htt400er;
-- 410 L1_ETT1200 : ETT1200
    l1_ett1200 <= single_ett_i36;
    algo(0) <= l1_ett1200;

end architecture rtl;
