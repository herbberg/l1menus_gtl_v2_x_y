-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 1

-- Name of L1 Trigger Menu:
-- L1Menu_CollisionsHeavyIons2018_v4_2_0

-- Unique ID of L1 Trigger Menu:
-- 18def6b5-725e-4ccd-bd48-aa6c63158cc8

-- Unique ID of firmware implementation:
-- a52f5ad9-78f6-4765-a14c-a24029f177a8

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
    signal deta_calc_eg_jet : obj_bx_max_eta_range_array;
    signal deta_calc_mu_mu : obj_bx_max_eta_range_array;
    signal dphi_calc_eg_jet : obj_bx_max_phi_range_array;
    signal dphi_calc_mu_mu : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal dr_eg_jet :  obj_bx_corr_cuts_std_logic_array;
    signal dr_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal deta_eg_jet :  obj_bx_corr_cuts_std_logic_array;
    signal deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_jet :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_eg_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_eg_jet :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_pt_eg_bx_0_0x001e : eg_obj_t;
    signal comp_pt_jet_bx_0_0x0078 : jet_obj_t;
    signal comp_eta_jet_bx_0_0x00c2_0x003d : jet_obj_t;
    signal comp_pt_eg_bx_0_0x0018 : eg_obj_t;
    signal comp_pt_jet_bx_0_0x0058 : jet_obj_t;
    signal comp_pt_mu_bx_0_0x0001 : mu_obj_t;
    signal comp_qual_mu_bx_0_0xfff0 : mu_obj_t;
-- Correlation cuts
    signal comp_dr_eg_jet_bx_0_bx_0_0x00000000027100_0x000000084ca240 : eg_jet_t;
    signal comp_dr_mu_mu_bx_0_bx_0_0x00000000000000_0x000000003d0900 : mu_mu_t;
-- Muon charge correlation
    signal comp_cc_double_bx_0_bx_0_cc_os : mu_cc_double_t;
-- Conditions inputs
    -- Object cuts "and"
   signal comb_eg_bx_0_pt_001e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_jet_bx_0_pt_0078_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_eg_bx_0_pt_0018_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : eg_obj_t;
   signal comb_jet_bx_0_pt_0058_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f : jet_obj_t;
   signal comb_mu_bx_0_pt_0001_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_fff0_charge_ign : mu_obj_t;
-- Signal definition for conditions names
    signal single_ext_i35 : std_logic;
    signal calo_calo_correlation_i153 : std_logic;
    signal calo_calo_correlation_i164 : std_logic;
    signal muon_muon_correlation_i117 : std_logic;
-- Signal definition for algorithms names
    signal l1_double_mu_open_max_dr2p0_os_bptx_and : std_logic;
    signal l1_single_eg12_single_jet44_mid_eta2p7_min_dr0p4_bptx_and : std_logic;
    signal l1_single_eg15_single_jet60_mid_eta2p7_min_dr0p4_bptx_and : std_logic;
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
  
    calc_deta_eg_jet_bx_0_bx_0_i: entity work.deta_calc
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t), (bx(0),bx(0))
        )
        port map(
            conv.eg(bx(0)).eta,
            conv.jet(bx(0)).eta,
            deta_calc_eg_jet(bx(0),bx(0))
        );
    calc_deta_lut_eg_jet_bx_0_bx_0_i: entity work.deta_lut
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t), (bx(0),bx(0))
        )
        port map(
            deta_calc_eg_jet(bx(0),bx(0)),
            deta_eg_jet(bx(0),bx(0))
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
  
    calc_dphi_eg_jet_bx_0_bx_0_i: entity work.dphi_calc
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t), (bx(0),bx(0)),
            EG_JET_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.eg(bx(0)).phi,
            conv.jet(bx(0)).phi,
            dphi_calc_eg_jet(bx(0),bx(0))
        );
    calc_dphi_lut_eg_jet_bx_0_bx_0_i: entity work.dphi_lut
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t), (bx(0),bx(0))
        )
        port map(
            dphi_calc_eg_jet(bx(0),bx(0)),
            dphi_eg_jet(bx(0),bx(0))
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
    calc_delta_r_eg_jet_bx_0_bx_0_i: entity work.delta_r
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t), (bx(0),bx(0))
        )
        port map(
            deta_eg_jet(bx(0),bx(0)),
            dphi_eg_jet(bx(0),bx(0)),
            dr_eg_jet(bx(0),bx(0))
        );
    calc_delta_r_mu_mu_bx_0_bx_0_i: entity work.delta_r
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0))
        )
        port map(
            deta_mu_mu(bx(0),bx(0)),
            dphi_mu_mu(bx(0),bx(0)),
            dr_mu_mu(bx(0),bx(0))
        );
    
-- Second stage: comparisons
    comp_pt_eg_bx_0_0x001e_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"001E", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x001e
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
    comp_eta_jet_bx_0_0x00c2_0x003d_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA, X"00C2", X"003D", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, comp_eta_jet_bx_0_0x00c2_0x003d
        );
    comp_pt_eg_bx_0_0x0018_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,  
            GE,  
            X"0018", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, comp_pt_eg_bx_0_0x0018
        );
    comp_pt_jet_bx_0_0x0058_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,  
            GE,  
            X"0058", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, comp_pt_jet_bx_0_0x0058
        );
    comp_pt_mu_bx_0_0x0001_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"0001", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).pt, comp_pt_mu_bx_0_0x0001
        );
    comp_qual_mu_bx_0_0xfff0_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_QUAL_WIDTH,
            QUAL, X"0000", X"0000", X"FFF0", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).qual, comp_qual_mu_bx_0_0xfff0
        );
    comp_dr_eg_jet_bx_0_bx_0_0x00000000027100_0x000000084ca240_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t), (bx(0),bx(0)),
            EG_JET_DELTAR_VECTOR_WIDTH, deltaR, 
            X"00000000027100", X"000000084CA240"        
        )
        port map(
            lhc_clk, 
            dr_eg_jet(bx(0),bx(0)), comp_dr_eg_jet_bx_0_bx_0_0x00000000027100_0x000000084ca240
        );
    comp_dr_mu_mu_bx_0_bx_0_0x00000000000000_0x000000003d0900_i: entity work.comparators_corr_cuts
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0)),
            MU_MU_DELTAR_VECTOR_WIDTH, deltaR, 
            X"00000000000000", X"000000003D0900"        
        )
        port map(
            lhc_clk, 
            dr_mu_mu(bx(0),bx(0)), comp_dr_mu_mu_bx_0_bx_0_0x00000000000000_0x000000003d0900
        );
    comp_cc_double_bx_0_bx_0_cc_os_i: entity work.comparators_muon_charge_corr
        generic map(
            double, CC_OS
        )
        port map(
            lhc_clk, 
            cc_double => cc_double(bx(0),bx(0)), 
            comp_o_double => comp_cc_double_bx_0_bx_0_cc_os
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_eg_bx_0_pt_001e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x001e
    ;

    comb_jet_bx_0_pt_0078_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0078
    and 
    (
    comp_eta_jet_bx_0_0x00c2_0x003d
    )
    ;

    comb_eg_bx_0_pt_0018_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_eg_bx_0_0x0018
    ;

    comb_jet_bx_0_pt_0058_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f <= 
    comp_pt_jet_bx_0_0x0058
    and 
    (
    comp_eta_jet_bx_0_0x00c2_0x003d
    )
    ;

    comb_mu_bx_0_pt_0001_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_fff0_charge_ign <= 
    comp_pt_mu_bx_0_0x0001
    and 
    comp_qual_mu_bx_0_0xfff0
    ;

    -- Instantiations of conditions
    cond_calo_calo_correlation_i153_i: entity work.correlation_conditions
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_eg_bx_0_pt_001e_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0078_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            delta_r => comp_dr_eg_jet_bx_0_bx_0_0x00000000027100_0x000000084ca240,
            cond_o => calo_calo_correlation_i153
        );

    cond_calo_calo_correlation_i164_i: entity work.correlation_conditions
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            ((0,11), (0,11), (0,0), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_eg_bx_0_pt_0018_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            in_2 => 
            comb_jet_bx_0_pt_0058_eta_00c2_003d_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            delta_r => comp_dr_eg_jet_bx_0_bx_0_0x00000000027100_0x000000084ca240,
            cond_o => calo_calo_correlation_i164
        );

    cond_muon_muon_correlation_i117_i: entity work.correlation_conditions
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS,
            ((0,7), (0,7), (0,0), (0,0)),
            true
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_mu_bx_0_pt_0001_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_fff0_charge_ign,
            in_2 => 
            comb_mu_bx_0_pt_0001_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_fff0_charge_ign, 
            delta_r => comp_dr_mu_mu_bx_0_bx_0_0x00000000000000_0x000000003d0900,
            charge_corr_double => comp_cc_double_bx_0_bx_0_cc_os,
            cond_o => muon_muon_correlation_i117
        );
    
    -- Centrality assignment
    -- External condition assignment  
    single_ext_i35 <= data.ext_cond(bx(0))(4);
    -- Instantiations of algorithms

-- 239 L1_DoubleMuOpen_MaxDr2p0_OS_BptxAND : dist{MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN]}[DR_MAX2p0,CHGCOR_OS] AND EXT_ZeroBias_BPTX_AND_VME
    l1_double_mu_open_max_dr2p0_os_bptx_and <= muon_muon_correlation_i117 and single_ext_i35;
    algo(2) <= l1_double_mu_open_max_dr2p0_os_bptx_and;
-- 385 L1_SingleEG12_SingleJet44_MidEta2p7_MinDr0p4_BptxAND : dist{EG12,JET44[JET-ETA_2p7]}[DR_MIN_0p4] AND EXT_ZeroBias_BPTX_AND_VME
    l1_single_eg12_single_jet44_mid_eta2p7_min_dr0p4_bptx_and <= calo_calo_correlation_i164 and single_ext_i35;
    algo(0) <= l1_single_eg12_single_jet44_mid_eta2p7_min_dr0p4_bptx_and;
-- 395 L1_SingleEG15_SingleJet60_MidEta2p7_MinDr0p4_BptxAND : dist{EG15,JET60[JET-ETA_2p7]}[DR_MIN_0p4] AND EXT_ZeroBias_BPTX_AND_VME
    l1_single_eg15_single_jet60_mid_eta2p7_min_dr0p4_bptx_and <= calo_calo_correlation_i153 and single_ext_i35;
    algo(1) <= l1_single_eg15_single_jet60_mid_eta2p7_min_dr0p4_bptx_and;

end architecture rtl;
