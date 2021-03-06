-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 0

-- Name of L1 Trigger Menu:
-- L1Menu_test_mass_3_obj

-- Unique ID of L1 Trigger Menu:
-- 0e904f61-7a41-444f-82a4-5802d4ae02b8

-- Unique ID of firmware implementation:
-- 878d4067-60ad-4080-92ec-170c0b65a7d2

-- Scale set:
-- scales_2018_08_07

-- VHDL producer version
-- v3.0.0
-- ========================================================

-- ********************************************************
-- REMARKS:
-- All instances and declarations for mass_3_obj are done manually!!!
-- Actually mass_3_obj is not in TME and VHDL Producer.
-- ********************************************************

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
    signal deta_calc_mu_mu : obj_bx_max_eta_range_array;
    signal dphi_calc_mu_mu : obj_bx_max_phi_range_array;
    -- Correlation cuts
    signal invmass_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cosh_deta_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    signal cos_dphi_mu_mu :  obj_bx_corr_cuts_std_logic_array;
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
    signal comp_pt_mu_bx_0_0x0015 : mu_obj_t;
-- Correlation cuts
    signal comp_invmass_mu_mu_bx_0_bx_0_0x0000000175d720_0x00000009a7ec80 : mu_mu_t;
    signal comp_mass_3_obj_mu_bx_0_0x0000000175d720_0x00000009a7ec80 : mass_3_obj_mu_t;
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
   signal comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign : mu_obj_t;
-- Signal definition for conditions names
    signal mass_3_obj_i0 : std_logic;
    signal invariant_mass_i0 : std_logic;
-- Signal definition for algorithms names
    signal l1_mass_3_obj : std_logic;
    signal l1_mass_2_obj : std_logic;
begin
-- First stage: calculations
  
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
    comp_pt_mu_bx_0_0x0015_i: entity work.comparators_obj_cuts
        generic map(
            N_MU_OBJECTS, MU_PT_WIDTH,  
            GE,  
            X"0015", X"0000", X"0000", "ign"
        )
        port map(
            lhc_clk, data.mu(bx(0)).pt, comp_pt_mu_bx_0_0x0015
        );
    comp_invmass_mu_mu_bx_0_bx_0_0x0000000175d720_0x00000009a7ec80_i: entity work.comparators_corr_cuts
        generic map(
            N_MU_OBJECTS, N_MU_OBJECTS, (mu_t,mu_t), (bx(0),bx(0)),
            MU_MU_MASS_VECTOR_WIDTH, mass, 
            X"0000000175D720", X"00000009A7EC80"        
        )
        port map(
            lhc_clk, 
            invmass_mu_mu(bx(0),bx(0)), comp_invmass_mu_mu_bx_0_bx_0_0x0000000175d720_0x00000009A7EC80
        );

    comp_mass_3_obj_mu_bx_0_0x0000000175d720_0x00000009a7ec80_i: entity work.comparators_mass_3_obj
        generic map(
            N_MU_OBJECTS,
            MU_MU_MASS_VECTOR_WIDTH, mass,
            X"0000000175D720", X"00000009A7EC80"        
        )
        port map(
            lhc_clk, 
            invmass_mu_mu(bx(0),bx(0)), comp_mass_3_obj_mu_bx_0_0x0000000175d720_0x00000009a7ec80
        );

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign <= 
    comp_pt_mu_bx_0_0x0015
    ;

    -- Instantiations of conditions
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
    
    -- Instantiations of conditions
    cond_mass_3_obj_i0_i: entity work.mass_3_obj_condition
        generic map(
            N_MU_OBJECTS,
            ((0,7), (0,7), (0,7), (0,0)),
            false
        )
        port map(
            lhc_clk,
            in_1 => 
            comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign,
            in_2 => 
            comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign, 
            in_3 => 
            comb_mu_bx_0_pt_0015_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f_qual_ffff_charge_ign, 
            inv_mass => comp_mass_3_obj_mu_bx_0_0x0000000175d720_0x00000009a7ec80,
            cond_o => mass_3_obj_i0
        );
    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 0 L1_mass_3_obj : mass_3_obj{MU10,MU10,MU10}[MASS_MASS_7to18]
    l1_mass_3_obj <= mass_3_obj_i0;
    algo(1) <= l1_mass_3_obj;
-- 1 L1_mass_2_obj : mass_inv{MU10,MU10}[MASS_MASS_7to18]
    l1_mass_2_obj <= invariant_mass_i0;
    algo(0) <= l1_mass_2_obj;

end architecture rtl;
