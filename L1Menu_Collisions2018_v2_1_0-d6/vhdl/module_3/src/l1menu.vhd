-- Description:
-- L1Menu logic generated by VHDL Producer:

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
    signal deta_calc_jet_mu : obj_bx_max_eta_range_array;
    signal dphi_calc_jet_jet : obj_bx_max_phi_range_array;
    signal dphi_calc_jet_mu : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal deta_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal invmass_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal dr_jet_mu :  obj_bx_corr_cuts_std_logic_array;
    signal deta_jet_mu :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_jet_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_jet_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_jet_mu :  obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_pt_eg_bx_0_0x0030 : eg_obj_t;
    signal comp_eta_eg_bx_0_0x00dd_0x0022 : eg_obj_t;
    signal comp_iso_eg_bx_0_0x000a : eg_obj_t;
    signal comp_pt_eg_bx_0_0x0038 : eg_obj_t;
    signal comp_pt_eg_bx_0_0x005a : eg_obj_t;
    signal comp_eta_eg_bx_0_0x00c6_0x0039 : eg_obj_t;
    signal comp_pt_eg_bx_0_0x0048 : eg_obj_t;
    signal comp_pt_eg_bx_0_0x0034 : eg_obj_t;
    signal comp_pt_eg_bx_0_0x003c : eg_obj_t;
    signal comp_pt_jet_bx_0_0x00e6 : jet_obj_t;
    signal comp_pt_jet_bx_0_0x00f0 : jet_obj_t;
    signal comp_pt_etmhf_bx_0_0x0118 : etmhf_obj_t;
    signal comp_pt_htt_bx_0_0x00f0 : htt_obj_t;
    signal comp_pt_htt_bx_0_0x0320 : htt_obj_t;
    signal comp_pt_jet_bx_0_0x0050 : jet_obj_t;
    signal comp_eta_jet_bx_0_0x00cf_0x0030 : jet_obj_t;
    signal comp_eta_jet_bx_0_0x00c2_0x003d : jet_obj_t;
    signal comp_pt_jet_bx_0_0x0078 : jet_obj_t;
    signal comp_eta_jet_bx_0_0x008d_0x00ba : jet_obj_t;
    signal comp_eta_jet_bx_0_0x0045_0x0072 : jet_obj_t;
    signal comp_pt_jet_bx_0_0x005a : jet_obj_t;
    signal comp_pt_mu_bx_0_0x0019 : mu_obj_t;
    signal comp_eta_mu_bx_0_0x012d_0x00d3 : mu_obj_t;
    signal comp_qual_mu_bx_0_0xf000 : mu_obj_t;
-- Correlation cuts
    signal comp_deta_jet_jet_bx_0_bx_0_0x00000000000000_0x00000000000640 : jet_jet_t;
    signal comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140 : jet_jet_t;
    signal comp_dr_jet_mu_bx_0_bx_0_0x00000000000000_0x000000000274e8 : jet_mu_t;
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_eg_bx_0_pt_0030_eta_00dd_0022_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a : eg_obj_t;
   signal comb_eg_bx_0_pt_0038_eta_00dd_0022_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_005a_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_0048_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_0034_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a : eg_obj_t;
   signal comb_eg_bx_0_pt_003c_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a : eg_obj_t;
   signal comb_jet_bx_0_pt_00e6_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_00f0_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_etmhf_bx_0_pt_0118_phi_0000_0000_0000_0000 : etmhf_obj_t;
   signal comb_htt_bx_0_pt_00f0_phi_0000_0000_0000_0000 : htt_obj_t;
   signal comb_htt_bx_0_pt_0320_phi_0000_0000_0000_0000 : htt_obj_t;
   signal comb_jet_bx_0_pt_0050_eta_00cf_0030_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_0050_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_0050_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_005a_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_005a_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_mu_bx_0_pt_0019_eta_012d_00d3_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_f000_charge_ign : mu_obj_t;
-- Signal definition for conditions names
    signal single_etmhf_i263 : std_logic;
    signal single_htt_i92 : std_logic;
    signal single_htt_i99 : std_logic;
    signal calo_calo_correlation_i255 : std_logic;
    signal calo_muon_correlation_i254 : std_logic;
    signal invariant_mass_i326 : std_logic;
    signal invariant_mass_i327 : std_logic;
    signal invariant_mass_i328 : std_logic;
    signal invariant_mass_i329 : std_logic;
    signal invariant_mass_i330 : std_logic;
    signal invariant_mass_i331 : std_logic;
    signal invariant_mass_i332 : std_logic;
    signal invariant_mass_i333 : std_logic;
    signal invariant_mass_i334 : std_logic;
    signal invariant_mass_i335 : std_logic;
    signal invariant_mass_i336 : std_logic;
    signal single_eg_i317 : std_logic;
    signal single_eg_i343 : std_logic;
    signal single_eg_i41 : std_logic;
    signal single_eg_i44 : std_logic;
    signal single_eg_i53 : std_logic;
    signal single_eg_i55 : std_logic;
    signal single_jet_i325 : std_logic;
    signal single_jet_i76 : std_logic;
-- Signal definition for algorithms names
    signal l1_mu12er2p3_jet40er2p1_d_r_max0p4_double_jet40er2p1_d_eta_max1p6 : std_logic;
    signal l1_single_eg28er1p5 : std_logic;
    signal l1_single_eg36er2p5 : std_logic;
    signal l1_single_eg45er2p5 : std_logic;
    signal l1_single_iso_eg24er1p5 : std_logic;
    signal l1_single_iso_eg26er2p5 : std_logic;
    signal l1_single_iso_eg30er2p5 : std_logic;
    signal l1_single_jet120 : std_logic;
    signal l1_double_jet_115_40_double_jet40_mass_min620_jet60_tt28 : std_logic;
    signal l1_double_jet_120_45_double_jet45_mass_min620_jet60_tt28 : std_logic;
    signal l1_htt120er : std_logic;
    signal l1_htt400er : std_logic;
    signal l1_etmhf140 : std_logic;
begin
-- First stage: calculations
  
    calc_deta_jet_jet_bx_0_bx_0_i: entity work.deta_calc
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0))
        )
        port map(
            conv.jet(bx(0)).eta,
            conv.jet(bx(0)).eta,
            deta_calc_jet_jet(bx(0),bx(0))
        );
    calc_deta_lut_jet_jet_bx_0_bx_0_i: entity work.deta_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_jet_jet(bx(0),bx(0)),
            deta_jet_jet(bx(0),bx(0))
        );
  
    calc_deta_jet_mu_bx_0_bx_0_i: entity work.deta_calc
        generic map(
            N_JET_OBJECTS, N_MU_OBJECTS, (jet_t,mu_t), (bx(0),bx(0))
        )
        port map(    
            conv.jet(bx(0)).eta_conv_mu,
            conv.mu(bx(0)).eta,
            deta_calc_jet_mu(bx(0),bx(0))
        );
    calc_deta_lut_jet_mu_bx_0_bx_0_i: entity work.deta_lut
        generic map(
            N_JET_OBJECTS, N_MU_OBJECTS, (jet_t,mu_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_jet_mu(bx(0),bx(0)),
            deta_jet_mu(bx(0),bx(0))
        );
  
    calc_dphi_jet_jet_bx_0_bx_0_i: entity work.dphi_calc
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0)),
            JET_JET_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.jet(bx(0)).phi,
            conv.jet(bx(0)).phi,
            dphi_calc_jet_jet(bx(0),bx(0))
        );
    calc_dphi_lut_jet_jet_bx_0_bx_0_i: entity work.dphi_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_jet_jet(bx(0),bx(0)),
            dphi_jet_jet(bx(0),bx(0))
        );
  
    calc_dphi_jet_mu_bx_0_bx_0_i: entity work.dphi_calc
        generic map(
            N_JET_OBJECTS, N_MU_OBJECTS, (jet_t,mu_t), (bx(0),bx(0)),
            JET_MU_PHI_HALF_RANGE_BINS
        )
        port map(    
            conv.jet(bx(0)).phi_conv_mu,
            conv.mu(bx(0)).phi,
            dphi_calc_jet_mu(bx(0),bx(0))
        );
    calc_dphi_lut_jet_mu_bx_0_bx_0_i: entity work.dphi_lut
        generic map(
            N_JET_OBJECTS, N_MU_OBJECTS, (jet_t,mu_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_jet_mu(bx(0),bx(0)),
            dphi_jet_mu(bx(0),bx(0))
        );
    calc_cosh_deta_jet_jet_bx_0_bx_0_i: entity work.cosh_deta_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_jet_jet(bx(0),bx(0)),
            cosh_deta_jet_jet(bx(0),bx(0))
        );
    calc_cos_dphi_jet_jet_bx_0_bx_0_i: entity work.cos_dphi_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_jet_jet(bx(0),bx(0)),
            cos_dphi_jet_jet(bx(0),bx(0))
        );
    calc_inv_mass_jet_jet_bx_0_bx_0_i: entity work.invariant_mass
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0)),
            JET_PT_VECTOR_WIDTH, JET_PT_VECTOR_WIDTH,
            JET_JET_COSH_COS_VECTOR_WIDTH
        )
        port map(
            conv.jet(bx(0)).pt_vector,
            conv.jet(bx(0)).pt_vector,
            cosh_deta_jet_jet(bx(0),bx(0)),
            cos_dphi_jet_jet(bx(0),bx(0)),
            invmass_jet_jet(bx(0),bx(0))
       );
    calc_delta_r_jet_mu_bx_0_bx_0_i: entity work.delta_r
        generic map(
            N_JET_OBJECTS, N_MU_OBJECTS, (jet_t,mu_t), (bx(0),bx(0))
        )
        port map(
            deta_jet_mu(bx(0),bx(0)),
            dphi_jet_mu(bx(0),bx(0)),
            dr_jet_mu(bx(0),bx(0))
        );
    
-- Second stage: comparisons
    comp_pt_eg_bx_0_0x0030_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0030", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0030
        );
    comp_eta_eg_bx_0_0x00dd_0x0022_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_ETA_WIDTH,
            ETA, X"00DD", X"0022", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).eta, comp_eta_eg_bx_0_0x00dd_0x0022
        );
    comp_iso_eg_bx_0_0x000a_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_ISO_WIDTH,
            ISO, X"0000", X"0000", X"000A", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).iso, comp_iso_eg_bx_0_0x000a
        );
    comp_pt_eg_bx_0_0x0038_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0038", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0038
        );
    comp_pt_eg_bx_0_0x005a_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"005A", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x005a
        );
    comp_eta_eg_bx_0_0x00c6_0x0039_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_ETA_WIDTH,
            ETA, X"00C6", X"0039", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).eta, comp_eta_eg_bx_0_0x00c6_0x0039
        );
    comp_pt_eg_bx_0_0x0048_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0048", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0048
        );
    comp_pt_eg_bx_0_0x0034_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0034", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0034
        );
    comp_pt_eg_bx_0_0x003c_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"003C", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x003c
        );
    comp_pt_jet_bx_0_0x00e6_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"00E6", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x00e6
        );
    comp_pt_jet_bx_0_0x00f0_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"00F0", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x00f0
        );
    comp_pt_etmhf_bx_0_0x0118_i: entity work.comparators_obj_cuts
        generic map(
            N_ETMHF_OBJECTS, ETMHF_PT_WIDTH,  
            GE,  
            X"0118", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.etmhf(bx(0)).pt, comp_pt_etmhf_bx_0_0x0118
        );
    comp_pt_htt_bx_0_0x00f0_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,  
            GE,  
            X"00F0", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, comp_pt_htt_bx_0_0x00f0
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
    comp_pt_jet_bx_0_0x0050_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0050", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0050
        );
    comp_eta_jet_bx_0_0x00cf_0x0030_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA, X"00CF", X"0030", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, comp_eta_jet_bx_0_0x00cf_0x0030
        );
    comp_eta_jet_bx_0_0x00c2_0x003d_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA, X"00C2", X"003D", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, comp_eta_jet_bx_0_0x00c2_0x003d
        );
    comp_pt_jet_bx_0_0x0078_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0078", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0078
        );
    comp_eta_jet_bx_0_0x008d_0x00ba_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA, X"008D", X"00BA", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, comp_eta_jet_bx_0_0x008d_0x00ba
        );
    comp_eta_jet_bx_0_0x0045_0x0072_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA, X"0045", X"0072", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, comp_eta_jet_bx_0_0x0045_0x0072
        );
    comp_pt_jet_bx_0_0x005a_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"005A", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x005a
        );
    comp_pt_mu_bx_0_0x0019_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"0019", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).pt, comp_pt_mu_bx_0_0x0019
        );
    comp_eta_mu_bx_0_0x012d_0x00d3_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_ETA_WIDTH,
            ETA, X"012D", X"00D3", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).eta, comp_eta_mu_bx_0_0x012d_0x00d3
        );
    comp_qual_mu_bx_0_0xf000_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_QUAL_WIDTH,
            QUAL, X"0000", X"0000", X"F000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).qual, comp_qual_mu_bx_0_0xf000
        );
    comp_deta_jet_jet_bx_0_bx_0_0x00000000000000_0x00000000000640_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0)),
            JET_JET_DELTAETA_VECTOR_WIDTH, deltaEta, 
            X"00000000000000", X"00000000000640"        
        )
        port map(
            lhc_clk, 
            deta_jet_jet(bx(0),bx(0)), comp_deta_jet_jet_bx_0_bx_0_0x00000000000000_0x00000000000640
        );
    comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0)),
            JET_JET_MASS_VECTOR_WIDTH, mass, 
            X"0000047999ED00", X"041A6642C78140"        
        )
        port map(
            lhc_clk, 
            invmass_jet_jet(bx(0),bx(0)), comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041A6642C78140
        );
    comp_dr_jet_mu_bx_0_bx_0_0x00000000000000_0x000000000274e8_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_MU_OBJECTS, (jet_t,mu_t), (bx(0),bx(0)),
            JET_MU_DELTAR_VECTOR_WIDTH, deltaR, 
            X"00000000000000", X"000000000274E8"        
        )
        port map(
            lhc_clk, 
            dr_jet_mu(bx(0),bx(0)), comp_dr_jet_mu_bx_0_bx_0_0x00000000000000_0x000000000274e8
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_eg_bx_0_pt_0030_eta_00dd_0022_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a <= 
    comp_pt_eg_bx_0_0x0030
    and 
    (
    comp_eta_eg_bx_0_0x00dd_0x0022
    )
    and 
    comp_iso_eg_bx_0_0x000a
    ;

    comb_eg_bx_0_pt_0038_eta_00dd_0022_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0038
    and 
    (
    comp_eta_eg_bx_0_0x00dd_0x0022
    )
    ;

    comb_eg_bx_0_pt_005a_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x005a
    and 
    (
    comp_eta_eg_bx_0_0x00c6_0x0039
    )
    ;

    comb_eg_bx_0_pt_0048_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0048
    and 
    (
    comp_eta_eg_bx_0_0x00c6_0x0039
    )
    ;

    comb_eg_bx_0_pt_0034_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a <= 
    comp_pt_eg_bx_0_0x0034
    and 
    (
    comp_eta_eg_bx_0_0x00c6_0x0039
    )
    and 
    comp_iso_eg_bx_0_0x000a
    ;

    comb_eg_bx_0_pt_003c_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a <= 
    comp_pt_eg_bx_0_0x003c
    and 
    (
    comp_eta_eg_bx_0_0x00c6_0x0039
    )
    and 
    comp_iso_eg_bx_0_0x000a
    ;

    comb_jet_bx_0_pt_00e6_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x00e6
    ;

    comb_jet_bx_0_pt_00f0_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x00f0
    ;

    comb_etmhf_bx_0_pt_0118_phi_0000_0000_0000_0000 <= 
    comp_pt_etmhf_bx_0_0x0118
    ;

    comb_htt_bx_0_pt_00f0_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x00f0
    ;

    comb_htt_bx_0_pt_0320_phi_0000_0000_0000_0000 <= 
    comp_pt_htt_bx_0_0x0320
    ;

    comb_jet_bx_0_pt_0050_eta_00cf_0030_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0050
    and 
    (
    comp_eta_jet_bx_0_0x00cf_0x0030
    )
    ;

    comb_jet_bx_0_pt_0050_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0050
    and 
    (
    comp_eta_jet_bx_0_0x00c2_0x003d
    )
    ;

    comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0078
    ;

    comb_jet_bx_0_pt_0050_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0050
    and 
    (
    comp_eta_jet_bx_0_0x008d_0x00ba
    or 
    comp_eta_jet_bx_0_0x0045_0x0072
    )
    ;

    comb_jet_bx_0_pt_005a_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x005a
    and 
    (
    comp_eta_jet_bx_0_0x00c2_0x003d
    )
    ;

    comb_jet_bx_0_pt_005a_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x005a
    and 
    (
    comp_eta_jet_bx_0_0x008d_0x00ba
    or 
    comp_eta_jet_bx_0_0x0045_0x0072
    )
    ;

    comb_mu_bx_0_pt_0019_eta_012d_00d3_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_f000_charge_ign <= 
    comp_pt_mu_bx_0_0x0019
    and 
    (
    comp_eta_mu_bx_0_0x012d_0x00d3
    )
    and 
    comp_qual_mu_bx_0_0xf000
    ;

    -- Instantiations of conditions
    cond_single_eg_i317_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_0030_eta_00dd_0022_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a,
            cond_o => single_eg_i317
        );
    cond_single_eg_i343_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_0038_eta_00dd_0022_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => single_eg_i343
        );
    cond_single_eg_i41_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_005a_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => single_eg_i41
        );
    cond_single_eg_i44_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_0048_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => single_eg_i44
        );
    cond_single_eg_i53_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_0034_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a,
            cond_o => single_eg_i53
        );
    cond_single_eg_i55_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_003c_eta_00c6_0039_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000a,
            cond_o => single_eg_i55
        );
    cond_single_jet_i325_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_jet_bx_0_pt_00e6_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => single_jet_i325
        );
    cond_single_jet_i76_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11), (0,0), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_jet_bx_0_pt_00f0_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            cond_o => single_jet_i76
        );
    single_etmhf_i263 => 
        comb_etmhf_bx_0_pt_0118_phi_0000_0000_0000_0000(0);
    single_htt_i92 => 
        comb_htt_bx_0_pt_00f0_phi_0000_0000_0000_0000(0);
    single_htt_i99 => 
        comb_htt_bx_0_pt_0320_phi_0000_0000_0000_0000(0);
    cond_calo_calo_correlation_i255_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0050_eta_00cf_0030_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0050_eta_00cf_0030_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            deta => comp_deta_jet_jet_bx_0_bx_0_0x00000000000000_0x00000000000640,
            cond_o => calo_calo_correlation_i255
        );

    cond_invariant_mass_i326_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0050_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0050_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i326
        );

    cond_invariant_mass_i327_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i327
        );

    cond_invariant_mass_i328_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0050_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i328
        );

    cond_invariant_mass_i329_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0050_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i329
        );

    cond_invariant_mass_i330_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0050_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0050_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i330
        );

    cond_invariant_mass_i331_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0050_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0050_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i331
        );

    cond_invariant_mass_i332_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_005a_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_005a_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i332
        );

    cond_invariant_mass_i333_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_005a_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i333
        );

    cond_invariant_mass_i334_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0078_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_005a_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i334
        );

    cond_invariant_mass_i335_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_005a_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_005a_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i335
        );

    cond_invariant_mass_i336_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_005a_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_005a_eta_008d_00ba_0045_0072_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x0000047999ed00_0x041a6642c78140,
            cond_o => invariant_mass_i336
        );

    cond_calo_muon_correlation_i254_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_MU_OBJECTS,
            ((0,11), (0,7), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0050_eta_00cf_0030_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_mu_bx_0_pt_0019_eta_012d_00d3_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_f000_charge_ign, 
            delta_r => comp_dr_jet_mu_bx_0_bx_0_0x00000000000000_0x000000000274e8,
            cond_o => calo_muon_correlation_i254
        );
    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 136 L1_Mu12er2p3_Jet40er2p1_dR_Max0p4_DoubleJet40er2p1_dEta_Max1p6 : dist{MU12[MU-QLTY_SNGL,MU-ETA_2p3],JET40[JET-ETA_2p13]}[DR_MAX_0p4] AND dist{JET40[JET-ETA_2p13],JET40[JET-ETA_2p13]}[DETA_MAX_1p6]
    l1_mu12er2p3_jet40er2p1_d_r_max0p4_double_jet40er2p1_d_eta_max1p6 <= calo_muon_correlation_i254 and calo_calo_correlation_i255;
    algo(12) <= l1_mu12er2p3_jet40er2p1_d_r_max0p4_double_jet40er2p1_d_eta_max1p6;
-- 166 L1_SingleEG28er1p5 : EG28[EG-ETA_1p52_HASHFIX]
    l1_single_eg28er1p5 <= single_eg_i343;
    algo(3) <= l1_single_eg28er1p5;
-- 168 L1_SingleEG36er2p5 : EG36[EG-ETA_2p52]
    l1_single_eg36er2p5 <= single_eg_i44;
    algo(4) <= l1_single_eg36er2p5;
-- 172 L1_SingleEG45er2p5 : EG45[EG-ETA_2p52]
    l1_single_eg45er2p5 <= single_eg_i41;
    algo(5) <= l1_single_eg45er2p5;
-- 184 L1_SingleIsoEG24er1p5 : EG24[EG-ETA_1p52_HASHFIX,EG-ISO_0xA]
    l1_single_iso_eg24er1p5 <= single_eg_i317;
    algo(6) <= l1_single_iso_eg24er1p5;
-- 185 L1_SingleIsoEG26er2p5 : EG26[EG-ETA_2p52,EG-ISO_0xA]
    l1_single_iso_eg26er2p5 <= single_eg_i53;
    algo(7) <= l1_single_iso_eg26er2p5;
-- 192 L1_SingleIsoEG30er2p5 : EG30[EG-ETA_2p52,EG-ISO_0xA]
    l1_single_iso_eg30er2p5 <= single_eg_i55;
    algo(8) <= l1_single_iso_eg30er2p5;
-- 312 L1_SingleJet120 : JET120
    l1_single_jet120 <= single_jet_i76;
    algo(9) <= l1_single_jet120;
-- 360 L1_DoubleJet_115_40_DoubleJet40_Mass_Min620_Jet60TT28 : JET115 AND (mass_inv{JET40[JET-ETA_CEN_2p70],JET40[JET-ETA_CEN_2p70]}[MASS_MIN_620] OR mass_inv{JET60,JET60}[MASS_MIN_620] OR mass_inv{JET60,JET40[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS]}[MASS_MIN_620] OR mass_inv{JET60,JET40[JET-ETA_CEN_2p70]}[MASS_MIN_620] OR mass_inv{JET40[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS],JET40[JET-ETA_CEN_2p70]}[MASS_MIN_620] OR mass_inv{JET40[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS],JET40[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS]}[MASS_MIN_620])
    l1_double_jet_115_40_double_jet40_mass_min620_jet60_tt28 <= single_jet_i325 and ( invariant_mass_i326 or invariant_mass_i327 or invariant_mass_i328 or invariant_mass_i329 or invariant_mass_i330 or invariant_mass_i331 );
    algo(11) <= l1_double_jet_115_40_double_jet40_mass_min620_jet60_tt28;
-- 361 L1_DoubleJet_120_45_DoubleJet45_Mass_Min620_Jet60TT28 : JET120 AND (mass_inv{JET45[JET-ETA_CEN_2p70],JET45[JET-ETA_CEN_2p70]}[MASS_MIN_620] OR mass_inv{JET60,JET60}[MASS_MIN_620] OR mass_inv{JET60,JET45[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS]}[MASS_MIN_620] OR mass_inv{JET60,JET45[JET-ETA_CEN_2p70]}[MASS_MIN_620] OR mass_inv{JET45[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS],JET45[JET-ETA_CEN_2p70]}[MASS_MIN_620] OR mass_inv{JET45[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS],JET45[JET-ETA_FWD_3p00_NEG,JET-ETA_FWD_3p00_POS]}[MASS_MIN_620])
    l1_double_jet_120_45_double_jet45_mass_min620_jet60_tt28 <= single_jet_i76 and ( invariant_mass_i332 or invariant_mass_i327 or invariant_mass_i333 or invariant_mass_i334 or invariant_mass_i335 or invariant_mass_i336 );
    algo(10) <= l1_double_jet_120_45_double_jet45_mass_min620_jet60_tt28;
-- 398 L1_HTT120er : HTT120
    l1_htt120er <= single_htt_i92;
    algo(1) <= l1_htt120er;
-- 405 L1_HTT400er : HTT400
    l1_htt400er <= single_htt_i99;
    algo(2) <= l1_htt400er;
-- 425 L1_ETMHF140 : ETMHF140
    l1_etmhf140 <= single_etmhf_i263;
    algo(0) <= l1_etmhf140;

end architecture rtl;
