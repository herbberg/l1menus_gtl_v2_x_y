-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 2

-- Name of L1 Trigger Menu:
-- L1Menu_test_compare_gtl_struct_v9

-- Unique ID of L1 Trigger Menu:
-- d0ac5f69-0ce0-4345-9031-a966e72e5b78

-- Unique ID of firmware implementation:
-- 2ac41273-10fb-4036-8c80-2cbbb9360c60

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
    signal deta_calc_tau_tau : obj_bx_max_eta_range_array;
    signal deta_calc_tau_jet : obj_bx_max_eta_range_array;
    signal deta_calc_eg_eg : obj_bx_max_eta_range_array;
    signal deta_calc_eg_tau : obj_bx_max_eta_range_array;
    signal dphi_calc_tau_jet : obj_bx_max_phi_range_array;
    signal dphi_calc_eg_eg : obj_bx_max_phi_range_array;
    signal dphi_calc_eg_tau : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal deta_tau_tau :  obj_bx_corr_cuts_std_logic_array;
    signal tbpt_tau_tau :  obj_bx_corr_cuts_std_logic_array;
    signal dr_tau_jet :  obj_bx_corr_cuts_std_logic_array;
    signal deta_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal invmass_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal tbpt_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal dr_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal deta_tau_jet :  obj_bx_corr_cuts_std_logic_array;
    signal deta_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_tau_jet :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_tau_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_tau_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_pt_eg_bx_0_0x000a : eg_obj_t;
    signal comp_pt_eg_bx_0_0x0014 : eg_obj_t;
    signal comp_pt_tau_bx_m1_0x0036 : tau_obj_t;
    signal comp_pt_tau_bx_0_0x0036 : tau_obj_t;
    signal comp_pt_jet_bx_0_0x0038 : jet_obj_t;
    signal comp_pt_eg_bx_0_0x0080 : eg_obj_t;
    signal comp_pt_eg_bx_0_0x006c : eg_obj_t;
    signal comp_pt_tau_bx_0_0x008c : tau_obj_t;
-- Correlation cuts
    signal comp_deta_tau_tau_bx_m1_bx_0_0x00000000000000_0x000000000005dc : tau_tau_t;
    signal comp_tbpt_tau_tau_bx_m1_bx_0_0x00000253734d80 : tau_tau_t;
    signal comp_dr_tau_jet_bx_m1_bx_0_0x00000000000000_0x0000000000a028 : tau_jet_t;
    signal comp_deta_eg_eg_bx_0_bx_0_0x00000000000000_0x000000000005dc : eg_eg_t;
    signal comp_invmass_eg_eg_bx_0_bx_0_0x00000000000000_0x00000001312d00 : eg_eg_t;
    signal comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80 : eg_eg_t;
    signal comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028 : eg_tau_t;
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_eg_bx_0_pt_000a_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_tau_bx_m1_pt_0036_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : tau_obj_t;
   signal comb_tau_bx_0_pt_0036_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : tau_obj_t;
   signal comb_jet_bx_0_pt_0038_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_eg_bx_0_pt_0080_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_006c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_tau_bx_0_pt_008c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : tau_obj_t;
-- Signal definition for conditions names
    signal calo_calo_correlation_ov_rm_i24 : std_logic;
    signal invariant_mass_ov_rm_i18 : std_logic;
    signal double_eg_i0 : std_logic;
-- Signal definition for algorithms names
    signal l1_test_0 : std_logic;
    signal l1_test_11 : std_logic;
    signal l1_test_17 : std_logic;
begin
-- First stage: calculations
  
    calc_deta_tau_tau_bx_m1_bx_0_i: entity work.deta_calc
        generic map(
            N_TAU_OBJECTS, N_TAU_OBJECTS, (tau_t,tau_t), (bx(-1),bx(0))
        )
        port map(
            conv.tau(bx(-1)).eta,
            conv.tau(bx(0)).eta,
            deta_calc_tau_tau(bx(-1),bx(0))
        );
    calc_deta_lut_tau_tau_bx_m1_bx_0_i: entity work.deta_lut
        generic map(
            N_TAU_OBJECTS, N_TAU_OBJECTS, (tau_t,tau_t), (bx(-1),bx(0))
        )
        port map(
            deta_calc_tau_tau(bx(-1),bx(0)),
            deta_tau_tau(bx(-1),bx(0))
        );
  
    calc_deta_tau_jet_bx_m1_bx_0_i: entity work.deta_calc
        generic map(
            N_TAU_OBJECTS, N_JET_OBJECTS, (tau_t,jet_t), (bx(-1),bx(0))
        )
        port map(
            conv.tau(bx(-1)).eta,
            conv.jet(bx(0)).eta,
            deta_calc_tau_jet(bx(-1),bx(0))
        );
    calc_deta_lut_tau_jet_bx_m1_bx_0_i: entity work.deta_lut
        generic map(
            N_TAU_OBJECTS, N_JET_OBJECTS, (tau_t,jet_t), (bx(-1),bx(0))
        )
        port map(
            deta_calc_tau_jet(bx(-1),bx(0)),
            deta_tau_jet(bx(-1),bx(0))
        );
  
    calc_deta_eg_eg_bx_0_bx_0_i: entity work.deta_calc
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0))
        )
        port map(
            conv.eg(bx(0)).eta,
            conv.eg(bx(0)).eta,
            deta_calc_eg_eg(bx(0),bx(0))
        );
    calc_deta_lut_eg_eg_bx_0_bx_0_i: entity work.deta_lut
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_eg_eg(bx(0),bx(0)),
            deta_eg_eg(bx(0),bx(0))
        );
  
    calc_deta_eg_tau_bx_0_bx_0_i: entity work.deta_calc
        generic map(
            N_EG_OBJECTS, N_TAU_OBJECTS, (eg_t,tau_t), (bx(0),bx(0))
        )
        port map(
            conv.eg(bx(0)).eta,
            conv.tau(bx(0)).eta,
            deta_calc_eg_tau(bx(0),bx(0))
        );
    calc_deta_lut_eg_tau_bx_0_bx_0_i: entity work.deta_lut
        generic map(
            N_EG_OBJECTS, N_TAU_OBJECTS, (eg_t,tau_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_eg_tau(bx(0),bx(0)),
            deta_eg_tau(bx(0),bx(0))
        );
  
    calc_dphi_tau_jet_bx_m1_bx_0_i: entity work.dphi_calc
        generic map(
            N_TAU_OBJECTS, N_JET_OBJECTS, (tau_t,jet_t), (bx(-1),bx(0)),
            TAU_JET_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.tau(bx(-1)).phi,
            conv.jet(bx(0)).phi,
            dphi_calc_tau_jet(bx(-1),bx(0))
        );
    calc_dphi_lut_tau_jet_bx_m1_bx_0_i: entity work.dphi_lut
        generic map(
            N_TAU_OBJECTS, N_JET_OBJECTS, (tau_t,jet_t), (bx(-1),bx(0))
        )
        port map(
            dphi_calc_tau_jet(bx(-1),bx(0)),
            dphi_tau_jet(bx(-1),bx(0))
        );
  
    calc_dphi_eg_eg_bx_0_bx_0_i: entity work.dphi_calc
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0)),
            EG_EG_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.eg(bx(0)).phi,
            conv.eg(bx(0)).phi,
            dphi_calc_eg_eg(bx(0),bx(0))
        );
    calc_dphi_lut_eg_eg_bx_0_bx_0_i: entity work.dphi_lut
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_eg_eg(bx(0),bx(0)),
            dphi_eg_eg(bx(0),bx(0))
        );
  
    calc_dphi_eg_tau_bx_0_bx_0_i: entity work.dphi_calc
        generic map(
            N_EG_OBJECTS, N_TAU_OBJECTS, (eg_t,tau_t), (bx(0),bx(0)),
            EG_TAU_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.eg(bx(0)).phi,
            conv.tau(bx(0)).phi,
            dphi_calc_eg_tau(bx(0),bx(0))
        );
    calc_dphi_lut_eg_tau_bx_0_bx_0_i: entity work.dphi_lut
        generic map(
            N_EG_OBJECTS, N_TAU_OBJECTS, (eg_t,tau_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_eg_tau(bx(0),bx(0)),
            dphi_eg_tau(bx(0),bx(0))
        );
    calc_twobody_pt_tau_tau_bx_m1_bx_0_i: entity work.twobody_pt
        generic map(
            N_TAU_OBJECTS, N_TAU_OBJECTS,
            TAU_PT_VECTOR_WIDTH, TAU_PT_VECTOR_WIDTH
        )
        port map(
            conv.tau(bx(-1)).pt_vector,
            conv.tau(bx(0)).pt_vector,
            conv.tau(bx(-1)).cos_phi,
            conv.tau(bx(0)).cos_phi,
            conv.tau(bx(-1)).sin_phi,
            conv.tau(bx(0)).sin_phi,
            tbpt_tau_tau(bx(-1),bx(0))
       );
    calc_delta_r_tau_jet_bx_m1_bx_0_i: entity work.delta_r
        generic map(
            N_TAU_OBJECTS, N_JET_OBJECTS, (tau_t,jet_t), (bx(-1),bx(0))
        )
        port map(
            deta_tau_jet(bx(-1),bx(0)),
            dphi_tau_jet(bx(-1),bx(0)),
            dr_tau_jet(bx(-1),bx(0))
        );
    calc_cosh_deta_eg_eg_bx_0_bx_0_i: entity work.cosh_deta_lut
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_eg_eg(bx(0),bx(0)),
            cosh_deta_eg_eg(bx(0),bx(0))
        );
    calc_cos_dphi_eg_eg_bx_0_bx_0_i: entity work.cos_dphi_lut
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_eg_eg(bx(0),bx(0)),
            cos_dphi_eg_eg(bx(0),bx(0))
        );
    calc_inv_mass_eg_eg_bx_0_bx_0_i: entity work.invariant_mass
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0)),
            EG_PT_VECTOR_WIDTH, EG_PT_VECTOR_WIDTH,
            EG_EG_COSH_COS_VECTOR_WIDTH
        )
        port map(
            conv.eg(bx(0)).pt_vector,
            conv.eg(bx(0)).pt_vector,
            cosh_deta_eg_eg(bx(0),bx(0)),
            cos_dphi_eg_eg(bx(0),bx(0)),
            invmass_eg_eg(bx(0),bx(0))
       );
    calc_twobody_pt_eg_eg_bx_0_bx_0_i: entity work.twobody_pt
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS,
            EG_PT_VECTOR_WIDTH, EG_PT_VECTOR_WIDTH
        )
        port map(
            conv.eg(bx(0)).pt_vector,
            conv.eg(bx(0)).pt_vector,
            conv.eg(bx(0)).cos_phi,
            conv.eg(bx(0)).cos_phi,
            conv.eg(bx(0)).sin_phi,
            conv.eg(bx(0)).sin_phi,
            tbpt_eg_eg(bx(0),bx(0))
       );
    calc_delta_r_eg_tau_bx_0_bx_0_i: entity work.delta_r
        generic map(
            N_EG_OBJECTS, N_TAU_OBJECTS, (eg_t,tau_t), (bx(0),bx(0))
        )
        port map(
            deta_eg_tau(bx(0),bx(0)),
            dphi_eg_tau(bx(0),bx(0)),
            dr_eg_tau(bx(0),bx(0))
        );
    
-- Second stage: comparisons
    comp_pt_eg_bx_0_0x000a_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"000A", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x000a
        );
    comp_pt_eg_bx_0_0x0014_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0014", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0014
        );
    comp_pt_tau_bx_m1_0x0036_i: entity work.comparators_obj_cuts
        generic map(
            N_TAU_OBJECTS, TAU_PT_WIDTH,  
            GE,  
            X"0036", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.tau(bx(-1)).pt, comp_pt_tau_bx_m1_0x0036
        );
    comp_pt_tau_bx_0_0x0036_i: entity work.comparators_obj_cuts
        generic map(
            N_TAU_OBJECTS, TAU_PT_WIDTH,  
            GE,  
            X"0036", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.tau(bx(0)).pt, comp_pt_tau_bx_0_0x0036
        );
    comp_pt_jet_bx_0_0x0038_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0038", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0038
        );
    comp_pt_eg_bx_0_0x0080_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0080", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0080
        );
    comp_pt_eg_bx_0_0x006c_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"006C", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x006c
        );
    comp_pt_tau_bx_0_0x008c_i: entity work.comparators_obj_cuts
        generic map(
            N_TAU_OBJECTS, TAU_PT_WIDTH,  
            GE,  
            X"008C", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.tau(bx(0)).pt, comp_pt_tau_bx_0_0x008c
        );
    comp_deta_tau_tau_bx_m1_bx_0_0x00000000000000_0x000000000005dc_i: entity work.comparators_corr_cuts
        generic map(
            N_TAU_OBJECTS, N_TAU_OBJECTS, (tau_t,tau_t), (bx(-1),bx(0)),
            TAU_TAU_DELTAETA_VECTOR_WIDTH, deltaEta, 
            X"00000000000000", X"000000000005DC"        
        )
        port map(
            lhc_clk, 
            deta_tau_tau(bx(-1),bx(0)), comp_deta_tau_tau_bx_m1_bx_0_0x00000000000000_0x000000000005dc
        );
    comp_tbpt_tau_tau_bx_m1_bx_0_0x00000253734d80_i: entity work.comparators_corr_cuts
        generic map(
            N_TAU_OBJECTS, N_TAU_OBJECTS, (tau_t,tau_t), (bx(-1),bx(0)),
            TAU_TAU_TBPT_VECTOR_WIDTH, twoBodyPt, 
            X"00000253734D80", X"00000000000000"        
        )
        port map(
            lhc_clk, 
            tbpt_tau_tau(bx(-1),bx(0)), comp_tbpt_tau_tau_bx_m1_bx_0_0x00000253734d80
        );

    comp_dr_tau_jet_bx_m1_bx_0_0x00000000000000_0x0000000000a028_i: entity work.comparators_corr_cuts
        generic map(
            N_TAU_OBJECTS, N_JET_OBJECTS, (tau_t,jet_t), (bx(-1),bx(0)),
            TAU_JET_DELTAR_VECTOR_WIDTH, deltaR, 
            X"00000000000000", X"0000000000A028"        
        )
        port map(
            lhc_clk, 
            dr_tau_jet(bx(-1),bx(0)), comp_dr_tau_jet_bx_m1_bx_0_0x00000000000000_0x0000000000a028
        );
    comp_deta_eg_eg_bx_0_bx_0_0x00000000000000_0x000000000005dc_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0)),
            EG_EG_DELTAETA_VECTOR_WIDTH, deltaEta, 
            X"00000000000000", X"000000000005DC"        
        )
        port map(
            lhc_clk, 
            deta_eg_eg(bx(0),bx(0)), comp_deta_eg_eg_bx_0_bx_0_0x00000000000000_0x000000000005dc
        );
    comp_invmass_eg_eg_bx_0_bx_0_0x00000000000000_0x00000001312d00_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0)),
            EG_EG_MASS_VECTOR_WIDTH, mass, 
            X"00000000000000", X"00000001312D00"        
        )
        port map(
            lhc_clk, 
            invmass_eg_eg(bx(0),bx(0)), comp_invmass_eg_eg_bx_0_bx_0_0x00000000000000_0x00000001312D00
        );
    comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0)),
            EG_EG_TBPT_VECTOR_WIDTH, twoBodyPt, 
            X"00000253734D80", X"00000000000000"        
        )
        port map(
            lhc_clk, 
            tbpt_eg_eg(bx(0),bx(0)), comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80
        );

    comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_TAU_OBJECTS, (eg_t,tau_t), (bx(0),bx(0)),
            EG_TAU_DELTAR_VECTOR_WIDTH, deltaR, 
            X"00000000000000", X"0000000000A028"        
        )
        port map(
            lhc_clk, 
            dr_eg_tau(bx(0),bx(0)), comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_eg_bx_0_pt_000a_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x000a
    ;

    comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0014
    ;

    comb_tau_bx_m1_pt_0036_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_tau_bx_m1_0x0036
    ;

    comb_tau_bx_0_pt_0036_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_tau_bx_0_0x0036
    ;

    comb_jet_bx_0_pt_0038_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0038
    ;

    comb_eg_bx_0_pt_0080_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0080
    ;

    comb_eg_bx_0_pt_006c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x006c
    ;

    comb_tau_bx_0_pt_008c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_tau_bx_0_0x008c
    ;

    -- Instantiations of conditions
    cond_double_eg_i0_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 2,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_000a_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            tbpt => comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80,
            cond_o => double_eg_i0
        );
    cond_calo_calo_correlation_ov_rm_i24_i: entity work.correlation_conditions_ovrm
        generic map(  
            N_TAU_OBJECTS, N_TAU_OBJECTS,  N_JET_OBJECTS,
            ((0,11), (0,11), (0,11), (0,0)),
            false,  
            true
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_tau_bx_m1_pt_0036_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_tau_bx_0_pt_0036_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_3 => 
            comb_jet_bx_0_pt_0038_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            deta => comp_deta_tau_tau_bx_m1_bx_0_0x00000000000000_0x000000000005dc, 
            tbpt => comp_tbpt_tau_tau_bx_m1_bx_0_0x00000253734d80, 
            dr_ovrm => comp_dr_tau_jet_bx_m1_bx_0_0x00000000000000_0x0000000000a028,
            cond_o => calo_calo_correlation_ov_rm_i24
        );
    cond_invariant_mass_ov_rm_i18_i: entity work.correlation_conditions_ovrm
        generic map(  
            N_EG_OBJECTS, N_EG_OBJECTS,  N_TAU_OBJECTS,
            ((0,11), (0,11), (0,11), (0,0)),
            false,  
            true
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_eg_bx_0_pt_0080_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_eg_bx_0_pt_006c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_3 => 
            comb_tau_bx_0_pt_008c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            deta => comp_deta_eg_eg_bx_0_bx_0_0x00000000000000_0x000000000005dc, 
            inv_mass => comp_invmass_eg_eg_bx_0_bx_0_0x00000000000000_0x00000001312d00, 
            tbpt => comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80, 
            dr_ovrm => comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028,
            cond_o => invariant_mass_ov_rm_i18
        );    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 0 L1_test_0 : comb{EG5,EG10}[TBPT_10]
    l1_test_0 <= double_eg_i0;
    algo(0) <= l1_test_0;
-- 11 L1_test_11 : mass_inv_orm{EG64,EG54,TAU70}[DETA_MAX_1p5,MASS_MASS_0to20,ORMDR_0p2,TBPT_10]
    l1_test_11 <= invariant_mass_ov_rm_i18;
    algo(2) <= l1_test_11;
-- 17 L1_test_17 : dist_orm{TAU27-1,TAU27,JET28}[DETA_MAX_1p5,ORMDR_0p2,TBPT_10]
    l1_test_17 <= calo_calo_correlation_ov_rm_i24;
    algo(1) <= l1_test_17;

end architecture rtl;
