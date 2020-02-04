-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_test_compare_gtl_struct_v11

-- Unique ID of L1 Trigger Menu:
-- cf20b3d8-7f9f-4e98-ab57-5c2c7a5db555

-- Unique ID of firmware implementation:
-- 2c016b5c-43d6-4090-94f9-db09a5e80811

-- Scale set:
-- scales_2017_05_23

-- VHDL producer version
-- v3.0.0
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
    signal deta_calc_jet_jet : obj_bx_max_eta_range_array;
    signal deta_calc_jet_tau : obj_bx_max_eta_range_array;
    signal dphi_calc_jet_tau : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal deta_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal dr_jet_tau :  obj_bx_corr_cuts_std_logic_array;
    signal deta_jet_tau :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_jet_tau :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_jet_tau :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_jet_tau :  obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_pt_jet_bx_m2_0x0028 : jet_obj_t;
    signal comp_pt_jet_bx_m1_0x003c : jet_obj_t;
    signal comp_pt_tau_bx_p1_0x0050 : tau_obj_t;
-- Correlation cuts
    signal comp_deta_jet_jet_bx_m2_bx_m1_0x00000000000000_0x000000000005dc : jet_jet_t;
    signal comp_dr_jet_tau_bx_m2_bx_p1_0x00000000000000_0x0000000000a028 : jet_tau_t;
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_jet_bx_m2_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m1_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_tau_bx_p1_pt_0050_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : tau_obj_t;
-- Signal definition for conditions names
    signal calo_calo_correlation_ov_rm_i0 : std_logic;
    signal single_eg_ov_rm_i10 : std_logic;
-- Signal definition for algorithms names
    signal l1_double_jet_m2_m1_deta_tau_p1_ormdr : std_logic;
    signal l1_single_eg_tau_ormdr : std_logic;
begin
-- First stage: calculations
  
    calc_deta_jet_jet_bx_m2_bx_m1_i: entity work.deta_calc
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(-2),bx(-1))
        )
        port map(
            conv.jet(bx(-2)).eta,
            conv.jet(bx(-1)).eta,
            deta_calc_jet_jet(bx(-2),bx(-1))
        );
    calc_deta_lut_jet_jet_bx_m2_bx_m1_i: entity work.deta_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(-2),bx(-1))
        )
        port map(
            deta_calc_jet_jet(bx(-2),bx(-1)),
            deta_jet_jet(bx(-2),bx(-1))
        );
  
    calc_deta_jet_tau_bx_m2_bx_p1_i: entity work.deta_calc
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t), (bx(-2),bx(1))
        )
        port map(
            conv.jet(bx(-2)).eta,
            conv.tau(bx(1)).eta,
            deta_calc_jet_tau(bx(-2),bx(1))
        );
    calc_deta_lut_jet_tau_bx_m2_bx_p1_i: entity work.deta_lut
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t), (bx(-2),bx(1))
        )
        port map(
            deta_calc_jet_tau(bx(-2),bx(1)),
            deta_jet_tau(bx(-2),bx(1))
        );
  
    calc_dphi_jet_tau_bx_m2_bx_p1_i: entity work.dphi_calc
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t), (bx(-2),bx(1)),
            JET_TAU_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.jet(bx(-2)).phi,
            conv.tau(bx(1)).phi,
            dphi_calc_jet_tau(bx(-2),bx(1))
        );
    calc_dphi_lut_jet_tau_bx_m2_bx_p1_i: entity work.dphi_lut
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t), (bx(-2),bx(1))
        )
        port map(
            dphi_calc_jet_tau(bx(-2),bx(1)),
            dphi_jet_tau(bx(-2),bx(1))
        );
    calc_delta_r_jet_tau_bx_m2_bx_p1_i: entity work.delta_r
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t), (bx(-2),bx(1))
        )
        port map(
            deta_jet_tau(bx(-2),bx(1)),
            dphi_jet_tau(bx(-2),bx(1)),
            dr_jet_tau(bx(-2),bx(1))
        );
    
-- Second stage: comparisons
    comp_pt_jet_bx_m2_0x0028_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0028", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-2)).pt, comp_pt_jet_bx_m2_0x0028
        );
    comp_pt_jet_bx_m1_0x003c_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"003C", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-1)).pt, comp_pt_jet_bx_m1_0x003c
        );
    comp_pt_tau_bx_p1_0x0050_i: entity work.comparators_obj_cuts
        generic map(
            N_TAU_OBJECTS, TAU_PT_WIDTH,  
            GE,  
            X"0050", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.tau(bx(1)).pt, comp_pt_tau_bx_p1_0x0050
        );
    comp_deta_jet_jet_bx_m2_bx_m1_0x00000000000000_0x000000000005dc_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(-2),bx(-1)),
            JET_JET_DELTAETA_VECTOR_WIDTH, deltaEta, 
            X"00000000000000", X"000000000005DC"        
        )
        port map(
            lhc_clk, 
            deta_jet_jet(bx(-2),bx(-1)), comp_deta_jet_jet_bx_m2_bx_m1_0x00000000000000_0x000000000005dc
        );
    comp_dr_jet_tau_bx_m2_bx_p1_0x00000000000000_0x0000000000a028_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t), (bx(-2),bx(1)),
            JET_TAU_DELTAR_VECTOR_WIDTH, deltaR, 
            X"00000000000000", X"0000000000A028"        
        )
        port map(
            lhc_clk, 
            dr_jet_tau(bx(-2),bx(1)), comp_dr_jet_tau_bx_m2_bx_p1_0x00000000000000_0x0000000000a028
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_jet_bx_m2_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m2_0x0028
    ;

    comb_jet_bx_m1_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m1_0x003c
    ;

    comb_tau_bx_p1_pt_0050_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_tau_bx_p1_0x0050
    ;

    -- Instantiations of conditions
    cond_single_eg_ov_rm_i10_i: entity work.combinatorial_conditions_ovrm
        generic map(  
            N_EG_OBJECTS, N_TAU_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            ((0,11), (0,0), (0,0), (0,0))
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_tau_bx_0_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            dr_ovrm => comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028,
            cond_o => single_eg_ov_rm_i10
        );


    cond_calo_calo_correlation_ov_rm_i0_i: entity work.correlation_conditions_ovrm
        generic map(  
            N_JET_OBJECTS, N_JET_OBJECTS,  N_TAU_OBJECTS,
            ((0,11), (0,11), (0,11), (0,0)),
            false,  
            true
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_m2_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_m1_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_3 => 
            comb_tau_bx_p1_pt_0050_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            deta => comp_deta_jet_jet_bx_m2_bx_m1_0x00000000000000_0x000000000005dc, 
            dr_ovrm => comp_dr_jet_tau_bx_m2_bx_p1_0x00000000000000_0x0000000000a028,
            cond_o => calo_calo_correlation_ov_rm_i0
        );    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 2 L1_double_jet_m2_m1_deta_tau_p1_ormdr : dist_orm{JET20-2,JET30-1,TAU40+1}[DETA_MAX_1p5,ORMDR_0p2]
    l1_double_jet_m2_m1_deta_tau_p1_ormdr <= calo_calo_correlation_ov_rm_i0;
    algo(1) <= l1_double_jet_m2_m1_deta_tau_p1_ormdr;
-- 4 L1_single_eg_tau_ormdr : comb_orm{EG20,TAU30}[ORMDR_0p2]
    l1_single_eg_tau_ormdr <= single_eg_ov_rm_i10;
    algo(0) <= l1_single_eg_tau_ormdr;

end architecture rtl;
