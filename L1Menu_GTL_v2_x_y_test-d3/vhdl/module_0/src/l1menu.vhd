-- Description:
-- L1Menu logic generated by VHDL Producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_GTL_v2_x_y_test

-- Unique ID of L1 Trigger Menu:
-- 37d17afa-95d7-4e21-aaf2-5f8ccb7704c1

-- Unique ID of firmware implementation:
-- 09c6b402-4680-4a54-8ebb-880d6e4872bd

-- Scale set:
-- scales_2018_08_07

-- VHDL producer version
-- v2.4.0
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
-- Default signal for correlation cuts (fix in "template" independent of L1Menu content)   
    signal def : default_corr_cuts_rec := (
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), (others => (others => '1')), 
        (others => (others => '1')), (others => (others => '1')), 
        (others => (others => (others => '1'))), (others => (others => (others => (others => '1')))));

-- Calculations outputs
    -- Differences
    signal sub_eta_eg_jet : obj_bx_max_eta_range_array;
    signal sub_phi_eg_jet : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal deta_eg_jet : obj_bx_corr_cuts_std_logic_array;
    signal dphi_eg_jet : obj_bx_corr_cuts_std_logic_array;
    signal dr_eg_jet : obj_bx_corr_cuts_std_logic_array;
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
    signal eta_jet_1 : jet_obj_t;
    signal eta_jet_2 : jet_obj_t;
    signal eta_jet_3 : jet_obj_t;
    signal pt_muon_1 : muon_obj_t;
    signal qual_muon_1 : muon_obj_t;
    signal qual_muon_2 : muon_obj_t;
    -- Correlation cuts    
    signal dr_eg_jet_1 : eg_jet_t;
    -- Muon charge correlation    
    signal cc_double_1 : muon_cc_double_t;
    signal cc_triple_1 : muon_cc_triple_t;
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
    signal comb_muon_1 : muon_obj_t;
    signal comb_muon_2 : muon_obj_t;

-- Conditions outputs
    signal double_eg_i2 : std_logic;
    signal single_jet_i3 : std_logic;
    signal single_jet_i4 : std_logic;
    signal single_jet_i5 : std_logic;
    signal single_jet_i6 : std_logic;
    signal double_mu_i0 : std_logic;
    signal quad_mu_i1 : std_logic;
    signal calo_calo_correlation_i7 : std_logic;
    signal calo_calo_correlation_i8 : std_logic;
    
-- Algorithms
    signal l1_quad_mu_open_os : std_logic;
    signal l1_double_mu0 : std_logic;
    signal l1_single_eg12_single_jet28_mid_eta2p7_min_dr0p4 : std_logic;
    signal l1_single_eg15_single_jet28_mid_eta2p7_min_dr0p4 : std_logic;
    signal l1_double_eg5 : std_logic;
    signal l1_single_jet60_fwd3p0 : std_logic;
    signal l1_single_jet120_fwd3p0 : std_logic;
    
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
            N_EG_OBJECTS, N_JET_OBJECTS
        )
        port map(
            data.eg(bx(0)).eta,
            data.jet(bx(0)).eta,
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
            N_EG_OBJECTS, N_JET_OBJECTS,
            EG_JET_PHI_HALF_RANGE_BINS
        )
        port map(
            data.eg(bx(0)).phi,
            data.jet(bx(0)).phi,
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
            N_EG_OBJECTS, N_JET_OBJECTS
        )
        port map(
            deta_eg_jet(bx(0),bx(0)),
            dphi_eg_jet(bx(0),bx(0)),
            dr_eg_jet(bx(0),bx(0))
        );
        
-- Second stage: comparisons

    comp_1_i: entity work.threshold_comparator
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,
            GE, X"000A"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, pt_eg_1
        );

    comp_2_i: entity work.threshold_comparator
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0078"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_1
        );

    comp_3_i: entity work.range_comparator
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA,
            X"008D", X"00BA"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, eta_jet_2
        );
        
    comp_4_i: entity work.range_comparator
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA,
            X"0045", X"0072"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, eta_jet_1
        );

    comp_5_i: entity work.threshold_comparator
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"00F0"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_2
        );

    comp_6_i: entity work.threshold_comparator
        generic map(
            N_MUON_OBJECTS, MUON_PT_WIDTH,
            GE, X"0001"
        )
        port map(
            lhc_clk, data.muon(bx(0)).pt, pt_muon_1
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

    comp_9_i: entity work.threshold_comparator
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,
            GE, X"0018"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, pt_eg_2
        );

    comp_10_i: entity work.threshold_comparator
        generic map(
            N_EG_OBJECTS, EG_PT_WIDTH,
            GE, X"001E"
        )
        port map(
            lhc_clk, data.eg(bx(0)).pt, pt_eg_3
        );

    comp_11_i: entity work.threshold_comparator
        generic map(
            N_JET_OBJECTS, JET_PT_WIDTH,
            GE, X"0038"
        )
        port map(
            lhc_clk, data.jet(bx(0)).pt, pt_jet_3
        );

    comp_12_i: entity work.range_comparator
        generic map(
            N_JET_OBJECTS, JET_ETA_WIDTH,
            ETA,
            X"00C2", X"003D"
        )
        port map(
            lhc_clk, data.jet(bx(0)).eta, eta_jet_3
        );

    comp_13_i: entity work.comparators_corr_cuts
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            2*DETA_DPHI_VECTOR_WIDTH,
            deltaR,
            X"0000000027100", X"00000084CA240"
        )
        port map(
            lhc_clk, dr_eg_jet(bx(0),bx(0)), dr_eg_jet_1
        );

    comp_14_i: entity work.comparator_muon_charge_corr
        generic map(
            CC_OS
        )
        port map(
            lhc_clk,
            cc_double(bx(0),bx(0)), cc_triple(bx(0),bx(0)), cc_quad(bx(0),bx(0)),
            cc_double_1, cc_triple_1, cc_quad_1
        );
        
    -- Creating condition inputs
    
    comb_eg_1 <= pt_eg_1;
    comb_eg_2 <= pt_eg_2;
    comb_eg_3 <= pt_eg_3;
    comb_jet_1 <= pt_jet_1 and eta_jet_2;
    comb_jet_2 <= pt_jet_1 and eta_jet_1;
    comb_jet_3 <= pt_jet_2 and eta_jet_2;
    comb_jet_4 <= pt_jet_2 and eta_jet_1;
    comb_jet_5 <= pt_jet_3 and eta_jet_3;
    comb_muon_1 <= pt_muon_1 and qual_muon_2;
    comb_muon_2 <= pt_muon_1 and qual_muon_1;
        
-- Third stage: conditions and algos
    
    -- Instantiations of conditions
    
    double_eg_i2_i: entity work.combinatorial_conditions
        generic map(
            N_EG_OBJECTS, 2,
            ((0,11),(0,11),(0,0),(0,0)),
            false, false
        )
        port map(
            lhc_clk, comb_eg_1,
            def.eg_eg, 
            def.cc_double, def.cc_triple, def.cc_quad, 
            double_eg_i2
--             cond_o => double_eg_i2
        );

    single_jet_i3_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false, false
        )
        port map(
            lhc_clk, comb_jet_1,
            cond_o => single_jet_i3
        );

    single_jet_i4_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false, false
        )
        port map(
            lhc_clk, comb_jet_2,
            cond_o => single_jet_i4
        );

    single_jet_i5_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false, false
        )
        port map(
            lhc_clk, comb_jet_3,
            cond_o => single_jet_i5
        );

    single_jet_i6_i: entity work.combinatorial_conditions
        generic map(
            N_JET_OBJECTS, 1,
            ((0,11),(0,0),(0,0),(0,0)),
            false, false
        )
        port map(
            lhc_clk, comb_jet_4,
            cond_o => single_jet_i6
        );

    double_mu_i0_i: entity work.combinatorial_conditions
        generic map(
            N_MUON_OBJECTS, 2,
            ((0,7),(0,7),(0,0),(0,0)),
            false, false
        )
        port map(
            lhc_clk, comb_muon_1,
            cond_o => double_mu_i0
        );

    quad_mu_i1_i: entity work.combinatorial_conditions
        generic map(
            N_MUON_OBJECTS, 4,
            ((0,7),(0,7),(0,7),(0,7)),
            false, true
        )
        port map(
            lhc_clk, comb_muon_2,
            def.muon_muon, 
            def.cc_double, def.cc_triple, cc_quad_1, 
            quad_mu_i1
--             charge_corr_quad => cc_quad_1,
--             cond_o => quad_mu_i1
        );

    calo_calo_correlation_i7_i: entity work.correlation_conditions
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            ((0,11),(0,11),(0,0),(0,0)),
            false, false, true,
            false, false, false,
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

    calo_calo_correlation_i8_i: entity work.correlation_conditions
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            ((0,11),(0,11),(0,0),(0,0)),
            false, false, true,
            false, false, false,
            false
        )
        port map(
            lhc_clk, comb_eg_3, comb_jet_5,
            delta_r => dr_eg_jet_1,
            cond_o => calo_calo_correlation_i8
        );

    -- Instantiations of algorithms

    -- 0 L1_QuadMuOpen_OS : comb{MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN],MU0[MU-QLTY_OPEN]}[CHGCOR_OS]
    l1_quad_mu_open_os <= quad_mu_i1;
    algo(2) <= l1_quad_mu_open_os;

    -- 1 L1_DoubleMu0 : comb{MU0[MU-QLTY_DBLE],MU0[MU-QLTY_DBLE]}
    l1_double_mu0 <= double_mu_i0;
    algo(3) <= l1_double_mu0;

    -- 2 L1_SingleEG12_SingleJet28_MidEta2p7_MinDr0p4 : dist{EG12,JET28[JET-ETA_2p7]}[DR_MIN_0p4]
    l1_single_eg12_single_jet28_mid_eta2p7_min_dr0p4 <= calo_calo_correlation_i7;
    algo(0) <= l1_single_eg12_single_jet28_mid_eta2p7_min_dr0p4;

    -- 3 L1_SingleEG15_SingleJet28_MidEta2p7_MinDr0p4 : dist{EG15,JET28[JET-ETA_2p7]}[DR_MIN_0p4]
    l1_single_eg15_single_jet28_mid_eta2p7_min_dr0p4 <= calo_calo_correlation_i8;
    algo(1) <= l1_single_eg15_single_jet28_mid_eta2p7_min_dr0p4;

    -- 4 L1_DoubleEG5 : comb{EG5,EG5}
    l1_double_eg5 <= double_eg_i2;
    algo(4) <= l1_double_eg5;

    -- 5 L1_SingleJet60_FWD3p0 : JET60[JET-ETA_FWD_3p00_NEG] OR JET60[JET-ETA_FWD_3p00_POS]
    l1_single_jet60_fwd3p0 <= single_jet_i3 or single_jet_i4;
    algo(6) <= l1_single_jet60_fwd3p0;

    -- 6 L1_SingleJet120_FWD3p0 : JET120[JET-ETA_FWD_3p00_NEG] OR JET120[JET-ETA_FWD_3p00_POS]
    l1_single_jet120_fwd3p0 <= single_jet_i5 or single_jet_i6;
    algo(5) <= l1_single_jet120_fwd3p0;

end architecture rtl;

