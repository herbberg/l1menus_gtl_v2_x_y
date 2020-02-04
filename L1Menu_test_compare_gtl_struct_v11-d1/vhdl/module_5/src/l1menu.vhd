-- Description:
-- L1Menu logic generated by VHDL Producer:

-- ========================================================
-- from VHDL producer:

-- Module ID: 5

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
    -- Correlation cuts
    -- Muon charge correlation    
    signal cc_double : obj_bx_muon_cc_double_array;
    signal cc_triple : obj_bx_muon_cc_triple_array;
    signal cc_quad : obj_bx_muon_cc_quad_array;
-- Comparators outputs
    -- Object cuts
-- Correlation cuts
-- Muon charge correlation
-- Conditions inputs
    -- Object cuts "and"
-- Signal definition for conditions names
    signal quad_eg_ov_rm_i7 : std_logic;
-- Signal definition for algorithms names
    signal l1_quad_eg_tau_ormdr : std_logic;
begin
-- First stage: calculations
    
-- Second stage: comparisons

-- Third stage: conditions and algos
    -- Creating condition inputs (combination of object cuts)
    -- Instantiations of conditions
    cond_quad_eg_ov_rm_i7_i: entity work.combinatorial_conditions_ovrm
        generic map(
            N_EG_OBJECTS, N_TAU_OBJECTS, 4,
            ((0,11), (0,11), (0,11), (0,11)),
            ((0,11), (0,0), (0,0), (0,0))
        )
        port map(
            lhc_clk,
            comb_1 =>
            comb_eg_bx_0_pt_0028_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_2 =>
            comb_eg_bx_0_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_3 =>
            comb_eg_bx_0_pt_0050_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_4 =>
            comb_eg_bx_0_pt_0064_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f,
            comb_ovrm =>
            comb_tau_bx_0_pt_003c_eta_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_phi_0000_0000_0000_0000_iso_000f, 
            dr_ovrm => comp_dr_eg_tau_bx_0_bx_0_0x00000000000000_0x0000000000a028,
            cond_o => quad_eg_ov_rm_i7
        );

    
    -- Centrality assignment
    -- External condition assignment
    -- Instantiations of algorithms

-- 0 L1_quad_eg_tau_ormdr : comb_orm{EG20,EG30,EG40,EG50,TAU30}[ORMDR_0p2]
    l1_quad_eg_tau_ormdr <= quad_eg_ov_rm_i7;
    algo(0) <= l1_quad_eg_tau_ormdr;

end architecture rtl;
