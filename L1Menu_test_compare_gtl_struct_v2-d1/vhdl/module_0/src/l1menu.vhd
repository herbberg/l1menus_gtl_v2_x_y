-- Description:
-- L1Menu logic generated by VHDL Producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_test_compare_gtl_struct_v2

-- Unique ID of L1 Trigger Menu:
-- fcb61165-cd98-4cf2-a4a2-9b8a03a40bed

-- Unique ID of firmware implementation:
-- f3ef9e33-3dcf-4762-8a07-32580b9d6ee0

-- Scale set:
-- scales_2018_08_07

-- VHDL producer version
-- v2.6.1
-- ========================================================

library ieee;
use ieee.std_logic_1164.all;

use work.lhc_data_pkg.all;
use work.gtl_pkg.all;
use work.l1menu_pkg.all;

entity l1menu is
    port(
        lhc_clk : in std_logic;
        data : in data_pipeline_record;
        conv : in conv_pipeline_record;
        algo : out std_logic_vector(NR_ALGOS-1 downto 0));
end l1menu;

architecture rtl of l1menu is
-- Default signal for correlation cuts (fix in "template" independent of L1Menu content)   
    signal def : default_corr_cuts_rec := (
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), (others => (others => '1')),
        (others => (others => '1')),
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), (others => (others => '1')),
        (others => (others => '1')), (others => (others => (others => '1'))), (others => (others => (others => (others => '1'))))
    );

-- Calculations outputs
    -- Differences
    signal sub_eta_eg_jet : obj_bx_max_eta_range_array;
    signal sub_phi_eg_jet : obj_bx_max_phi_range_array;
    signal sub_eta_jet_jet : obj_bx_max_eta_range_array;
    signal sub_phi_jet_jet : obj_bx_max_phi_range_array;
    signal sub_eta_jet_tau : obj_bx_max_eta_range_array;
    signal sub_phi_jet_tau : obj_bx_max_phi_range_array;
    signal sub_eta_jet_muon : obj_bx_max_eta_range_array;
    signal sub_phi_jet_muon : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal deta_eg_jet : obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_jet : obj_bx_corr_cuts_std_logic_array;
    signal dr_eg_jet : obj_bx_corr_cuts_std_logic_array;
    signal deta_jet_jet : obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_jet_jet : obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_jet_jet : obj_bx_corr_cuts_std_logic_array;
    signal inv_mass_jet_jet : obj_bx_corr_cuts_std_logic_array;
    signal deta_jet_tau : obj_bx_corr_cuts_std_logic_array;
    signal dphi_jet_tau : obj_bx_corr_cuts_std_logic_array;
    signal deta_jet_muon : obj_bx_corr_cuts_std_logic_array;
    signal dphi_jet_muon : obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_jet_tau : obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_jet_tau : obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_jet_muon : obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_jet_muon : obj_bx_corr_cuts_std_logic_array;
    signal dr_jet_muon : obj_bx_corr_cuts_std_logic_array;
    signal dr_jet_tau : obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;

-- Comparators outputs
    -- Object cuts    
    signal pt_eg_1 : eg_obj_t;
    signal pt_eg_2 : eg_obj_t;
    signal pt_eg_3 : eg_obj_t;
    signal pt_jet_1 : jet_obj_t;
    signal pt_jet_2 : jet_obj_t;
    signal pt_jet_3 : jet_obj_t;
    signal pt_jet_4 : jet_obj_t;
    signal pt_jet_5 : jet_obj_t;
    signal pt_jet_6 : jet_obj_t;
    signal pt_jet_7 : jet_obj_t;
    signal pt_jet_8 : jet_obj_t;
    signal pt_jet_9 : jet_obj_t;
    signal pt_tau_1 : tau_obj_t;
    signal eta_jet_1 : jet_obj_t;
    signal eta_jet_2 : jet_obj_t;
    signal eta_jet_3 : jet_obj_t;
    signal eta_jet_4 : jet_obj_t;
    signal iso_tau_1 : tau_obj_t;
    signal pt_muon_1 : muon_obj_t;
    signal pt_muon_2 : muon_obj_t;
    signal qual_muon_1 : muon_obj_t;
    signal qual_muon_2 : muon_obj_t;
    signal qual_muon_3 : muon_obj_t;
    signal pt_htt_1 : htt_obj_t;
    signal pt_etm_1 : etm_obj_t;
    signal pt_etmhf_1 : etmhf_obj_t;
    -- Correlation cuts    
    signal dr_eg_jet_1 : eg_jet_t;
    signal deta_jet_jet_1 : jet_jet_t;
    signal inv_mass_jet_jet_1 : jet_jet_t;
    signal inv_mass_jet_jet_2 : jet_jet_t;
    signal inv_mass_jet_jet_3 : jet_jet_t;
    signal inv_mass_jet_jet_4 : jet_jet_t;
    signal dr_jet_muon_1 : jet_muon_t;
    signal dr_jet_tau_1 : jet_tau_t;
    -- Muon charge correlation    
    signal cc_quad_1 : muon_cc_quad_t;

-- Conditions inputs
    -- Object cuts "and"  
    signal comb_eg_1 : eg_obj_t;
    signal comb_eg_2 : eg_obj_t;
    signal comb_eg_3 : eg_obj_t;
    signal comb_jet_1 : jet_obj_t;
    signal comb_jet_2 : jet_obj_t;
    signal comb_jet_3 : jet_obj_t;
    signal comb_jet_4 : jet_obj_t;
    signal comb_jet_5 : jet_obj_t;
    signal comb_jet_6 : jet_obj_t;
    signal comb_jet_7 : jet_obj_t;
    signal comb_jet_8 : jet_obj_t;
    signal comb_jet_9 : jet_obj_t;
    signal comb_tau_1 : tau_obj_t;
    signal comb_muon_1 : muon_obj_t;
    signal comb_muon_2 : muon_obj_t;
    signal comb_muon_3 : muon_obj_t;

-- Signal definition for conditions names
    signal single_ext_i25 : std_logic;
    signal single_ext_i26 : std_logic;
    signal single_etm_i23 : std_logic;
    signal single_etmhf_i24 : std_logic;
    signal single_htt_i22 : std_logic;
    signal calo_calo_correlation_i7 : std_logic;
    signal calo_calo_correlation_i8 : std_logic;
    signal calo_muon_correlation_i20 : std_logic;
    signal calo_muon_correlation_i21 : std_logic;
    signal invariant_mass_i10 : std_logic;
    signal invariant_mass_i11 : std_logic;
    signal invariant_mass_i9 : std_logic;
    signal invariant_mass_ov_rm_i19 : std_logic;
    signal double_eg_i2 : std_logic;
    signal double_jet_i13 : std_logic;
    signal double_mu_i0 : std_logic;
    signal quad_jet_i12 : std_logic;
    signal quad_jet_i16 : std_logic;
    signal quad_mu_i1 : std_logic;
    signal single_jet_i14 : std_logic;
    signal single_jet_i15 : std_logic;
    signal single_jet_i3 : std_logic;
    signal single_jet_i4 : std_logic;
    signal single_jet_i5 : std_logic;
    signal single_jet_i6 : std_logic;
    signal triple_jet_i17 : std_logic;
    signal triple_mu_i18 : std_logic;

-- Signal definition for algorithms names
    signal l1_quad_mu_open_os : std_logic;
    signal l1_double_mu0 : std_logic;
    signal l1_single_eg12_single_jet28_mid_eta2p7_min_dr0p4 : std_logic;
    signal l1_single_eg15_single_jet28_mid_eta2p7_min_dr0p4 : std_logic;
    signal l1_double_eg5 : std_logic;
    signal l1_single_jet60_fwd3p0 : std_logic;
    signal l1_single_jet120_fwd3p0 : std_logic;
    signal l1_double_jet30er2p5_mass_min250_d_eta_max1p5 : std_logic;
    signal l1_double_jet30er2p5_mass_min300_d_eta_max1p5 : std_logic;
    signal l1_double_jet30er2p5_mass_min330_d_eta_max1p5 : std_logic;
    signal l1_triple_mu0_oq : std_logic;
    signal l1_mu3_jet35er2p5_d_r_max0p4 : std_logic;
    signal l1_mu3_jet60er2p5_d_r_max0p4 : std_logic;
    signal l1_double_jet35_mass_min450_iso_tau45_rm_ovlp : std_logic;
    signal l1_triple_jet_95_75_65_double_jet_75_65_er2p5 : std_logic;
    signal l1_quad_jet_95_75_65_20_double_jet_75_65_er2p5_jet20_fwd3p0 : std_logic;
    signal l1_quad_jet60er2p5 : std_logic;
    signal l1_htt280er : std_logic;
    signal l1_etm120 : std_logic;
    signal l1_etmhf120 : std_logic;
    signal l1_unpaired_bunch_bptx_plus : std_logic;
    signal l1_unpaired_bunch_bptx_minus : std_logic;
    
begin

-- First stage: calculations

    calc_1_i: entity work.muon_charge_correlations
        port map(
            data.muon(bx(0)).charge,
            data.muon(bx(0)).charge,
            cc_double(bx(0),bx(0)),
            cc_triple(bx(0),bx(0)),
            cc_quad(bx(0),bx(0))
        );

    calc_2_i: entity work.sub_eta
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t)
        )
        port map(
            conv.eg(bx(0)).eta,
            conv.jet(bx(0)).eta,
            sub_eta_eg_jet(bx(0),bx(0))
        );

    calc_3_i: entity work.diff_eta_lut
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t)
        )
        port map(
            sub_eta_eg_jet(bx(0),bx(0)),
            deta_eg_jet(bx(0),bx(0))
        );

    calc_4_i: entity work.sub_phi
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t),
            EG_JET_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.eg(bx(0)).phi,
            conv.jet(bx(0)).phi,
            sub_phi_eg_jet(bx(0),bx(0))
        );

    calc_5_i: entity work.diff_phi_lut
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t)
        )
        port map(
            sub_phi_eg_jet(bx(0),bx(0)),
            dphi_eg_jet(bx(0),bx(0))
        );

    calc_6_i: entity work.delta_r
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t)
        )
        port map(
            deta_eg_jet(bx(0),bx(0)),
            dphi_eg_jet(bx(0),bx(0)),
            dr_eg_jet(bx(0),bx(0))
        );
        
    calc_7_i: entity work.sub_eta
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t)
        )
        port map(
            conv.jet(bx(0)).eta,
            conv.jet(bx(0)).eta,
            sub_eta_jet_jet(bx(0),bx(0))
        );

    calc_8_i: entity work.cosh_deta_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t)
        )
        port map(
            sub_eta_jet_jet(bx(0),bx(0)),
            cosh_deta_jet_jet(bx(0),bx(0))
        );

    calc_9_i: entity work.sub_phi
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t),
            JET_JET_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.jet(bx(0)).phi,
            conv.jet(bx(0)).phi,
            sub_phi_jet_jet(bx(0),bx(0))
        );

    calc_10_i: entity work.cos_dphi_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t)
        )
        port map(
            sub_phi_jet_jet(bx(0),bx(0)),
            cos_dphi_jet_jet(bx(0),bx(0))
        );

    calc_11_i: entity work.invariant_mass
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t),
            JET_PT_VECTOR_WIDTH, JET_PT_VECTOR_WIDTH,
            CALO_CALO_COSH_COS_VECTOR_WIDTH
        )
        port map(
            conv.jet(bx(0)).pt_vector,
            conv.jet(bx(0)).pt_vector,
            cosh_deta_jet_jet(bx(0),bx(0)),
            cos_dphi_jet_jet(bx(0),bx(0)),
            inv_mass_jet_jet(bx(0),bx(0))
        );
        
    calc_12_i: entity work.diff_eta_lut
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t)
        )
        port map(
            sub_eta_jet_jet(bx(0),bx(0)),
            deta_jet_jet(bx(0),bx(0))
        );

    calc_13_i: entity work.sub_eta
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t)
        )
        port map(
            conv.jet(bx(0)).eta,
            conv.tau(bx(0)).eta,
            sub_eta_jet_tau(bx(0),bx(0))
        );

    calc_14_i: entity work.sub_phi
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t),
            JET_TAU_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.jet(bx(0)).phi,
            conv.tau(bx(0)).phi,
            sub_phi_jet_tau(bx(0),bx(0))
        );

    calc_15_i: entity work.sub_eta
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t)
        )
        port map(
            conv.jet(bx(0)).eta_conv_muon,
            conv.muon(bx(0)).eta,
            sub_eta_jet_muon(bx(0),bx(0))
        );

    calc_16_i: entity work.sub_phi
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t),
            JET_MUON_PHI_HALF_RANGE_BINS
        )
        port map(
            conv.jet(bx(0)).phi_conv_muon,
            conv.muon(bx(0)).phi,
            sub_phi_jet_muon(bx(0),bx(0))
        );

    calc_17_i: entity work.diff_eta_lut
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t)
        )
        port map(
            sub_eta_jet_tau(bx(0),bx(0)),
            deta_jet_tau(bx(0),bx(0))
        );

    calc_18_i: entity work.diff_phi_lut
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t)
        )
        port map(
            sub_phi_jet_tau(bx(0),bx(0)),
            dphi_jet_tau(bx(0),bx(0))
        );

    calc_19_i: entity work.diff_eta_lut
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t)
        )
        port map(
            sub_eta_jet_muon(bx(0),bx(0)),
            deta_jet_muon(bx(0),bx(0))
        );

    calc_20_i: entity work.diff_phi_lut
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t)
        )
        port map(
            sub_phi_jet_muon(bx(0),bx(0)),
            dphi_jet_muon(bx(0),bx(0))
        );

    calc_23_i: entity work.cosh_deta_lut
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t)
        )
        port map(
            sub_eta_jet_muon(bx(0),bx(0)),
            cosh_deta_jet_muon(bx(0),bx(0))
        );

    calc_24_i: entity work.cos_dphi_lut
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t)
        )
        port map(
            sub_phi_jet_muon(bx(0),bx(0)),
            cos_dphi_jet_muon(bx(0),bx(0))
        );

    calc_25_i: entity work.delta_r
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t)
        )
        port map(
            deta_jet_muon(bx(0),bx(0)),
            dphi_jet_muon(bx(0),bx(0)),
            dr_jet_muon(bx(0),bx(0))
        );
        
    calc_26_i: entity work.delta_r
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t)
        )
        port map(
            deta_jet_tau(bx(0),bx(0)),
            dphi_jet_tau(bx(0),bx(0)),
            dr_jet_tau(bx(0),bx(0))
        );
        
-- Second stage: comparisons

    comp_1_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,
            GE, X"000A"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, pt_eg_1
        );

    comp_9_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,
            GE, X"0018"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, pt_eg_2
        );

    comp_10_i: entity work.comparators_obj_cuts
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,
            GE, X"001E"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, pt_eg_3
        );

    comp_2_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0078"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_1
        );

    comp_5_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"00F0"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_2
        );

    comp_11_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0038"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_3
        );

    comp_15_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"003C"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_4
        );

    comp_100_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0096"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_5
        );

    comp_101_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0082"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_6
        );

    comp_102_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"00BE"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_7
        );

    comp_103_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0028"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_8
        );

    comp_104_i: entity work.comparators_obj_cuts
        generic map(
            N_ETM_OBJECTS, ETM_PT_WIDTH,
            GE, X"00F0"
        )
        port map(
            lhc_clk, data.etm(bx(0)).pt, pt_etm_1
        );

    comp_105_i: entity work.comparators_obj_cuts
        generic map(
            N_ETMHF_OBJECTS, ETMHF_PT_WIDTH,
            GE, X"00F0"
        )
        port map(
            lhc_clk, data.etmhf(bx(0)).pt, pt_etmhf_1
        );

    comp_106_i: entity work.comparators_obj_cuts
        generic map(
            N_HTT_OBJECTS, HTT_PT_WIDTH,
            GE, X"0230"
        )
        port map(
            lhc_clk, data.htt(bx(0)).pt, pt_htt_1
        );

    comp_107_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0046"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_9
        );

    comp_108_i: entity work.comparators_obj_cuts
        generic map(
            N_TAU_OBJECTS, TAU_PT_WIDTH,
            GE, X"005A"
        )
        port map(
            lhc_clk, data.tau(bx(0)).pt, pt_tau_1
        );

    comp_109_i: entity work.comparators_obj_cuts
        generic map(
            N_TAU_OBJECTS, TAU_ISO_WIDTH,
            GE, X"000E"
        )
        port map(
            lhc_clk, data.tau(bx(0)).iso, iso_tau_1
        );

    comp_6_i: entity work.comparators_obj_cuts
        generic map(
            N_MUON_OBJECTS, MUON_PT_WIDTH,
            GE, X"0001"
        )
        port map(
            lhc_clk, data.muon(bx(0)).pt, pt_muon_1
        );

    comp_110_i: entity work.comparators_obj_cuts
        generic map(
            N_MUON_OBJECTS, MUON_PT_WIDTH,
            GE, X"0007"
        )
        port map(
            lhc_clk, data.muon(bx(0)).pt, pt_muon_2
        );

    comp_3_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA,
            X"008D", X"00BA"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, eta_jet_2
        );
        
    comp_4_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA,
            X"0045", X"0072"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, eta_jet_1
        );

    comp_12_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA,
            X"00C2", X"003D"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, eta_jet_3
        );

     comp_16_i: entity work.comparators_obj_cuts
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA,
            X"00C6", X"0039"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, eta_jet_4
        );

    comp_7_i: entity work.lut_comparator
        generic map(
            N_MUON_OBJECTS, MUON_QUAL_WIDTH,
            X"FF00"
        )
        port map(
            lhc_clk, data.muon(bx(0)).qual, qual_muon_2
        );

    comp_8_i: entity work.lut_comparator
        generic map(
            N_MUON_OBJECTS, MUON_QUAL_WIDTH,
            X"FFF0"
        )
        port map(
            lhc_clk, data.muon(bx(0)).qual, qual_muon_1
        );

    comp_111_i: entity work.lut_comparator
        generic map(
            N_MUON_OBJECTS, MUON_QUAL_WIDTH,
            X"F000"
        )
        port map(
            lhc_clk, data.muon(bx(0)).qual, qual_muon_3
        );

    comp_13_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t),
            DELTAR_VECTOR_WIDTH,
            deltaR,
            X"0000000027100", X"00000084CA240"
        )
        port map(
            lhc_clk, dr_eg_jet(bx(0),bx(0)), dr_eg_jet_1
        );

    comp_112_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS, (jet_t,muon_t),
            DELTAR_VECTOR_WIDTH,
            deltaR,
            X"0000000000000", X"00000000274E8"
        )
        port map(
            lhc_clk, dr_jet_muon(bx(0),bx(0)), dr_jet_muon_1
        );

    comp_113_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS, (jet_t,tau_t),
            DELTAR_VECTOR_WIDTH,
            deltaR,
            X"0000000000000", X"000000000A028"
        )
        port map(
            lhc_clk, dr_jet_tau(bx(0),bx(0)), dr_jet_tau_1
        );

    comp_14_i: entity work.comparator_muon_cc_quad
        generic map(
            CC_OS
        )
        port map(
            lhc_clk, cc_quad(bx(0),bx(0)), cc_quad_1
        );
        
    comp_17_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t),
            JET_JET_MASS_VECTOR_WIDTH,
            mass,
            X"00000BA43B740", X"41A6642C78140"
        )
        port map(
            lhc_clk, inv_mass_jet_jet(bx(0),bx(0)), inv_mass_jet_jet_1
        );

    comp_18_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t),
            JET_JET_MASS_VECTOR_WIDTH,
            mass,
            X"000010C388D00", X"41A6642C78140"
        )
        port map(
            lhc_clk, inv_mass_jet_jet(bx(0),bx(0)), inv_mass_jet_jet_2
        );

    comp_19_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t),
            JET_JET_MASS_VECTOR_WIDTH,
            mass,
            X"00001448C1B40", X"41A6642C78140"
        )
        port map(
            lhc_clk, inv_mass_jet_jet(bx(0),bx(0)), inv_mass_jet_jet_3
        );

    comp_20_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t),
            DELTAETA_VECTOR_WIDTH,
            deltaEta,
            X"0000000000000", X"00000000005DC"
        )
        port map(
            lhc_clk, deta_jet_jet(bx(0),bx(0)), deta_jet_jet_1
        );

    comp_21_i: entity work.comparators_corr_cuts
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS, (jet_t,jet_t),
            JET_JET_MASS_VECTOR_WIDTH,
            mass,
            X"000025B7F3D40", X"41A6642C78140"
        )
        port map(
            lhc_clk, inv_mass_jet_jet(bx(0),bx(0)), inv_mass_jet_jet_4
        );

-- Third stage: conditions and algos
    
    -- Creating condition inputs (combination of object cuts)
    
    comb_eg_1 <= pt_eg_1;
    comb_eg_2 <= pt_eg_2;
    comb_eg_3 <= pt_eg_3;
    comb_jet_1 <= pt_jet_1 and eta_jet_2;
    comb_jet_2 <= pt_jet_1 and eta_jet_1;
    comb_jet_3 <= pt_jet_2 and eta_jet_2;
    comb_jet_4 <= pt_jet_2 and eta_jet_1;
    comb_jet_5 <= pt_jet_3 and eta_jet_3;
    comb_jet_6 <= pt_jet_4 and eta_jet_4;
    comb_jet_7 <= pt_jet_9 and eta_jet_4;
    comb_jet_8 <= pt_jet_1 and eta_jet_4;
    comb_jet_9 <= pt_jet_1;
    comb_tau_1 <= pt_tau_1 and iso_tau_1;
    comb_muon_1 <= pt_muon_1 and qual_muon_2;
    comb_muon_2 <= pt_muon_1 and qual_muon_1;
    comb_muon_3 <= pt_muon_2 and qual_muon_3;
        
    -- Instantiations of conditions
    
    cond_double_eg_i2_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 2,
            ((0,11),(0,11),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_eg_1,
            def.eg_eg, 
            def.cc_double, def.cc_triple, def.cc_quad, 
            double_eg_i2
--             cond_o => double_eg_i2
        );

    cond_single_jet_i3_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_1,
            cond_o => single_jet_i3
        );

    cond_single_jet_i4_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_2,
            cond_o => single_jet_i4
        );

    cond_single_jet_i5_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_3,
            cond_o => single_jet_i5
        );

    cond_single_jet_i6_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_4,
            cond_o => single_jet_i6
        );

    cond_double_mu_i0_i: entity work.combinatorial_conditions
        generic map(
            N_MUON_OBJECTS, 2,
            ((0,7),(0,7),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_muon_1,
            cond_o => double_mu_i0
        );

    cond_quad_mu_i1_i: entity work.combinatorial_conditions
        generic map(
            N_MUON_OBJECTS, 4,
            ((0,7),(0,7),(0,7),(0,7)),
            true
        )
        port map(
            lhc_clk, comb_muon_2,
            def.muon_muon, 
            def.cc_double, def.cc_triple, cc_quad_1, 
            quad_mu_i1
--             charge_corr_quad => cc_quad_1,
--             cond_o => quad_mu_i1
        );

    cond_calo_calo_correlation_i7_i: entity work.correlation_conditions
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            ((0,11),(0,11),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_eg_2, comb_jet_5,
            def.eg_jet, def.eg_jet, dr_eg_jet_1,
            def.eg_jet, def.eg_jet, def.eg_jet,
            def.cc_double,
            calo_calo_correlation_i7
--             delta_r => dr_eg_jet_1,
--             cond_o => calo_calo_correlation_i7
        );

    cond_calo_calo_correlation_i8_i: entity work.correlation_conditions
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            ((0,11),(0,11),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_eg_3, comb_jet_5,
            delta_r => dr_eg_jet_1,
            cond_o => calo_calo_correlation_i8
        );

    cond_invariant_mass_i9_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11),(0,11),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_6, comb_jet_6,
            deta => deta_jet_jet_1,
            inv_mass => inv_mass_jet_jet_1,
            cond_o => invariant_mass_i9
        );

    cond_invariant_mass_i10_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11),(0,11),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_6, comb_jet_6,
            deta => deta_jet_jet_1,
            inv_mass => inv_mass_jet_jet_2,
            cond_o => invariant_mass_i10
        );

    cond_invariant_mass_i11_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_JET_OBJECTS,
            ((0,11),(0,11),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_6, comb_jet_6,
            deta => deta_jet_jet_1,
            inv_mass => inv_mass_jet_jet_3,
            cond_o => invariant_mass_i11
        );

    cond_calo_muon_correlation_i20_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS,
            ((0,11),(0,7),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_7, comb_muon_3,
            delta_r => dr_jet_muon_1,
            cond_o => calo_muon_correlation_i20
        );

    cond_calo_muon_correlation_i21_i: entity work.correlation_conditions
        generic map(
            N_JET_OBJECTS, N_MUON_OBJECTS,
            ((0,11),(0,7),(0,0),(0,0)),
            false
        )
        port map(
            lhc_clk, comb_jet_8, comb_muon_3,
            delta_r => dr_jet_muon_1,
            cond_o => calo_muon_correlation_i21
        );

    cond_invariant_mass_ov_rm_i19_i: entity work.correlation_conditions_ovrm
        generic map(
            N_JET_OBJECTS, N_TAU_OBJECTS,
            ((0,11),(0,11),(0,11),(0,0)),
            false, true
        )
        port map(
            lhc_clk, comb_jet_9, comb_tau_1,
            inv_mass => inv_mass_jet_jet_4,
            dr_ovrm => dr_jet_tau_1,
            cond_o => invariant_mass_ov_rm_i19
        );

    -- External condition assignment
    single_ext_i25 <= data.ext_cond(bx(0))(9); -- single_ext_i25
    single_ext_i26 <= data.ext_cond(bx(0))(10); -- single_ext_i26

    -- Instantiations of algorithms

    -- 0 L1_QuadMuOpen_OS : comb{MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN]}[CHGCOR_OS]
    l1_quad_mu_open_os <= quad_mu_i1;
    algo(12) <= l1_quad_mu_open_os;

    -- 1 L1_DoubleMu0 : comb{MU0[MU-QLTY_DBLE],MU0[MU-QLTY_DBLE]}
    l1_double_mu0 <= double_mu_i0;
    algo(10) <= l1_double_mu0;

    -- 2 L1_SingleEG12_SingleJet28_MidEta2p7_MinDr0p4 : dist{EG12,JET28[JET-ETA_2p7]}[DR_MIN_0p4]
    l1_single_eg12_single_jet28_mid_eta2p7_min_dr0p4 <= calo_calo_correlation_i7;
    algo(17) <= l1_single_eg12_single_jet28_mid_eta2p7_min_dr0p4;

    -- 3 L1_SingleEG15_SingleJet28_MidEta2p7_MinDr0p4 : dist{EG15,JET28[JET-ETA_2p7]}[DR_MIN_0p4]
    l1_single_eg15_single_jet28_mid_eta2p7_min_dr0p4 <= calo_calo_correlation_i8;
    algo(18) <= l1_single_eg15_single_jet28_mid_eta2p7_min_dr0p4;

    -- 4 L1_DoubleEG5 : comb{EG5,EG5}
    l1_double_eg5 <= double_eg_i2;
    algo(5) <= l1_double_eg5;

    -- 5 L1_SingleJet60_FWD3p0 : JET60[JET-ETA_FWD_3p00_NEG] OR JET60[JET-ETA_FWD_3p00_POS]
    l1_single_jet60_fwd3p0 <= single_jet_i3 or single_jet_i4;
    algo(7) <= l1_single_jet60_fwd3p0;

    -- 6 L1_SingleJet120_FWD3p0 : JET120[JET-ETA_FWD_3p00_NEG] OR JET120[JET-ETA_FWD_3p00_POS]
    l1_single_jet120_fwd3p0 <= single_jet_i5 or single_jet_i6;
    algo(6) <= l1_single_jet120_fwd3p0;

    -- 7 L1_DoubleJet30er2p5_Mass_Min250_dEta_Max1p5 : mass_inv{JET30[JET-ETA_2p52],JET30[JET-ETA_2p52]}[MASS_MIN_250,DETA_MAX_1p5]
    l1_double_jet30er2p5_mass_min250_d_eta_max1p5 <= invariant_mass_i9;
    algo(14) <= l1_double_jet30er2p5_mass_min250_d_eta_max1p5;

    -- 8 L1_DoubleJet30er2p5_Mass_Min300_dEta_Max1p5 : mass_inv{JET30[JET-ETA_2p52],JET30[JET-ETA_2p52]}[MASS_MIN_300,DETA_MAX_1p5]
    l1_double_jet30er2p5_mass_min300_d_eta_max1p5 <= invariant_mass_i10;
    algo(15) <= l1_double_jet30er2p5_mass_min300_d_eta_max1p5;

    -- 9 L1_DoubleJet30er2p5_Mass_Min330_dEta_Max1p5 : mass_inv{JET30[JET-ETA_2p52],JET30[JET-ETA_2p52]}[MASS_MIN_330,DETA_MAX_1p5]
    l1_double_jet30er2p5_mass_min330_d_eta_max1p5 <= invariant_mass_i11;
    algo(16) <= l1_double_jet30er2p5_mass_min330_d_eta_max1p5;

    -- 10 L1_TripleMu0_OQ : comb{MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN]}
    l1_triple_mu0_oq <= triple_mu_i18;
    algo(11) <= l1_triple_mu0_oq;

    -- 11 L1_Mu3_Jet35er2p5_dR_Max0p4 : dist{MU3[MU-QLTY_SNGL],JET35[JET-ETA_2p52]}[DR_MAX_0p4]
    l1_mu3_jet35er2p5_d_r_max0p4 <= calo_muon_correlation_i20;
    algo(19) <= l1_mu3_jet35er2p5_d_r_max0p4;

    -- 12 L1_Mu3_Jet60er2p5_dR_Max0p4 : dist{MU3[MU-QLTY_SNGL],JET60[JET-ETA_2p52]}[DR_MAX_0p4]
    l1_mu3_jet60er2p5_d_r_max0p4 <= calo_muon_correlation_i21;
    algo(20) <= l1_mu3_jet60er2p5_d_r_max0p4;

    -- 13 L1_DoubleJet35_Mass_Min450_IsoTau45_RmOvlp : mass_inv_orm{JET35,JET35,TAU45[TAU-ISO_0xE]}[MASS_MIN_450,ORMDR_0p2]
    l1_double_jet35_mass_min450_iso_tau45_rm_ovlp <= invariant_mass_ov_rm_i19;
    algo(21) <= l1_double_jet35_mass_min450_iso_tau45_rm_ovlp;

    -- 14 L1_TripleJet_95_75_65_DoubleJet_75_65_er2p5 : comb{JET95,JET75,JET65} AND comb{JET75[JET-ETA_2p52],JET65[JET-ETA_2p52]}
    l1_triple_jet_95_75_65_double_jet_75_65_er2p5 <= triple_jet_i17 and double_jet_i13;
    algo(8) <= l1_triple_jet_95_75_65_double_jet_75_65_er2p5;

    -- 15 L1_QuadJet_95_75_65_20_DoubleJet_75_65_er2p5_Jet20_FWD3p0 : comb{JET95,JET75,JET65,JET20} AND comb{JET75[JET-ETA_2p52],JET65[JET-ETA_2p52]} AND (JET20[JET-ETA_FWD_3p00_NEG] OR JET20[JET-ETA_FWD_3p00_POS])
    l1_quad_jet_95_75_65_20_double_jet_75_65_er2p5_jet20_fwd3p0 <= quad_jet_i12 and double_jet_i13 and ( single_jet_i14 or single_jet_i15 );
    algo(9) <= l1_quad_jet_95_75_65_20_double_jet_75_65_er2p5_jet20_fwd3p0;

    -- 16 L1_QuadJet60er2p5 : comb{JET60[JET-ETA_2p52],JET60[JET-ETA_2p52],JET60[JET-ETA_2p52],JET60[JET-ETA_2p52]}
    l1_quad_jet60er2p5 <= quad_jet_i16;
    algo(13) <= l1_quad_jet60er2p5;

    -- 17 L1_HTT280er : HTT280
    l1_htt280er <= single_htt_i22;
    algo(4) <= l1_htt280er;

    -- 18 L1_ETM120 : ETM120
    l1_etm120 <= single_etm_i23;
    algo(2) <= l1_etm120;

    -- 19 L1_ETMHF120 : ETMHF120
    l1_etmhf120 <= single_etmhf_i24;
    algo(3) <= l1_etmhf120;

    -- 20 L1_UnpairedBunchBptxPlus : EXT_BPTX_B1NotB2_VME
    l1_unpaired_bunch_bptx_plus <= single_ext_i25;
    algo(1) <= l1_unpaired_bunch_bptx_plus;

    -- 21 L1_UnpairedBunchBptxMinus : EXT_BPTX_B2NotB1_VME
    l1_unpaired_bunch_bptx_minus <= single_ext_i26;
    algo(0) <= l1_unpaired_bunch_bptx_minus;

end architecture rtl;

