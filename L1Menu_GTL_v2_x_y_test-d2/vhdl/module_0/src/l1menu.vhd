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
        data_in : in data_pipeline_record;
        conv_in : in conv_pipeline_record;
        algo : out std_logic_vector(NR_ALGOS-1 downto 0));
end l1menu;

architecture rtl of l1menu is

-- Output signals - correlation cuts
    signal cc_double_bx_0_bx_0 : muon_cc_double_array;
    signal cc_triple_bx_0_bx_0 : muon_cc_triple_array;
    signal cc_quad_bx_0_bx_0 : muon_cc_quad_array;
    -- signal sub_eta_eg_bx_0_jet_bx_0 : dim2_max_eta_range_array(0 to N_EG_OBJECTS-1, 0 to N_JET_OBJECTS-1);
    signal sub_eta_eg_jet : obj_bx_max_eta_range_array(0 to BX_PIPELINE_STAGES-1, 0 to BX_PIPELINE_STAGES-1, 0 to MAX_N_OBJ-1, 0 to MAX_N_OBJ-1);
    signal deta_eg_bx_0_jet_bx_0 : deta_dphi_vector_array(0 to N_EG_OBJECTS-1, 0 to N_JET_OBJECTS-1);
    signal sub_phi_eg_bx_0_jet_bx_0 : dim2_max_phi_range_array(0 to N_EG_OBJECTS-1, 0 to N_JET_OBJECTS-1);
    signal dphi_eg_bx_0_jet_bx_0 : deta_dphi_vector_array(0 to N_EG_OBJECTS-1, 0 to N_JET_OBJECTS-1);
    signal dr_eg_bx_0_jet_bx_0 : std_logic_3dim_array(0 to N_EG_OBJECTS-1, 0 to N_JET_OBJECTS-1, (2*DETA_DPHI_VECTOR_WIDTH)-1 downto 0);
    
-- Output signals - comparators    
    signal comp_eg_bx_0_pt_5 : std_logic_vector(N_EG_OBJECTS-1 downto 0);
    signal comp_eg_bx_0_pt_12 : std_logic_vector(N_EG_OBJECTS-1 downto 0);
    signal comp_eg_bx_0_pt_15 : std_logic_vector(N_EG_OBJECTS-1 downto 0);
    signal comp_jet_bx_0_pt_60 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal comp_jet_bx_0_pt_120 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal comp_jet_bx_0_pt_28 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal comp_jet_bx_0_eta_3p00_POS : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal comp_jet_bx_0_eta_3p00_NEG : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal comp_jet_bx_0_eta_2p7 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal comp_muon_bx_0_pt_0 : std_logic_vector(N_MUON_OBJECTS-1 downto 0);
    signal comp_muon_bx_0_qual_QLTY_OPEN : std_logic_vector(N_MUON_OBJECTS-1 downto 0);
    signal comp_muon_bx_0_qual_QLTY_DBLE : std_logic_vector(N_MUON_OBJECTS-1 downto 0);
    
    signal comp_dr_eg_bx_0_jet_bx_0_req_DR_MIN_0p4 : std_logic_2dim_array(N_EG_OBJECTS-1 downto 0, N_JET_OBJECTS-1 downto 0);

    signal comp_cc_double_bx_0_bx_0_OS : std_logic_2dim_array(0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1);
    signal comp_cc_triple_bx_0_bx_0_OS : std_logic_3dim_array(0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1);
    signal comp_cc_quad_bx_0_bx_0_OS : std_logic_4dim_array(0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1);

    signal cond_in_i1 : std_logic_vector(N_EG_OBJECTS-1 downto 0);
    signal cond_in_i2 : std_logic_vector(N_EG_OBJECTS-1 downto 0);
    signal cond_in_i3 : std_logic_vector(N_EG_OBJECTS-1 downto 0);
    signal cond_in_i5 : std_logic_4dim_array(0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1, 0 to N_MUON_OBJECTS-1);
    signal cond_in_i6 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal cond_in_i7 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal cond_in_i8 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal cond_in_i9 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal cond_in_i10 : std_logic_vector(N_MUON_OBJECTS-1 downto 0);
    signal cond_in_i11 : std_logic_vector(N_MUON_OBJECTS-1 downto 0);
    signal cond_in_i12 : std_logic_vector(N_JET_OBJECTS-1 downto 0);
    signal cond_in_i13 : std_logic_2dim_array(N_EG_OBJECTS-1 downto 0, N_JET_OBJECTS-1 downto 0);

    -- Output signals - combinatorial conditions
    signal double_eg_i2 : std_logic;
    signal single_jet_i3 : std_logic;
    signal single_jet_i4 : std_logic;
    signal single_jet_i5 : std_logic;
    signal single_jet_i6 : std_logic;
    signal double_mu_i0 : std_logic;
    signal quad_mu_i1 : std_logic;

-- Output signals - correlation conditions
    signal calo_calo_correlation_i7 : std_logic;
    signal calo_calo_correlation_i8 : std_logic;
    
-- Signals - algorithms names
    signal l1_quad_mu_open_os : std_logic;
    signal l1_double_mu0 : std_logic;
    signal l1_single_eg12_single_jet28_mid_eta2p7_min_dr0p4 : std_logic;
    signal l1_single_eg15_single_jet28_mid_eta2p7_min_dr0p4 : std_logic;
    signal l1_double_eg5 : std_logic;
    signal l1_single_jet60_fwd3p0 : std_logic;
    signal l1_single_jet120_fwd3p0 : std_logic;
    
begin

    muon_charge_correlations_bx_0_bx_0_i: entity work.muon_charge_correlations
        port map(
            in_1 => data_in.muon(bx(0)).charge,
            in_2 => data_in.muon(bx(0)).charge,
            cc_double => cc_double_bx_0_bx_0,
            cc_triple => cc_triple_bx_0_bx_0,
            cc_quad => cc_quad_bx_0_bx_0
        );

    sub_eta_eg_bx_0_jet_bx_0_i: entity work.sub_eta
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS
        )
        port map(
            conv_in.eg(bx(0)).eta,
            conv_in.jet(bx(0)).eta,
            sub_eta_eg_jet(bx(0), bx(0), 0 to N_EG_OBJECTS-1, 0 to N_JET_OBJECTS-1)
        );

    deta_eg_bx_0_jet_bx_0_i: entity work.diff_eta_lut
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t)
        )
        port map(
            sub_eta_eg_jet(bx(0), bx(0), 0 to N_EG_OBJECTS-1, 0 to N_JET_OBJECTS-1),
            deta_eg_bx_0_jet_bx_0
        );

    sub_phi_eg_bx_0_jet_bx_0_i: entity work.sub_phi
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS,
            EG_JET_PHI_HALF_RANGE_BINS
        )
        port map(
            conv_in.eg(bx(0)).phi,
            conv_in.jet(bx(0)).phi,
            sub_phi_eg_bx_0_jet_bx_0
        );

    dphi_eg_bx_0_jet_bx_0_i: entity work.diff_phi_lut
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS, (eg_t,jet_t)
        )
        port map(
            sub_phi_eg_bx_0_jet_bx_0,
            dphi_eg_bx_0_jet_bx_0
        );

    dr_eg_bx_0_jet_bx_0_i: entity work.delta_r
        generic map(
            N_EG_OBJECTS, N_JET_OBJECTS
        )
        port map(
            deta_eg_bx_0_jet_bx_0,
            dphi_eg_bx_0_jet_bx_0,
            dr_eg_bx_0_jet_bx_0
        );
        
    -- Second stage: comparisons

    comp_pt_eg_bx_0_req_5_i: entity work.threshold_comparator
        generic map(
            N_OBJ => N_EG_OBJECTS,
            DATA_WIDTH => EG_PT_WIDTH,
            MODE => GE, -- default value
            THRESHOLD => X"000A"
        )
        port map(
            clk => lhc_clk,
            data => data_in.eg(bx(0)).pt,
            comp_o => comp_eg_bx_0_pt_5
        );

    comp_pt_jet_bx_0_req_60_i: entity work.threshold_comparator
        generic map(
            N_OBJ => N_JET_OBJECTS,
            DATA_WIDTH => JET_PT_WIDTH,
            THRESHOLD => X"0078"
        )
        port map(
            clk => lhc_clk,
            data => data_in.jet(bx(0)).pt,
            comp_o => comp_jet_bx_0_pt_60
        );

    comp_eta_jet_bx_0_req_3p00_NEG_i: entity work.range_comparator
        generic map(
            N_OBJ => N_JET_OBJECTS,
            DATA_WIDTH => JET_ETA_WIDTH,
            MODE => ETA,
            MIN_REQ => X"008D",
            MAX_REQ => X"00BA"
        )
        port map(
            clk => lhc_clk,
            data => data_in.jet(bx(0)).eta,
            comp_o => comp_jet_bx_0_eta_3p00_NEG
        );
        
    comp_eta_jet_bx_0_req_3p00_POS_i: entity work.range_comparator
        generic map(
            N_OBJ => N_JET_OBJECTS,
            DATA_WIDTH => JET_ETA_WIDTH,
            MODE => ETA,
            MIN_REQ => X"0045",
            MAX_REQ => X"0072"
        )
        port map(
            clk => lhc_clk,
            data => data_in.jet(bx(0)).eta,
            comp_o => comp_jet_bx_0_eta_3p00_POS
        );

    comp_pt_jet_bx_0_req_120_i: entity work.threshold_comparator
        generic map(
            N_OBJ => N_JET_OBJECTS,
            DATA_WIDTH => JET_PT_WIDTH,
            THRESHOLD => X"00F0"
        )
        port map(
            clk => lhc_clk,
            data => data_in.jet(bx(0)).pt,
            comp_o => comp_jet_bx_0_pt_120
        );

    comp_pt_muon_bx_0_req_0_i: entity work.threshold_comparator
        generic map(
            N_OBJ => N_MUON_OBJECTS,
            DATA_WIDTH => MUON_PT_WIDTH,
            THRESHOLD => X"0001"
        )
        port map(
            clk => lhc_clk,
            data => data_in.muon(bx(0)).pt,
            comp_o => comp_muon_bx_0_pt_0
        );

    comp_qual_muon_bx_0_req_QLTY_DBLE_i: entity work.lut_comparator
        generic map(
            N_OBJ => N_MUON_OBJECTS,
            DATA_WIDTH => MUON_QUAL_WIDTH,
            LUT => X"FF00"
        )
        port map(
            clk => lhc_clk,
            data => data_in.muon(bx(0)).qual,
            comp_o => comp_muon_bx_0_qual_QLTY_DBLE
        );

    comp_qual_muon_bx_0_req_QLTY_OPEN_i: entity work.lut_comparator
        generic map(
            N_OBJ => N_MUON_OBJECTS,
            DATA_WIDTH => MUON_QUAL_WIDTH,
            LUT => X"FFF0"
        )
        port map(
            clk => lhc_clk,
            data => data_in.muon(bx(0)).qual,
            comp_o => comp_muon_bx_0_qual_QLTY_OPEN
        );

    comp_pt_eg_bx_0_req_12_i: entity work.threshold_comparator
        generic map(
            N_OBJ => N_EG_OBJECTS,
            DATA_WIDTH => EG_PT_WIDTH,
            THRESHOLD => X"0018"
        )
        port map(
            clk => lhc_clk,
            data => data_in.eg(bx(0)).pt,
            comp_o => comp_eg_bx_0_pt_12
        );

    comp_pt_eg_bx_0_req_15_i: entity work.threshold_comparator
        generic map(
            N_OBJ => N_EG_OBJECTS,
            DATA_WIDTH => EG_PT_WIDTH,
            THRESHOLD => X"001E"
        )
        port map(
            clk => lhc_clk,
            data => data_in.eg(bx(0)).pt,
            comp_o => comp_eg_bx_0_pt_15
        );

    comp_pt_jet_bx_0_req_28_i: entity work.threshold_comparator
        generic map(
            N_OBJ => N_JET_OBJECTS,
            DATA_WIDTH => JET_PT_WIDTH,
            THRESHOLD => X"0038"
        )
        port map(
            clk => lhc_clk,
            data => data_in.jet(bx(0)).pt,
            comp_o => comp_jet_bx_0_pt_28
        );

    comp_eta_jet_bx_0_req_2p7_i: entity work.range_comparator
        generic map(
            N_OBJ => N_JET_OBJECTS,
            DATA_WIDTH => JET_ETA_WIDTH,
            MODE => ETA,
            MIN_REQ => X"00C2",
            MAX_REQ => X"003D"
        )
        port map(
            clk => lhc_clk,
            data => data_in.jet(bx(0)).eta,
            comp_o => comp_jet_bx_0_eta_2p7
        );

    comp_dr_eg_bx_0_jet_bx_0_req_DR_MIN_0p4_i: entity work.comparators_corr_cuts
        generic map(
            N_OBJ_1 => N_EG_OBJECTS,
            N_OBJ_2 => N_JET_OBJECTS,
            DATA_WIDTH => 2*DETA_DPHI_VECTOR_WIDTH,
            MODE => deltaR,
            MIN_REQ => X"0000000027100",
            MAX_REQ => X"00000084CA240"
        )
        port map(
            clk => lhc_clk,
            data => dr_eg_bx_0_jet_bx_0,
            comp_o => comp_dr_eg_bx_0_jet_bx_0_req_DR_MIN_0p4
        );

    comp_cc_quad_bx_0_bx_0_OS_i: entity work.comparator_muon_charge_corr
        generic map(
            REQ => CC_OS
        )
        port map(
            clk => lhc_clk,
            cc_double => cc_double_bx_0_bx_0,
            cc_triple => cc_triple_bx_0_bx_0,
            cc_quad => cc_quad_bx_0_bx_0,
            comp_o_double => comp_cc_double_bx_0_bx_0_OS,
            comp_o_triple => comp_cc_triple_bx_0_bx_0_OS,
            comp_o_quad => comp_cc_quad_bx_0_bx_0_OS
        );
        
    cond_in_i1 <= comp_eg_bx_0_pt_5;
    cond_in_i2 <= comp_eg_bx_0_pt_12;
    cond_in_i3 <= comp_eg_bx_0_pt_15;
    cond_in_i5 <= comp_cc_quad_bx_0_bx_0_OS;    
    cond_in_i6 <= comp_jet_bx_0_pt_60 and comp_jet_bx_0_eta_3p00_NEG;
    cond_in_i7 <= comp_jet_bx_0_pt_60 and comp_jet_bx_0_eta_3p00_POS;
    cond_in_i8 <= comp_jet_bx_0_pt_120 and comp_jet_bx_0_eta_3p00_NEG;
    cond_in_i9 <= comp_jet_bx_0_pt_120 and comp_jet_bx_0_eta_3p00_POS;
    cond_in_i10 <= comp_muon_bx_0_pt_0 and comp_muon_bx_0_qual_QLTY_DBLE;
    cond_in_i11 <= comp_muon_bx_0_pt_0 and comp_muon_bx_0_qual_QLTY_OPEN;
    cond_in_i12 <= comp_jet_bx_0_pt_28 and comp_jet_bx_0_eta_2p7;
    cond_in_i13 <= comp_dr_eg_bx_0_jet_bx_0_req_DR_MIN_0p4;
        
    -- Third stage: conditions and algos
    double_eg_i2_i: entity work.combinatorial_conditions
        generic map(
            N_OBJ => N_EG_OBJECTS,
            N_REQ => 2,
            SLICES => ((0,11),(0,11),(0,0),(0,0)),
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i1,
            in_2 => cond_in_i1,
            cond_o => double_eg_i2
        );

    single_jet_i3_i: entity work.combinatorial_conditions
        generic map(
            N_OBJ => N_JET_OBJECTS,
            N_REQ => 1,
            SLICES => ((0,11),(0,0),(0,0),(0,0)),
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i6,
            cond_o => single_jet_i3
        );

    single_jet_i4_i: entity work.combinatorial_conditions
        generic map(
            N_OBJ => N_JET_OBJECTS,
            N_REQ => 1,
            SLICES => ((0,11),(0,0),(0,0),(0,0)),
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i7,
            cond_o => single_jet_i4
        );

    single_jet_i5_i: entity work.combinatorial_conditions
        generic map(
            N_OBJ => N_JET_OBJECTS,
            N_REQ => 1,
            SLICES => ((0,11),(0,0),(0,0),(0,0)),
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i8,
            cond_o => single_jet_i5
        );

    single_jet_i6_i: entity work.combinatorial_conditions
        generic map(
            N_OBJ => N_JET_OBJECTS,
            N_REQ => 1,
            SLICES => ((0,11),(0,0),(0,0),(0,0)),
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i9,
            cond_o => single_jet_i6
        );

    double_mu_i0_i: entity work.combinatorial_conditions
        generic map(
            N_OBJ => N_MUON_OBJECTS,
            N_REQ => 2,
            SLICES => ((0,7),(0,7),(0,0),(0,0)),
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i10,
            in_2 => cond_in_i10,
            cond_o => double_mu_i0
        );

    quad_mu_i1_i: entity work.combinatorial_conditions
        generic map(
            N_OBJ => N_MUON_OBJECTS,
            N_REQ => 4,
            SLICES => ((0,7),(0,7),(0,7),(0,7)),
            TBPT_SEL => false,
            CHARGE_CORR_SEL => true
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i11,
            in_2 => cond_in_i11,
            in_3 => cond_in_i11,
            in_4 => cond_in_i11,
            charge_corr_quad => cond_in_i5,
            cond_o => quad_mu_i1
        );

    calo_calo_correlation_i7_i: entity work.correlation_conditions
        generic map(
            N_OBJ_1 => N_EG_OBJECTS,
            N_OBJ_2 => N_JET_OBJECTS,
            SLICES => ((0,11),(0,11),(0,0),(0,0)),
            DETA_SEL => false,
            DPHI_SEL => false,
            DR_SEL => true,
            INV_MASS_SEL => false,
            TRANS_MASS_SEL => false,
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i2,
            in_2 => cond_in_i12,
            delta_r => cond_in_i13,
            cond_o => calo_calo_correlation_i7
        );

    calo_calo_correlation_i8_i: entity work.correlation_conditions
        generic map(
            N_OBJ_1 => N_EG_OBJECTS,
            N_OBJ_2 => N_JET_OBJECTS,
            SLICES => ((0,11),(0,11),(0,0),(0,0)),
            DETA_SEL => false,
            DPHI_SEL => false,
            DR_SEL => true,
            INV_MASS_SEL => false,
            TRANS_MASS_SEL => false,
            TBPT_SEL => false,
            CHARGE_CORR_SEL => false
        )
        port map(
            clk => lhc_clk,
            in_1 => cond_in_i3,
            in_2 => cond_in_i12,
            delta_r => cond_in_i13,
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

