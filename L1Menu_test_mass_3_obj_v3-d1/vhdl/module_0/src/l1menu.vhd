-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_test_mass_3_obj_v3

-- Unique ID of L1 Trigger Menu:
-- 821d31a5-e544-47d3-85d1-ce2181a9ac94

-- Unique ID of firmware implementation:
-- 51b04746-0c6a-425b-848e-0c4da41ccd33

-- Scale set:
-- scales_2018_08_07

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
    signal deta_calc_eg_eg : obj_bx_max_eta_range_array;
    signal deta_calc_jet_jet : obj_bx_max_eta_range_array;
    signal deta_calc_mu_mu : obj_bx_max_eta_range_array;
    signal dphi_calc_eg_eg : obj_bx_max_phi_range_array;
    signal dphi_calc_jet_jet : obj_bx_max_phi_range_array;
    signal dphi_calc_mu_mu : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal invmass_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal invmass_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal invmass_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal invmass3obj_jet_bx :  obj_bx_corr_cuts_std_logic_array;
    signal invmass3obj_eg_bx :  obj_bx_corr_cuts_std_logic_array;
    signal invmass3obj_mu_bx :  obj_bx_corr_cuts_std_logic_array;
    signal deta_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal deta_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_eg_eg :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_jet_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_pt_eg_bx_0_0x0014 : eg_obj_t;
    signal comp_pt_jet_bx_0_0x0014 : jet_obj_t;
    signal comp_pt_mu_bx_0_0x0015 : mu_obj_t;
    signal comp_pt_jet_bx_0_0x0028 : jet_obj_t;
    signal comp_pt_jet_bx_0_0x003c : jet_obj_t;
    signal comp_pt_eg_bx_0_0x0028 : eg_obj_t;
    signal comp_pt_eg_bx_0_0x0032 : eg_obj_t;
    signal comp_pt_eg_bx_0_0x003e : eg_obj_t;
    signal comp_pt_mu_bx_0_0x0019 : mu_obj_t;
    signal comp_pt_mu_bx_0_0x002d : mu_obj_t;
    signal comp_pt_mu_bx_0_0x0041 : mu_obj_t;
-- Correlation cuts
    signal comp_invmass_eg_eg_bx_0_bx_0_0x00000000256250_0x00000000f73140 : eg_eg_t;
    signal comp_invmass_jet_jet_bx_0_bx_0_0x00000000256250_0x00000000f73140 : jet_jet_t;
    signal comp_invmass_mu_mu_bx_0_bx_0_0x0000000175d720_0x00000009a7ec80 : mu_mu_t;
    signal comp_invmass3obj_jet_bx_0_0x00000000256250_0x00000000f73140 : mass_3_obj_jet_t;
    signal comp_invmass3obj_eg_bx_0_0x00000007735940_0x0000001dcd6500 : mass_3_obj_eg_t;
    signal comp_invmass3obj_mu_bx_0_0x0000004a817c80_0x0000012a05f200 : mass_3_obj_mu_t;
-- Muon charge correlation
    signal comp_cc_triple_bx_0_bx_0_cc_os : mu_cc_triple_t;
-- Conditions inputs
    -- Object cuts "and"
   signal comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_jet_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign : mu_obj_t;
   signal comb_jet_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_jet_bx_0_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_eg_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_0032_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_eg_bx_0_pt_003e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_mu_bx_0_pt_0019_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign : mu_obj_t;
   signal comb_mu_bx_0_pt_002d_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign : mu_obj_t;
   signal comb_mu_bx_0_pt_0041_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign : mu_obj_t;
-- Signal definition for conditions names
    signal invariant_mass_i0 : std_logic;
    signal invariant_mass_i4 : std_logic;
    signal invariant_mass_i5 : std_logic;
    signal invariant_mass_three_obj_i1 : std_logic;
    signal invariant_mass_three_obj_i2 : std_logic;
    signal invariant_mass_three_obj_i3 : std_logic;
-- Signal definition for algorithms names
    signal l1_jet_mass_3_obj : std_logic;
    signal l1_mu_mass_2_obj : std_logic;
    signal l1_mu_mass_3_obj_cc : std_logic;
    signal l1_eg_mass_3_obj : std_logic;
    signal l1_eg_mass_2_obj : std_logic;
    signal l1_jet_mass_2_obj : std_logic;
begin
-- First stage: calculations
    calc_muon_charge_correlations_bx_0_bx_0_i: entity work.muon_charge_correlations
        port map(
            data.mu(bx(0)).charge,
            data.mu(bx(0)).charge,
            cc_double(bx(0),bx(0)),
            cc_triple(bx(0),bx(0)),
            cc_quad(bx(0),bx(0))
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
  
    calc_deta_mu_mu_bx_0_bx_0_i: entity work.deta_calc
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0))
        )
        port map(
            conv.mu(bx(0)).eta,
            conv.mu(bx(0)).eta,
            deta_calc_mu_mu(bx(0),bx(0))
        );
    calc_deta_lut_mu_mu_bx_0_bx_0_i: entity work.deta_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_mu_mu(bx(0),bx(0)),
            deta_mu_mu(bx(0),bx(0))
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
  
    calc_dphi_mu_mu_bx_0_bx_0_i: entity work.dphi_calc
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0)),
            MU_MU_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.mu(bx(0)).phi,
            conv.mu(bx(0)).phi,
            dphi_calc_mu_mu(bx(0),bx(0))
        );
    calc_dphi_lut_mu_mu_bx_0_bx_0_i: entity work.dphi_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_mu_mu(bx(0),bx(0)),
            dphi_mu_mu(bx(0),bx(0))
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
    calc_cosh_deta_mu_mu_bx_0_bx_0_i: entity work.cosh_deta_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_mu_mu(bx(0),bx(0)),
            cosh_deta_mu_mu(bx(0),bx(0))
        );
    calc_cos_dphi_mu_mu_bx_0_bx_0_i: entity work.cos_dphi_lut
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_mu_mu(bx(0),bx(0)),
            cos_dphi_mu_mu(bx(0),bx(0))
        );
    calc_inv_mass_mu_mu_bx_0_bx_0_i: entity work.invariant_mass
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0)),
            MU_PT_VECTOR_WIDTH, MU_PT_VECTOR_WIDTH,
            MU_MU_COSH_COS_VECTOR_WIDTH
        )
        port map(
            conv.mu(bx(0)).pt_vector,
            conv.mu(bx(0)).pt_vector,
            cosh_deta_mu_mu(bx(0),bx(0)),
            cos_dphi_mu_mu(bx(0),bx(0)),
            invmass_mu_mu(bx(0),bx(0))
       );
    
-- Second stage: comparisons
    comp_pt_eg_bx_0_0x0014_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0014", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0014
        );
    comp_pt_jet_bx_0_0x0014_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0014", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0014
        );
    comp_pt_mu_bx_0_0x0015_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"0015", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).pt, comp_pt_mu_bx_0_0x0015
        );
    comp_pt_jet_bx_0_0x0028_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0028", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0028
        );
    comp_pt_jet_bx_0_0x003c_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"003C", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x003c
        );
    comp_pt_eg_bx_0_0x0028_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0028", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0028
        );
    comp_pt_eg_bx_0_0x0032_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0032", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0032
        );
    comp_pt_eg_bx_0_0x003e_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"003E", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x003e
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
    comp_pt_mu_bx_0_0x002d_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"002D", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).pt, comp_pt_mu_bx_0_0x002d
        );
    comp_pt_mu_bx_0_0x0041_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"0041", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).pt, comp_pt_mu_bx_0_0x0041
        );
    comp_invmass_eg_eg_bx_0_bx_0_0x00000000256250_0x00000000f73140_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS, (eg_t,eg_t), (bx(0),bx(0)),
            EG_EG_MASS_VECTOR_WIDTH, mass, 
            X"00000000256250", X"00000000F73140"        
        )
        port map(
            lhc_clk, invmass_eg_eg(bx(0),bx(0)), comp_invmass_eg_eg_bx_0_bx_0_0x00000000256250_0x00000000F73140
        );
    comp_invmass_jet_jet_bx_0_bx_0_0x00000000256250_0x00000000f73140_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t), (bx(0),bx(0)),
            JET_JET_MASS_VECTOR_WIDTH, mass, 
            X"00000000256250", X"00000000F73140"        
        )
        port map(
            lhc_clk, invmass_jet_jet(bx(0),bx(0)), comp_invmass_jet_jet_bx_0_bx_0_0x00000000256250_0x00000000F73140
        );
    comp_invmass_mu_mu_bx_0_bx_0_0x0000000175d720_0x00000009a7ec80_i: entity work.comparators_corr_cuts
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0)),
            MU_MU_MASS_VECTOR_WIDTH, mass, 
            X"0000000175D720", X"00000009A7EC80"        
        )
        port map(
            lhc_clk, invmass_mu_mu(bx(0),bx(0)), comp_invmass_mu_mu_bx_0_bx_0_0x0000000175d720_0x00000009A7EC80
        );
    comp_inv_mass_3_obj_jet_bx_0_0x00000000256250_0x00000000f73140_i: entity work.comparators_mass_3_obj
        generic map(
            N_JET_OBJECTS,
            JET_JET_MASS_VECTOR_WIDTH, mass, 
            X"00000000256250", X"00000000F73140"        
        )
        port map(
            lhc_clk, invmass_jet_jet(bx(0),bx(0)), comp_invmass3obj_jet_bx_0_0x00000000256250_0x00000000F73140
        );
    comp_inv_mass_3_obj_eg_bx_0_0x00000007735940_0x0000001dcd6500_i: entity work.comparators_mass_3_obj
        generic map(
            N_EG_OBJECTS,
            EG_EG_MASS_VECTOR_WIDTH, mass, 
            X"00000007735940", X"0000001DCD6500"        
        )
        port map(
            lhc_clk, invmass_eg_eg(bx(0),bx(0)), comp_invmass3obj_eg_bx_0_0x00000007735940_0x0000001DCD6500
        );
    comp_inv_mass_3_obj_mu_bx_0_0x0000004a817c80_0x0000012a05f200_i: entity work.comparators_mass_3_obj
        generic map(
            N_MU_OBJECTS,
            MU_MU_MASS_VECTOR_WIDTH, mass, 
            X"0000004A817C80", X"0000012A05F200"        
        )
        port map(
            lhc_clk, invmass_mu_mu(bx(0),bx(0)), comp_invmass3obj_mu_bx_0_0x0000004a817c80_0x0000012A05F200
        );
    comp_cc_triple_bx_0_bx_0_cc_os_i: entity work.comparators_muon_charge_corr
        generic map(
            triple, CC_OS
        )
        port map(
            lhc_clk, 
            cc_triple => cc_triple(bx(0),bx(0)), 
            comp_o_triple => comp_cc_triple_bx_0_bx_0_cc_os
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0014
    ;

    comb_jet_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0014
    ;

    comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign <= 
    comp_pt_mu_bx_0_0x0015
    ;

    comb_jet_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0028
    ;

    comb_jet_bx_0_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x003c
    ;

    comb_eg_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0028
    ;

    comb_eg_bx_0_pt_0032_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0032
    ;

    comb_eg_bx_0_pt_003e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x003e
    ;

    comb_mu_bx_0_pt_0019_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign <= 
    comp_pt_mu_bx_0_0x0019
    ;

    comb_mu_bx_0_pt_002d_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign <= 
    comp_pt_mu_bx_0_0x002d
    ;

    comb_mu_bx_0_pt_0041_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign <= 
    comp_pt_mu_bx_0_0x0041
    ;

    -- Instantiations of conditions
    cond_invariant_mass_i4_i: entity work.correlation_conditions
        generic map(
            N_EG_OBJECTS, N_EG_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_eg_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_eg_eg_bx_0_bx_0_0x00000000256250_0x00000000f73140,
            cond_o => invariant_mass_i4
        );

    cond_invariant_mass_i5_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            inv_mass => comp_invmass_jet_jet_bx_0_bx_0_0x00000000256250_0x00000000f73140,
            cond_o => invariant_mass_i5
        );

    cond_invariant_mass_i0_i: entity work.correlation_conditions
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS,
            ((0,7), (0,7), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign,
            in_2 => 
            comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign, 
            inv_mass => comp_invmass_mu_mu_bx_0_bx_0_0x0000000175d720_0x00000009a7ec80,
            cond_o => invariant_mass_i0
        );

    cond_invariant_mass_three_obj_i2_i: entity work.mass_3_obj_condition
        generic map(
            N_JET_OBJECTS,
            ((0,11), (0,11), (0,11), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_jet_bx_0_pt_0014_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_3 => 
            comb_jet_bx_0_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            inv_mass => comp_invmass3obj_jet_bx_0_0x00000000256250_0x00000000f73140,
            cond_o => invariant_mass_three_obj_i2
        );

    cond_invariant_mass_three_obj_i3_i: entity work.mass_3_obj_condition
        generic map(
            N_EG_OBJECTS,
            ((0,11), (0,11), (0,11), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_eg_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_eg_bx_0_pt_0032_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_3 => 
            comb_eg_bx_0_pt_003e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            inv_mass => comp_invmass3obj_eg_bx_0_0x00000007735940_0x0000001dcd6500,
            cond_o => invariant_mass_three_obj_i3
        );

    cond_invariant_mass_three_obj_i1_i: entity work.mass_3_obj_condition
        generic map(
            N_MU_OBJECTS,
            ((0,7), (0,7), (0,7), (0,0)),
            true
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_mu_bx_0_pt_0019_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign,
            in_2 => 
            comb_mu_bx_0_pt_002d_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign,
            in_3 => 
            comb_mu_bx_0_pt_0041_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign,
            inv_mass => comp_invmass3obj_mu_bx_0_0x0000004a817c80_0x0000012a05f200,
            charge_corr_triple => comp_cc_triple_bx_0_bx_0_cc_os,
            cond_o => invariant_mass_three_obj_i1
        );
    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 0 L1_jet_mass_3_obj : mass_inv_3_obj{JET10,JET20,JET30}[MASS_MASS_7to18]
    l1_jet_mass_3_obj <= invariant_mass_three_obj_i2;
    algo(1) <= l1_jet_mass_3_obj;
-- 1 L1_mu_mass_2_obj : mass_inv{MU10,MU10}[MASS_MASS_7to18]
    l1_mu_mass_2_obj <= invariant_mass_i0;
    algo(3) <= l1_mu_mass_2_obj;
-- 2 L1_mu_mass_3_obj_cc : mass_inv_3_obj{MU12,MU22,MU32}[CHGCOR_OS,MASS_50to100]
    l1_mu_mass_3_obj_cc <= invariant_mass_three_obj_i1;
    algo(2) <= l1_mu_mass_3_obj_cc;
-- 3 L1_eg_mass_3_obj : mass_inv_3_obj{EG20,EG25,EG31}[MASS_50to100]
    l1_eg_mass_3_obj <= invariant_mass_three_obj_i3;
    algo(0) <= l1_eg_mass_3_obj;
-- 4 L1_eg_mass_2_obj : mass_inv{EG10,EG10}[MASS_MASS_7to18]
    l1_eg_mass_2_obj <= invariant_mass_i4;
    algo(4) <= l1_eg_mass_2_obj;
-- 5 L1_jet_mass_2_obj : mass_inv{JET10,JET10}[MASS_MASS_7to18]
    l1_jet_mass_2_obj <= invariant_mass_i5;
    algo(5) <= l1_jet_mass_2_obj;

end architecture rtl;
