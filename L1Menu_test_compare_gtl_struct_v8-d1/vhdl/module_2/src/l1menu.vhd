-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 2

-- Name of L1 Trigger Menu:
-- L1Menu_test_compare_gtl_struct_v8

-- Unique ID of L1 Trigger Menu:
-- dfda5134-41bb-44ca-b09b-2ec83164a685

-- Unique ID of firmware implementation:
-- d4223b40-c799-434b-97cf-c0ab42fc8c47

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
    signal deta_calc_eg_eg : obj_bx_max_eta_range_array;
    signal deta_calc_eg_tau : obj_bx_max_eta_range_array;
    signal deta_calc_mu_mu : obj_bx_max_eta_range_array;
    signal dphi_calc_eg_eg : obj_bx_max_phi_range_array;
    signal dphi_calc_eg_tau : obj_bx_max_phi_range_array;
    signal dphi_calc_mu_mu : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal invmass_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal deta_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal invmass_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal tbpt_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal dr_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal deta_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_eg_tau :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_pt_eg_bx_0_0x000a : eg_obj_t;
    signal comp_pt_eg_bx_0_0x0014 : eg_obj_t;
    signal comp_pt_jet_bx_m2_0x002e : jet_obj_t;
    signal comp_pt_jet_bx_m2_0x0040 : jet_obj_t;
    signal comp_pt_jet_bx_m2_0x0044 : jet_obj_t;
    signal comp_pt_jet_bx_m2_0x0048 : jet_obj_t;
    signal comp_pt_jet_bx_m1_0x002e : jet_obj_t;
    signal comp_pt_jet_bx_m1_0x0040 : jet_obj_t;
    signal comp_pt_jet_bx_m1_0x0044 : jet_obj_t;
    signal comp_pt_jet_bx_m1_0x0048 : jet_obj_t;
    signal comp_pt_jet_bx_0_0x002e : jet_obj_t;
    signal comp_pt_jet_bx_0_0x0040 : jet_obj_t;
    signal comp_pt_jet_bx_0_0x0044 : jet_obj_t;
    signal comp_pt_jet_bx_0_0x0048 : jet_obj_t;
    signal comp_pt_jet_bx_p1_0x002e : jet_obj_t;
    signal comp_pt_jet_bx_p1_0x0040 : jet_obj_t;
    signal comp_pt_jet_bx_p1_0x0044 : jet_obj_t;
    signal comp_pt_jet_bx_p1_0x0048 : jet_obj_t;
    signal comp_pt_jet_bx_p2_0x002e : jet_obj_t;
    signal comp_pt_jet_bx_p2_0x0040 : jet_obj_t;
    signal comp_pt_jet_bx_p2_0x0044 : jet_obj_t;
    signal comp_pt_jet_bx_p2_0x0048 : jet_obj_t;
    signal comp_pt_eg_bx_0_0x007c : eg_obj_t;
    signal comp_pt_eg_bx_0_0x0068 : eg_obj_t;
    signal comp_pt_tau_bx_0_0x008c : tau_obj_t;
    signal comp_pt_mu_bx_m2_0x0015 : mu_obj_t;
    signal comp_pt_mu_bx_m1_0x0015 : mu_obj_t;
-- Correlation cuts
    signal comp_invmass_mu_mu_bx_m2_bx_m1_0x00000000000000_0x0000000bebc200 : mu_mu_t;
    signal comp_deta_eg_eg_bx_0_bx_0_0x00000000000000_0x000000000005dc : eg_eg_t;
    signal comp_invmass_eg_eg_bx_0_bx_0_0x00000000000000_0x00000001312d00 : eg_eg_t;
    signal comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80_0x00000253734d80 : eg_eg_t;
    signal comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028 : eg_tau_t;
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_eg_bx_0_pt_000a_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_jet_bx_m2_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m2_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m2_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m2_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m1_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m1_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m1_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_m1_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p1_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p1_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p1_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p1_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p2_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p2_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p2_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_p2_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_eg_bx_0_pt_007c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_0068_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_tau_bx_0_pt_008c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : tau_obj_t;
   signal comb_mu_bx_m2_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign : mu_obj_t;
   signal comb_mu_bx_m1_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign : mu_obj_t;
-- Signal definition for conditions names
    signal invariant_mass_i24 : std_logic;
    signal invariant_mass_ov_rm_i18 : std_logic;
    signal double_eg_i0 : std_logic;
    signal quad_jet_i12 : std_logic;
    signal quad_jet_i13 : std_logic;
    signal quad_jet_i14 : std_logic;
    signal quad_jet_i15 : std_logic;
    signal quad_jet_i16 : std_logic;
-- Signal definition for algorithms names
    signal l1_test_0 : std_logic;
    signal l1_test_8 : std_logic;
    signal l1_test_10 : std_logic;
    signal l1_test_16 : std_logic;
begin
-- First stage: calculations
  
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
  
    calc_deta_mu_mu_bx_m2_bx_m1_i: entity work.deta_calc
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1))
        )
        port map(
            conv.mu(bx(-2)).eta,
            conv.mu(bx(-1)).eta,
            deta_calc_mu_mu(bx(-2),bx(-1))
        );
    calc_deta_lut_mu_mu_bx_m2_bx_m1_i: entity work.deta_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1))
        )
        port map(
            deta_calc_mu_mu(bx(-2),bx(-1)),
            deta_mu_mu(bx(-2),bx(-1))
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
  
    calc_dphi_mu_mu_bx_m2_bx_m1_i: entity work.dphi_calc
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1)),
            MU_MU_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.mu(bx(-2)).phi,
            conv.mu(bx(-1)).phi,
            dphi_calc_mu_mu(bx(-2),bx(-1))
        );
    calc_dphi_lut_mu_mu_bx_m2_bx_m1_i: entity work.dphi_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1))
        )
        port map(
            dphi_calc_mu_mu(bx(-2),bx(-1)),
            dphi_mu_mu(bx(-2),bx(-1))
        );
    calc_cosh_deta_mu_mu_bx_m2_bx_m1_i: entity work.cosh_deta_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1))
        )
        port map(
            deta_calc_mu_mu(bx(-2),bx(-1)),
            cosh_deta_mu_mu(bx(-2),bx(-1))
        );
    calc_cos_dphi_mu_mu_bx_m2_bx_m1_i: entity work.cos_dphi_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1))
        )
        port map(
            dphi_calc_mu_mu(bx(-2),bx(-1)),
            cos_dphi_mu_mu(bx(-2),bx(-1))
        );
    calc_inv_mass_mu_mu_bx_m2_bx_m1_i: entity work.invariant_mass
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1)),
            MU_PT_VECTOR_WIDTH, MU_PT_VECTOR_WIDTH,
            MU_MU_COSH_COS_VECTOR_WIDTH
        )
        port map(
            conv.mu(bx(-2)).pt_vector,
            conv.mu(bx(-1)).pt_vector,
            cosh_deta_mu_mu(bx(-2),bx(-1)),
            cos_dphi_mu_mu(bx(-2),bx(-1)),
            invmass_mu_mu(bx(-2),bx(-1))
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
    comp_pt_jet_bx_m2_0x002e_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"002E", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-2)).pt, comp_pt_jet_bx_m2_0x002e
        );
    comp_pt_jet_bx_m2_0x0040_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0040", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-2)).pt, comp_pt_jet_bx_m2_0x0040
        );
    comp_pt_jet_bx_m2_0x0044_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0044", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-2)).pt, comp_pt_jet_bx_m2_0x0044
        );
    comp_pt_jet_bx_m2_0x0048_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0048", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-2)).pt, comp_pt_jet_bx_m2_0x0048
        );
    comp_pt_jet_bx_m1_0x002e_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"002E", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-1)).pt, comp_pt_jet_bx_m1_0x002e
        );
    comp_pt_jet_bx_m1_0x0040_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0040", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-1)).pt, comp_pt_jet_bx_m1_0x0040
        );
    comp_pt_jet_bx_m1_0x0044_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0044", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-1)).pt, comp_pt_jet_bx_m1_0x0044
        );
    comp_pt_jet_bx_m1_0x0048_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0048", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(-1)).pt, comp_pt_jet_bx_m1_0x0048
        );
    comp_pt_jet_bx_0_0x002e_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"002E", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x002e
        );
    comp_pt_jet_bx_0_0x0040_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0040", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0040
        );
    comp_pt_jet_bx_0_0x0044_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0044", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0044
        );
    comp_pt_jet_bx_0_0x0048_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0048", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0048
        );
    comp_pt_jet_bx_p1_0x002e_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"002E", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(1)).pt, comp_pt_jet_bx_p1_0x002e
        );
    comp_pt_jet_bx_p1_0x0040_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0040", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(1)).pt, comp_pt_jet_bx_p1_0x0040
        );
    comp_pt_jet_bx_p1_0x0044_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0044", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(1)).pt, comp_pt_jet_bx_p1_0x0044
        );
    comp_pt_jet_bx_p1_0x0048_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0048", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(1)).pt, comp_pt_jet_bx_p1_0x0048
        );
    comp_pt_jet_bx_p2_0x002e_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"002E", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(2)).pt, comp_pt_jet_bx_p2_0x002e
        );
    comp_pt_jet_bx_p2_0x0040_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0040", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(2)).pt, comp_pt_jet_bx_p2_0x0040
        );
    comp_pt_jet_bx_p2_0x0044_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0044", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(2)).pt, comp_pt_jet_bx_p2_0x0044
        );
    comp_pt_jet_bx_p2_0x0048_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0048", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(2)).pt, comp_pt_jet_bx_p2_0x0048
        );
    comp_pt_eg_bx_0_0x007c_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"007C", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x007c
        );
    comp_pt_eg_bx_0_0x0068_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0068", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0068
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
    comp_pt_mu_bx_m2_0x0015_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"0015", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(-2)).pt, comp_pt_mu_bx_m2_0x0015
        );
    comp_pt_mu_bx_m1_0x0015_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"0015", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(-1)).pt, comp_pt_mu_bx_m1_0x0015
        );
    comp_invmass_mu_mu_bx_m2_bx_m1_0x00000000000000_0x0000000bebc200_i: entity work.comparators_corr_cuts
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(-2),bx(-1)),
            MU_MU_MASS_VECTOR_WIDTH, mass, 
            X"00000000000000", X"0000000BEBC200"        
        )
        port map(
            lhc_clk, 
            invmass_mu_mu(bx(-2),bx(-1)), comp_invmass_mu_mu_bx_m2_bx_m1_0x00000000000000_0x0000000BEBC200
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
    comp_tbpt_eg_eg_bx0_bx0_0x00000253734d80_i: entity work.conditions_corr_cuts
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0)),
            EG_EG_TBPT_VECTOR_WIDTH, twoBodyPt, 
            X"00000253734D80"        
        )
        port map(
            lhc_clk, 
            tbpt_eg_eg(bx(0),bx(0)), comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80_0x00000253734d80
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

    comb_jet_bx_m2_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m2_0x002e
    ;

    comb_jet_bx_m2_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m2_0x0040
    ;

    comb_jet_bx_m2_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m2_0x0044
    ;

    comb_jet_bx_m2_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m2_0x0048
    ;

    comb_jet_bx_m1_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m1_0x002e
    ;

    comb_jet_bx_m1_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m1_0x0040
    ;

    comb_jet_bx_m1_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m1_0x0044
    ;

    comb_jet_bx_m1_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_m1_0x0048
    ;

    comb_jet_bx_0_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x002e
    ;

    comb_jet_bx_0_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0040
    ;

    comb_jet_bx_0_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0044
    ;

    comb_jet_bx_0_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0048
    ;

    comb_jet_bx_p1_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p1_0x002e
    ;

    comb_jet_bx_p1_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p1_0x0040
    ;

    comb_jet_bx_p1_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p1_0x0044
    ;

    comb_jet_bx_p1_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p1_0x0048
    ;

    comb_jet_bx_p2_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p2_0x002e
    ;

    comb_jet_bx_p2_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p2_0x0040
    ;

    comb_jet_bx_p2_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p2_0x0044
    ;

    comb_jet_bx_p2_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_p2_0x0048
    ;

    comb_eg_bx_0_pt_007c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x007c
    ;

    comb_eg_bx_0_pt_0068_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0068
    ;

    comb_tau_bx_0_pt_008c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_tau_bx_0_0x008c
    ;

    comb_mu_bx_m2_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign <= 
    comp_pt_mu_bx_m2_0x0015
    ;

    comb_mu_bx_m1_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign <= 
    comp_pt_mu_bx_m1_0x0015
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
            tbpt => tbpt_eg_eg_bx_0_bx_0_0x00000253734d80_0x00000253734d80,
            cond_o => double_eg_i0
        );
    cond_quad_jet_i12_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 4,
            ((0,11), (0,11), (0,11), (0,11)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_jet_bx_m2_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_jet_bx_m2_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_3 =>
            comb_jet_bx_m2_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_4 =>
            comb_jet_bx_m2_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => quad_jet_i12
        );
    cond_quad_jet_i13_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 4,
            ((0,11), (0,11), (0,11), (0,11)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_jet_bx_m1_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_jet_bx_m1_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_3 =>
            comb_jet_bx_m1_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_4 =>
            comb_jet_bx_m1_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => quad_jet_i13
        );
    cond_quad_jet_i14_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 4,
            ((0,11), (0,11), (0,11), (0,11)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_jet_bx_0_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_jet_bx_0_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_3 =>
            comb_jet_bx_0_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_4 =>
            comb_jet_bx_0_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => quad_jet_i14
        );
    cond_quad_jet_i15_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 4,
            ((0,11), (0,11), (0,11), (0,11)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_jet_bx_p1_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_jet_bx_p1_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_3 =>
            comb_jet_bx_p1_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_4 =>
            comb_jet_bx_p1_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => quad_jet_i15
        );
    cond_quad_jet_i16_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 4,
            ((0,11), (0,11), (0,11), (0,11)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_jet_bx_p2_pt_002e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_jet_bx_p2_pt_0040_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_3 =>
            comb_jet_bx_p2_pt_0044_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_4 =>
            comb_jet_bx_p2_pt_0048_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => quad_jet_i16
        );
    cond_invariant_mass_i24_i: entity work.correlation_conditions
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS,
            ((0,7), (0,7), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_mu_bx_m2_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign,
            in_2 => 
            comb_mu_bx_m1_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign, 
            inv_mass => comp_invmass_mu_mu_bx_m2_bx_m1_0x00000000000000_0x0000000bebc200,
            cond_o => invariant_mass_i24
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
            comb_eg_bx_0_pt_007c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_eg_bx_0_pt_0068_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_3 => 
            comb_tau_bx_0_pt_008c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            deta => comp_deta_eg_eg_bx_0_bx_0_0x00000000000000_0x000000000005dc, 
            inv_mass => comp_invmass_eg_eg_bx_0_bx_0_0x00000000000000_0x00000001312d00, 
            tbpt => comp_tbpt_eg_eg_bx_0_bx_0_0x00000253734d80_0x00000253734d80, 
            dr_ovrm => comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028,
            cond_o => invariant_mass_ov_rm_i18
        );    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 0 L1_test_0 : comb{EG5,EG10}[TBPT_10]
    l1_test_0 <= double_eg_i0;
    algo(0) <= l1_test_0;
-- 8 L1_test_8 : comb{JET23-2,JET32-2,JET34-2,JET36-2} AND comb{JET23-1,JET32-1,JET34-1,JET36-1} AND comb{JET23,JET32,JET34,JET36} AND comb{JET23+1,JET32+1,JET34+1,JET36+1} AND comb{JET23+2,JET32+2,JET34+2,JET36+2}
    l1_test_8 <= quad_jet_i12 and quad_jet_i13 and quad_jet_i14 and quad_jet_i15 and quad_jet_i16;
    algo(3) <= l1_test_8;
-- 10 L1_test_10 : mass_inv_orm{EG62,EG52,TAU70}[DETA_MAX_1p5,MASS_MASS_0to20,ORMDR_0p2,TBPT_10]
    l1_test_10 <= invariant_mass_ov_rm_i18;
    algo(2) <= l1_test_10;
-- 16 L1_test_16 : mass_inv{MU10-2,MU10-1}[MASS_MASS_0to20]
    l1_test_16 <= invariant_mass_i24;
    algo(1) <= l1_test_16;

end architecture rtl;
