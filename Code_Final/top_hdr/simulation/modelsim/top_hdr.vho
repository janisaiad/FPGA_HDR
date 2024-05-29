-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "05/27/2024 18:14:16"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_hdr IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	SW : IN std_logic_vector(15 DOWNTO 0);
	VGA_CLK : OUT std_logic;
	VGA_HS : INOUT std_logic;
	VGA_VS : INOUT std_logic;
	VGA_BLANK_N : OUT std_logic;
	VGA_SYNC_N : OUT std_logic;
	VGA_R : OUT std_logic_vector(7 DOWNTO 0);
	VGA_G : OUT std_logic_vector(7 DOWNTO 0);
	VGA_B : OUT std_logic_vector(7 DOWNTO 0);
	CMOS_DATA : IN std_logic_vector(9 DOWNTO 0);
	CMOS_PIXCLK : IN std_logic;
	CMOS_LVAL : IN std_logic;
	CMOS_FVAL : IN std_logic;
	CMOS_MCLK : OUT std_logic;
	CMOS_SCLK : OUT std_logic;
	CMOS_SDAT : INOUT std_logic;
	LEDG : OUT std_logic_vector(7 DOWNTO 0);
	DRAM_ADDR : OUT std_logic_vector(12 DOWNTO 0);
	DRAM_DQ : INOUT std_logic_vector(15 DOWNTO 0);
	DRAM_WE_N : OUT std_logic;
	DRAM_CAS_N : OUT std_logic;
	DRAM_RAS_N : OUT std_logic;
	DRAM_CS_N : OUT std_logic;
	DRAM_CLK : OUT std_logic;
	DRAM_UDQM : OUT std_logic_vector(1 DOWNTO 0);
	DRAM_LDQM : OUT std_logic_vector(1 DOWNTO 0);
	DRAM_BA : OUT std_logic_vector(1 DOWNTO 0)
	);
END top_hdr;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_CLK	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_BLANK_N	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_SYNC_N	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[0]	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[1]	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[2]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[3]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[4]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[5]	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[6]	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_R[7]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[0]	=>  Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[1]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[2]	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[3]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[4]	=>  Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[5]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[6]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_G[7]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[0]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[1]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[2]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[3]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[4]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[5]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[6]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_B[7]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CMOS_DATA[0]	=>  Location: PIN_AB22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[1]	=>  Location: PIN_AC15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_PIXCLK	=>  Location: PIN_AC19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_MCLK	=>  Location: PIN_AF16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CMOS_SCLK	=>  Location: PIN_AF24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_ADDR[0]	=>  Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[1]	=>  Location: PIN_V8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[2]	=>  Location: PIN_U8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[3]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[4]	=>  Location: PIN_V5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[5]	=>  Location: PIN_W8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[6]	=>  Location: PIN_W7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[7]	=>  Location: PIN_AA7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[8]	=>  Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[9]	=>  Location: PIN_Y6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[10]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[11]	=>  Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_ADDR[12]	=>  Location: PIN_Y7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_WE_N	=>  Location: PIN_V6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_CAS_N	=>  Location: PIN_V7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_RAS_N	=>  Location: PIN_U6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_CS_N	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_CLK	=>  Location: PIN_AE5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_UDQM[0]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_UDQM[1]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_LDQM[0]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_LDQM[1]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DRAM_BA[0]	=>  Location: PIN_U7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_BA[1]	=>  Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[0]	=>  Location: PIN_W3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[1]	=>  Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[2]	=>  Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[3]	=>  Location: PIN_W1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[4]	=>  Location: PIN_V3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[5]	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[6]	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[7]	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[8]	=>  Location: PIN_Y3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[9]	=>  Location: PIN_Y4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[10]	=>  Location: PIN_AB1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[11]	=>  Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[12]	=>  Location: PIN_AB2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[13]	=>  Location: PIN_AC1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[14]	=>  Location: PIN_AB3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- DRAM_DQ[15]	=>  Location: PIN_AC2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_HS	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- VGA_VS	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CMOS_SDAT	=>  Location: PIN_AE21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CMOS_LVAL	=>  Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_FVAL	=>  Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[2]	=>  Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[3]	=>  Location: PIN_Y17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[4]	=>  Location: PIN_AC21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[5]	=>  Location: PIN_Y16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[6]	=>  Location: PIN_AD21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[7]	=>  Location: PIN_AE16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[8]	=>  Location: PIN_AD15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CMOS_DATA[9]	=>  Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_hdr IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_VGA_CLK : std_logic;
SIGNAL ww_VGA_BLANK_N : std_logic;
SIGNAL ww_VGA_SYNC_N : std_logic;
SIGNAL ww_VGA_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_CMOS_DATA : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_CMOS_PIXCLK : std_logic;
SIGNAL ww_CMOS_LVAL : std_logic;
SIGNAL ww_CMOS_FVAL : std_logic;
SIGNAL ww_CMOS_MCLK : std_logic;
SIGNAL ww_CMOS_SCLK : std_logic;
SIGNAL ww_LEDG : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_DRAM_ADDR : std_logic_vector(12 DOWNTO 0);
SIGNAL ww_DRAM_WE_N : std_logic;
SIGNAL ww_DRAM_CAS_N : std_logic;
SIGNAL ww_DRAM_RAS_N : std_logic;
SIGNAL ww_DRAM_CS_N : std_logic;
SIGNAL ww_DRAM_CLK : std_logic;
SIGNAL ww_DRAM_UDQM : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_DRAM_LDQM : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_DRAM_BA : std_logic_vector(1 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBDATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock_25~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a24~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a25~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a42~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a34~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a26~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a43~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a35~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a19~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a3~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a44~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a36~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a20~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a4~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a13~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a30~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a23~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a7~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31~portadataout\ : std_logic;
SIGNAL \G1|G2|Add1~8_combout\ : std_logic;
SIGNAL \G1|G2|Add0~0_combout\ : std_logic;
SIGNAL \G1|G2|Add0~11\ : std_logic;
SIGNAL \G1|G2|Add2~19_combout\ : std_logic;
SIGNAL \G1|G2|Add0~12_combout\ : std_logic;
SIGNAL \G1|G3|Add0~10_combout\ : std_logic;
SIGNAL \G1|G3|Add0~12_combout\ : std_logic;
SIGNAL \G1|G3|Add0~25\ : std_logic;
SIGNAL \G1|G3|Add0~26_combout\ : std_logic;
SIGNAL \G1|G3|Add0~27\ : std_logic;
SIGNAL \G1|G3|Add0~28_combout\ : std_logic;
SIGNAL \G1|G3|Add0~29\ : std_logic;
SIGNAL \G1|G3|Add0~30_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~8_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~12_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~14_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~16_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~18_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~30_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux0~4_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~0_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~1_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~2_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK2~q\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK2~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK2~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK2~2_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK2~3_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~12_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|DIR~5_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|DIR~6_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux10~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux10~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_DATA[12]~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux4~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux4~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux3~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux11~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux11~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux8~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux2~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux7~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux0~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux0~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux12~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux12~1_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \CMOS_DATA[0]~input_o\ : std_logic;
SIGNAL \CMOS_DATA[1]~input_o\ : std_logic;
SIGNAL \CMOS_PIXCLK~input_o\ : std_logic;
SIGNAL \DRAM_DQ[0]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[1]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[2]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[3]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[4]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[5]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[6]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[7]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[8]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[9]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[10]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[11]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[12]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[13]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[14]~input_o\ : std_logic;
SIGNAL \DRAM_DQ[15]~input_o\ : std_logic;
SIGNAL \VGA_HS~input_o\ : std_logic;
SIGNAL \VGA_VS~input_o\ : std_logic;
SIGNAL \CMOS_DATA[4]~input_o\ : std_logic;
SIGNAL \CMOS_DATA[5]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_DATA[12]~feeder_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD[10]~feeder_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD[5]~feeder_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD[8]~feeder_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD[0]~feeder_combout\ : std_logic;
SIGNAL \DRAM_DQ[0]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[1]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[2]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[3]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[4]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[5]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[6]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[7]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[8]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[9]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[10]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[11]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[12]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[13]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[14]~output_o\ : std_logic;
SIGNAL \DRAM_DQ[15]~output_o\ : std_logic;
SIGNAL \VGA_HS~output_o\ : std_logic;
SIGNAL \VGA_VS~output_o\ : std_logic;
SIGNAL \CMOS_SDAT~output_o\ : std_logic;
SIGNAL \VGA_CLK~output_o\ : std_logic;
SIGNAL \VGA_BLANK_N~output_o\ : std_logic;
SIGNAL \VGA_SYNC_N~output_o\ : std_logic;
SIGNAL \VGA_R[0]~output_o\ : std_logic;
SIGNAL \VGA_R[1]~output_o\ : std_logic;
SIGNAL \VGA_R[2]~output_o\ : std_logic;
SIGNAL \VGA_R[3]~output_o\ : std_logic;
SIGNAL \VGA_R[4]~output_o\ : std_logic;
SIGNAL \VGA_R[5]~output_o\ : std_logic;
SIGNAL \VGA_R[6]~output_o\ : std_logic;
SIGNAL \VGA_R[7]~output_o\ : std_logic;
SIGNAL \VGA_G[0]~output_o\ : std_logic;
SIGNAL \VGA_G[1]~output_o\ : std_logic;
SIGNAL \VGA_G[2]~output_o\ : std_logic;
SIGNAL \VGA_G[3]~output_o\ : std_logic;
SIGNAL \VGA_G[4]~output_o\ : std_logic;
SIGNAL \VGA_G[5]~output_o\ : std_logic;
SIGNAL \VGA_G[6]~output_o\ : std_logic;
SIGNAL \VGA_G[7]~output_o\ : std_logic;
SIGNAL \VGA_B[0]~output_o\ : std_logic;
SIGNAL \VGA_B[1]~output_o\ : std_logic;
SIGNAL \VGA_B[2]~output_o\ : std_logic;
SIGNAL \VGA_B[3]~output_o\ : std_logic;
SIGNAL \VGA_B[4]~output_o\ : std_logic;
SIGNAL \VGA_B[5]~output_o\ : std_logic;
SIGNAL \VGA_B[6]~output_o\ : std_logic;
SIGNAL \VGA_B[7]~output_o\ : std_logic;
SIGNAL \CMOS_MCLK~output_o\ : std_logic;
SIGNAL \CMOS_SCLK~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \LEDG[5]~output_o\ : std_logic;
SIGNAL \LEDG[6]~output_o\ : std_logic;
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[0]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[1]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[2]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[3]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[4]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[5]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[6]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[7]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[8]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[9]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[10]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[11]~output_o\ : std_logic;
SIGNAL \DRAM_ADDR[12]~output_o\ : std_logic;
SIGNAL \DRAM_WE_N~output_o\ : std_logic;
SIGNAL \DRAM_CAS_N~output_o\ : std_logic;
SIGNAL \DRAM_RAS_N~output_o\ : std_logic;
SIGNAL \DRAM_CS_N~output_o\ : std_logic;
SIGNAL \DRAM_CLK~output_o\ : std_logic;
SIGNAL \DRAM_UDQM[0]~output_o\ : std_logic;
SIGNAL \DRAM_UDQM[1]~output_o\ : std_logic;
SIGNAL \DRAM_LDQM[0]~output_o\ : std_logic;
SIGNAL \DRAM_LDQM[1]~output_o\ : std_logic;
SIGNAL \DRAM_BA[0]~output_o\ : std_logic;
SIGNAL \DRAM_BA[1]~output_o\ : std_logic;
SIGNAL \clock_25~0_combout\ : std_logic;
SIGNAL \clock_25~feeder_combout\ : std_logic;
SIGNAL \clock_25~q\ : std_logic;
SIGNAL \clock_25~clkctrl_outclk\ : std_logic;
SIGNAL \G1|G2|hcount[0]~10_combout\ : std_logic;
SIGNAL \G1|G2|hcount[7]~25\ : std_logic;
SIGNAL \G1|G2|hcount[8]~26_combout\ : std_logic;
SIGNAL \G1|G2|LessThan4~0_combout\ : std_logic;
SIGNAL \G1|G2|LessThan4~1_combout\ : std_logic;
SIGNAL \G1|G2|hcount[0]~11\ : std_logic;
SIGNAL \G1|G2|hcount[1]~12_combout\ : std_logic;
SIGNAL \G1|G2|hcount[1]~13\ : std_logic;
SIGNAL \G1|G2|hcount[2]~15\ : std_logic;
SIGNAL \G1|G2|hcount[3]~16_combout\ : std_logic;
SIGNAL \G1|G2|hcount[3]~17\ : std_logic;
SIGNAL \G1|G2|hcount[4]~18_combout\ : std_logic;
SIGNAL \G1|G2|hcount[4]~19\ : std_logic;
SIGNAL \G1|G2|hcount[5]~20_combout\ : std_logic;
SIGNAL \G1|G2|hcount[5]~21\ : std_logic;
SIGNAL \G1|G2|hcount[6]~23\ : std_logic;
SIGNAL \G1|G2|hcount[7]~24_combout\ : std_logic;
SIGNAL \G1|G2|hcount[8]~27\ : std_logic;
SIGNAL \G1|G2|hcount[9]~28_combout\ : std_logic;
SIGNAL \G1|G2|LessThan5~0_combout\ : std_logic;
SIGNAL \G1|G2|LessThan5~1_combout\ : std_logic;
SIGNAL \G1|G2|vga_hsync~reg0_q\ : std_logic;
SIGNAL \G1|G2|vcount[0]~10_combout\ : std_logic;
SIGNAL \G1|G2|vcount[4]~19\ : std_logic;
SIGNAL \G1|G2|vcount[5]~20_combout\ : std_logic;
SIGNAL \G1|G2|Equal0~1_combout\ : std_logic;
SIGNAL \G1|G2|Equal0~0_combout\ : std_logic;
SIGNAL \G1|G2|Equal0~2_combout\ : std_logic;
SIGNAL \G1|G2|vcount[5]~21\ : std_logic;
SIGNAL \G1|G2|vcount[6]~22_combout\ : std_logic;
SIGNAL \G1|G2|vcount[6]~23\ : std_logic;
SIGNAL \G1|G2|vcount[7]~24_combout\ : std_logic;
SIGNAL \G1|G2|vcount[7]~25\ : std_logic;
SIGNAL \G1|G2|vcount[8]~27\ : std_logic;
SIGNAL \G1|G2|vcount[9]~28_combout\ : std_logic;
SIGNAL \G1|G2|LessThan6~1_combout\ : std_logic;
SIGNAL \G1|G2|LessThan6~2_combout\ : std_logic;
SIGNAL \G1|G2|vcount[0]~11\ : std_logic;
SIGNAL \G1|G2|vcount[1]~12_combout\ : std_logic;
SIGNAL \G1|G2|vcount[1]~13\ : std_logic;
SIGNAL \G1|G2|vcount[2]~14_combout\ : std_logic;
SIGNAL \G1|G2|vcount[2]~15\ : std_logic;
SIGNAL \G1|G2|vcount[3]~17\ : std_logic;
SIGNAL \G1|G2|vcount[4]~18_combout\ : std_logic;
SIGNAL \G1|G2|vcount[8]~26_combout\ : std_logic;
SIGNAL \G1|G2|LessThan6~0_combout\ : std_logic;
SIGNAL \G1|G2|LessThan7~1_combout\ : std_logic;
SIGNAL \G1|G2|vga_vsync~0_combout\ : std_logic;
SIGNAL \G1|G2|vga_vsync~reg0_q\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~7\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~12_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[0]~_wirecell_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~6_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~19\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[5]~20_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~10_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[0]~5_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[2]~10\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[3]~12\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[4]~14_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[0]~6\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[1]~7_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[1]~8\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[2]~9_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_CLK_DIV[3]~11_combout\ : std_logic;
SIGNAL \G1|G3|G0|Equal0~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Equal0~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux5~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|FIN~q\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[0]~5_combout\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[2]~13_combout\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[2]~14_combout\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[0]~6\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[1]~7_combout\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[1]~8\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[2]~10\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[3]~12\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[4]~15_combout\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[3]~11_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~10_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~11_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK1~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK1~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK1~2_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK1~3_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK1~4_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK1~q\ : std_logic;
SIGNAL \CMOS_SDAT~input_o\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK3~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK3~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK3~q\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ACK~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~13_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~14_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST.st20_next_data~q\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~15_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~17_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~16_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST.st0_send_data~q\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST~12_combout\ : std_logic;
SIGNAL \G1|G3|G0|mSetup_ST.st10_wait_ack~q\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_GO~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_GO~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_GO~q\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~13\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~14_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~15\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~16_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~17\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~18_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~9_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~10_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~11_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~13_combout\ : std_logic;
SIGNAL \G1|G3|G0|LUT_INDEX[2]~9_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux6~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|mI2C_DATA[12]~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD[12]~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~6_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~7_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux5~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~2_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux9~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux1~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|Mux1~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~3_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~4_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~5_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~8_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux1~14_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SDO~q\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|DIR~8_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|DIR~9_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|DIR~4_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|DIR~7_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|DIR~q\ : std_logic;
SIGNAL \G1|G2|vga_nblank~combout\ : std_logic;
SIGNAL \G1|G2|vcount[3]~16_combout\ : std_logic;
SIGNAL \G1|G2|LessThan7~0_combout\ : std_logic;
SIGNAL \G1|G2|LessThan2~0_combout\ : std_logic;
SIGNAL \G1|G2|LessThan2~1_combout\ : std_logic;
SIGNAL \G1|G2|vga_rgb~1_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \CMOS_DATA[2]~input_o\ : std_logic;
SIGNAL \CMOS_LVAL~input_o\ : std_logic;
SIGNAL \CMOS_FVAL~input_o\ : std_logic;
SIGNAL \G1|G3|p1~0_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[0]~0_combout\ : std_logic;
SIGNAL \CMOS_DATA[3]~input_o\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[0]~1\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[1]~2_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[1]~3\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[2]~4_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[2]~5\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[3]~6_combout\ : std_logic;
SIGNAL \CMOS_DATA[6]~input_o\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[3]~7\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[4]~8_combout\ : std_logic;
SIGNAL \CMOS_DATA[7]~input_o\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[4]~9\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[5]~10_combout\ : std_logic;
SIGNAL \CMOS_DATA[8]~input_o\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[5]~11\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[6]~12_combout\ : std_logic;
SIGNAL \CMOS_DATA[9]~input_o\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[6]~13\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[7]~14_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[7]~15\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutinverse[8]~16_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[0]~1\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[1]~3\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[2]~4_combout\ : std_logic;
SIGNAL \G0|lut_offset_inverse[0]~feeder_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[2]~5\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[3]~7\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[4]~9\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[5]~11\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[6]~13\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[7]~15\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[8]~16_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[8]~17\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[9]~18_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[9]~19\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[10]~20_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[7]~14_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[6]~12_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[5]~10_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[4]~8_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[3]~6_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[1]~2_combout\ : std_logic;
SIGNAL \G1|address_pixel_ram_lutnormal[0]~0_combout\ : std_logic;
SIGNAL \G1|G3|Add0~0_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~3_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~4_combout\ : std_logic;
SIGNAL \G1|G3|Add0~1\ : std_logic;
SIGNAL \G1|G3|Add0~2_combout\ : std_logic;
SIGNAL \G1|G3|Add0~3\ : std_logic;
SIGNAL \G1|G3|Add0~4_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~5_combout\ : std_logic;
SIGNAL \G1|G3|Add0~5\ : std_logic;
SIGNAL \G1|G3|Add0~6_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~6_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~7_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~8_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~9_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~10_combout\ : std_logic;
SIGNAL \G1|G3|Add0~7\ : std_logic;
SIGNAL \G1|G3|Add0~8_combout\ : std_logic;
SIGNAL \G1|G3|Add0~9\ : std_logic;
SIGNAL \G1|G3|Add0~11\ : std_logic;
SIGNAL \G1|G3|Add0~13\ : std_logic;
SIGNAL \G1|G3|Add0~14_combout\ : std_logic;
SIGNAL \G1|G3|Add0~15\ : std_logic;
SIGNAL \G1|G3|Add0~16_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~11_combout\ : std_logic;
SIGNAL \G1|G3|Add0~17\ : std_logic;
SIGNAL \G1|G3|Add0~18_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~12_combout\ : std_logic;
SIGNAL \G1|G3|Add0~19\ : std_logic;
SIGNAL \G1|G3|Add0~20_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~13_combout\ : std_logic;
SIGNAL \G1|G3|Add0~21\ : std_logic;
SIGNAL \G1|G3|Add0~22_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~14_combout\ : std_logic;
SIGNAL \G1|G3|Add0~23\ : std_logic;
SIGNAL \G1|G3|Add0~24_combout\ : std_logic;
SIGNAL \G1|G3|pixel_address~15_combout\ : std_logic;
SIGNAL \G1|G2|hcount[6]~22_combout\ : std_logic;
SIGNAL \G1|G2|LessThan0~0_combout\ : std_logic;
SIGNAL \G1|G2|vga_rgb~0_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[0]~0_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[1]~1_combout\ : std_logic;
SIGNAL \G1|G2|hcount[2]~14_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[2]~2_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[3]~3_combout\ : std_logic;
SIGNAL \G1|G2|Add1~0_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[4]~4_combout\ : std_logic;
SIGNAL \G1|G2|Add1~1\ : std_logic;
SIGNAL \G1|G2|Add1~2_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[5]~5_combout\ : std_logic;
SIGNAL \G1|G2|Add1~3\ : std_logic;
SIGNAL \G1|G2|Add1~4_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[6]~6_combout\ : std_logic;
SIGNAL \G1|G2|Add1~5\ : std_logic;
SIGNAL \G1|G2|Add1~6_combout\ : std_logic;
SIGNAL \G1|G2|pixel_address[7]~7_combout\ : std_logic;
SIGNAL \G1|G2|Add2~4_combout\ : std_logic;
SIGNAL \G1|G2|Add2~6_combout\ : std_logic;
SIGNAL \G1|G2|Add1~7\ : std_logic;
SIGNAL \G1|G2|Add1~9\ : std_logic;
SIGNAL \G1|G2|Add1~10_combout\ : std_logic;
SIGNAL \G1|G2|Add2~5\ : std_logic;
SIGNAL \G1|G2|Add2~7_combout\ : std_logic;
SIGNAL \G1|G2|Add2~9_combout\ : std_logic;
SIGNAL \G1|G2|Add0~1\ : std_logic;
SIGNAL \G1|G2|Add0~2_combout\ : std_logic;
SIGNAL \G1|G2|Add2~8\ : std_logic;
SIGNAL \G1|G2|Add2~10_combout\ : std_logic;
SIGNAL \G1|G2|Add2~12_combout\ : std_logic;
SIGNAL \G1|G2|Add0~3\ : std_logic;
SIGNAL \G1|G2|Add0~4_combout\ : std_logic;
SIGNAL \G1|G2|Add2~11\ : std_logic;
SIGNAL \G1|G2|Add2~13_combout\ : std_logic;
SIGNAL \G1|G2|Add2~15_combout\ : std_logic;
SIGNAL \G1|G2|Add0~5\ : std_logic;
SIGNAL \G1|G2|Add0~6_combout\ : std_logic;
SIGNAL \G1|G2|Add2~14\ : std_logic;
SIGNAL \G1|G2|Add2~16_combout\ : std_logic;
SIGNAL \G1|G2|Add2~18_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a8~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G2|Add2~23_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[0]~feeder_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a0~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a16~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~2_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~3_combout\ : std_logic;
SIGNAL \G1|G2|Add1~11\ : std_logic;
SIGNAL \G1|G2|Add1~12_combout\ : std_logic;
SIGNAL \G1|G2|Add0~7\ : std_logic;
SIGNAL \G1|G2|Add0~9\ : std_logic;
SIGNAL \G1|G2|Add0~10_combout\ : std_logic;
SIGNAL \G1|G2|Add0~8_combout\ : std_logic;
SIGNAL \G1|G2|Add2~17\ : std_logic;
SIGNAL \G1|G2|Add2~20\ : std_logic;
SIGNAL \G1|G2|Add2~22\ : std_logic;
SIGNAL \G1|G2|Add2~24_combout\ : std_logic;
SIGNAL \G1|G2|Add2~27_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a48~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a32~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a40~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a56~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~1_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[0]~0_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a1~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a17~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~6_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a9~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~7_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a33~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a41~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~4_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a57~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a49~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~5_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[1]~1_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a58~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G2|Add2~21_combout\ : std_logic;
SIGNAL \G1|G2|Add2~26_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[1]~feeder_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a50~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~9_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a18~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a2~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~10_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a10~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~11_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[2]~2_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a51~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a59~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~13_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a11~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a27~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~15_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[3]~3_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a52~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a60~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~17_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a12~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a28~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~19_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[4]~4_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a61~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a53~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a45~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a37~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~20_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~21_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a21~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a5~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~22_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a29~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~23_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[5]~5_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a22~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a6~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~26_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a14~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~27_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a38~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a46~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~24_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a62~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a54~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~25_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[6]~6_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a63~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a47~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a39~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~28_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a55~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~29_combout\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a31~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|ram_block1a15~PORTBDATAOUT0\ : std_logic;
SIGNAL \G1|G0|altsyncram_component|auto_generated|mux5|_~31_combout\ : std_logic;
SIGNAL \G1|G2|vga_blue[7]~7_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SCLK_out~2_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SCLK_out~0_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SCLK_out~1_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux0~3_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux0~2_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|Mux0~5_combout\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|SCLK~q\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|I2C_SCLK~combout\ : std_logic;
SIGNAL \G0|lut_offset_normal\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \G0|lut_offset_inverse\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|q_b\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \G1|G1|altsyncram_component|auto_generated|q_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|address_reg_b\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G1|G2|vcount\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \G1|G2|hcount\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \G1|G3|pixel_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \G1|G3|pixel_address\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \G1|G3|cnt\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \G1|G3|G0|mI2C_DATA\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \G1|G3|G0|mI2C_CLK_DIV\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \G1|G3|G0|LUT_INDEX\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \G1|G3|G0|I2C_Controller_inst|SD\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ALT_INV_DIR~q\ : std_logic;
SIGNAL \G1|G3|G0|I2C_Controller_inst|ALT_INV_SDO~q\ : std_logic;
SIGNAL \G1|G3|G0|ALT_INV_LUT_INDEX\ : std_logic_vector(0 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
ww_SW <= SW;
VGA_CLK <= ww_VGA_CLK;
VGA_BLANK_N <= ww_VGA_BLANK_N;
VGA_SYNC_N <= ww_VGA_SYNC_N;
VGA_R <= ww_VGA_R;
VGA_G <= ww_VGA_G;
VGA_B <= ww_VGA_B;
ww_CMOS_DATA <= CMOS_DATA;
ww_CMOS_PIXCLK <= CMOS_PIXCLK;
ww_CMOS_LVAL <= CMOS_LVAL;
ww_CMOS_FVAL <= CMOS_FVAL;
CMOS_MCLK <= ww_CMOS_MCLK;
CMOS_SCLK <= ww_CMOS_SCLK;
LEDG <= ww_LEDG;
DRAM_ADDR <= ww_DRAM_ADDR;
DRAM_WE_N <= ww_DRAM_WE_N;
DRAM_CAS_N <= ww_DRAM_CAS_N;
DRAM_RAS_N <= ww_DRAM_RAS_N;
DRAM_CS_N <= ww_DRAM_CS_N;
DRAM_CLK <= ww_DRAM_CLK;
DRAM_UDQM <= ww_DRAM_UDQM;
DRAM_LDQM <= ww_DRAM_LDQM;
DRAM_BA <= ww_DRAM_BA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a48~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a48~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a40~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a40~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a32~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a32~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a56~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a56~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a8~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a8~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a16~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a16~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a0~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a0~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a24~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a24~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a49~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a49~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a41~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a41~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a33~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a33~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a57~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a57~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a9~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a9~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a17~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a17~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a1~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a1~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(1);

\G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a25~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a25~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a50~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a50~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a42~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a42~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a34~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a34~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a58~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a58~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a10~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a10~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a18~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a18~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a2~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a2~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(2);

\G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a26~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a26~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a51~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a51~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a43~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a43~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a35~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a35~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a59~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a59~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a11~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a11~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a19~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a19~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a3~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a3~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(3);

\G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a27~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a27~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a52~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a52~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a44~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a44~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a36~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a36~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a60~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a60~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a12~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a12~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a20~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a20~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a4~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a4~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(4);

\G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a28~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a28~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a53~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a53~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a45~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a45~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a37~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a37~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a61~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a61~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a13~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a13~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a21~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a21~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a5~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a5~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(5);

\G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a29~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a29~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a54~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a54~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a46~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a46~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a38~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a38~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a62~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a62~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a14~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a14~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a22~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a22~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a6~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a6~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(6);

\G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a30~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a30~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a55~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a55~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a47~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a47~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a39~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a39~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a63~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a63~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a15~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a15~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a23~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a23~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a7~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a7~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTADATAIN_bus\(0) <= \G1|G1|altsyncram_component|auto_generated|q_b\(7);

\G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBDATAIN_bus\(0) <= \~GND~combout\;

\G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\ <= (\G1|G3|pixel_address\(12) & \G1|G3|pixel_address\(11) & \G1|G3|pixel_address\(10) & \G1|G3|pixel_address\(9) & \G1|G3|pixel_address\(8) & \G1|G3|pixel_address\(7) & 
\G1|G3|pixel_address\(6) & \G1|G3|pixel_address\(5) & \G1|G3|pixel_address\(4) & \G1|G3|pixel_address\(3) & \G1|G3|pixel_address\(2) & \G1|G3|pixel_address\(1) & \G1|G3|pixel_address\(0));

\G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBADDR_bus\ <= (\G1|G2|Add2~18_combout\ & \G1|G2|Add2~15_combout\ & \G1|G2|Add2~12_combout\ & \G1|G2|Add2~9_combout\ & \G1|G2|Add2~6_combout\ & \G1|G2|pixel_address[7]~7_combout\ & 
\G1|G2|pixel_address[6]~6_combout\ & \G1|G2|pixel_address[5]~5_combout\ & \G1|G2|pixel_address[4]~4_combout\ & \G1|G2|pixel_address[3]~3_combout\ & \G1|G2|pixel_address[2]~2_combout\ & \G1|G2|pixel_address[1]~1_combout\ & 
\G1|G2|pixel_address[0]~0_combout\);

\G1|G0|altsyncram_component|auto_generated|ram_block1a31~portadataout\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\(0);

\G1|G0|altsyncram_component|auto_generated|ram_block1a31~PORTBDATAOUT0\ <= \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBDATAOUT_bus\(0);

\G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\G0|lut_offset_inverse\(10) & \G0|lut_offset_inverse\(9) & \G1|address_pixel_ram_lutinverse[8]~16_combout\ & \G1|address_pixel_ram_lutinverse[7]~14_combout\ & 
\G1|address_pixel_ram_lutinverse[6]~12_combout\ & \G1|address_pixel_ram_lutinverse[5]~10_combout\ & \G1|address_pixel_ram_lutinverse[4]~8_combout\ & \G1|address_pixel_ram_lutinverse[3]~6_combout\ & \G1|address_pixel_ram_lutinverse[2]~4_combout\ & 
\G1|address_pixel_ram_lutinverse[1]~2_combout\ & \G1|address_pixel_ram_lutinverse[0]~0_combout\);

\G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\G1|address_pixel_ram_lutnormal[10]~20_combout\ & \G1|address_pixel_ram_lutnormal[9]~18_combout\ & \G1|address_pixel_ram_lutnormal[8]~16_combout\ & 
\G1|address_pixel_ram_lutnormal[7]~14_combout\ & \G1|address_pixel_ram_lutnormal[6]~12_combout\ & \G1|address_pixel_ram_lutnormal[5]~10_combout\ & \G1|address_pixel_ram_lutnormal[4]~8_combout\ & \G1|address_pixel_ram_lutnormal[3]~6_combout\ & 
\G1|address_pixel_ram_lutnormal[2]~4_combout\ & \G1|address_pixel_ram_lutnormal[1]~2_combout\ & \G1|address_pixel_ram_lutnormal[0]~0_combout\);

\G1|G1|altsyncram_component|auto_generated|q_a\(0) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\G1|G1|altsyncram_component|auto_generated|q_a\(1) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\G1|G1|altsyncram_component|auto_generated|q_a\(2) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\G1|G1|altsyncram_component|auto_generated|q_a\(3) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);

\G1|G1|altsyncram_component|auto_generated|q_b\(0) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\G1|G1|altsyncram_component|auto_generated|q_b\(1) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\G1|G1|altsyncram_component|auto_generated|q_b\(2) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\G1|G1|altsyncram_component|auto_generated|q_b\(3) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);

\G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\G0|lut_offset_inverse\(10) & \G0|lut_offset_inverse\(9) & \G1|address_pixel_ram_lutinverse[8]~16_combout\ & \G1|address_pixel_ram_lutinverse[7]~14_combout\ & 
\G1|address_pixel_ram_lutinverse[6]~12_combout\ & \G1|address_pixel_ram_lutinverse[5]~10_combout\ & \G1|address_pixel_ram_lutinverse[4]~8_combout\ & \G1|address_pixel_ram_lutinverse[3]~6_combout\ & \G1|address_pixel_ram_lutinverse[2]~4_combout\ & 
\G1|address_pixel_ram_lutinverse[1]~2_combout\ & \G1|address_pixel_ram_lutinverse[0]~0_combout\);

\G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\G1|address_pixel_ram_lutnormal[10]~20_combout\ & \G1|address_pixel_ram_lutnormal[9]~18_combout\ & \G1|address_pixel_ram_lutnormal[8]~16_combout\ & 
\G1|address_pixel_ram_lutnormal[7]~14_combout\ & \G1|address_pixel_ram_lutnormal[6]~12_combout\ & \G1|address_pixel_ram_lutnormal[5]~10_combout\ & \G1|address_pixel_ram_lutnormal[4]~8_combout\ & \G1|address_pixel_ram_lutnormal[3]~6_combout\ & 
\G1|address_pixel_ram_lutnormal[2]~4_combout\ & \G1|address_pixel_ram_lutnormal[1]~2_combout\ & \G1|address_pixel_ram_lutnormal[0]~0_combout\);

\G1|G1|altsyncram_component|auto_generated|q_a\(4) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\G1|G1|altsyncram_component|auto_generated|q_a\(5) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);
\G1|G1|altsyncram_component|auto_generated|q_a\(6) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(2);
\G1|G1|altsyncram_component|auto_generated|q_a\(7) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(3);

\G1|G1|altsyncram_component|auto_generated|q_b\(4) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);
\G1|G1|altsyncram_component|auto_generated|q_b\(5) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(1);
\G1|G1|altsyncram_component|auto_generated|q_b\(6) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(2);
\G1|G1|altsyncram_component|auto_generated|q_b\(7) <= \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(3);

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\clock_25~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock_25~q\);
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;
\G1|G3|G0|I2C_Controller_inst|ALT_INV_DIR~q\ <= NOT \G1|G3|G0|I2C_Controller_inst|DIR~q\;
\G1|G3|G0|I2C_Controller_inst|ALT_INV_SDO~q\ <= NOT \G1|G3|G0|I2C_Controller_inst|SDO~q\;
\G1|G3|G0|ALT_INV_LUT_INDEX\(0) <= NOT \G1|G3|G0|LUT_INDEX\(0);

-- Location: M9K_X78_Y25_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a24\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a24_PORTBDATAOUT_bus\);

-- Location: M9K_X37_Y31_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a25\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a25_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y39_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a42\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a42_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y37_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a34\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a34_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y37_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a26\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a26_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y34_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a43\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a43_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y26_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a35\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a35_PORTBDATAOUT_bus\);

-- Location: M9K_X37_Y27_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a19\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a19_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y29_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a3\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y36_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a44\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a44_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y22_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a36\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a36_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y30_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a20\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a20_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y28_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

-- Location: M9K_X37_Y32_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a13\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a13_PORTBDATAOUT_bus\);

-- Location: M9K_X37_Y36_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a30\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a30_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y28_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a23\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a23_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y34_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a7\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y31_N0
\G1|G1|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"CCCCCBBBBBAAAA9999888877776666555544433332221111000FFFEEEDDDCCCBBBAAA999887776655544333221100FFFEEDDCCBBAA998876655443321100FEEDCCBAA9887655432210FEEDCBA99876543210FEDCBA987653210FECBA9765321FECBA875421FDCA975420FDB986421FDB986420FDB9864310EDBA876543211000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA51D951DA63FC9630DA7520DB8642FDB975310ECA875320FDCA9765321FEDCA987643210FEDCBA98765432100FEDCBAA9876654332100FEEDCBBA9987765544322100FFEDDCCBAA998876655443221100FFEDDCCBBAA9887766544332110FFEDDCBBA98765420",
	mem_init2 => X"DDDCCCBBBAAA999888776665554433322211000FFEEDDDCCBBAAA998877666554433221100FFEEDDCCBAA998877655443321100FEEDDCBBA998776554332110FFEDCCBAA9877654432100FEDCCBA988765432210FEDCCBA98765543210FEDCBBA98765432210FEDCBBA987655432110FEEDCBBA9987766554433222111000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9630DB8530DB8641FDA8641FDB97531FDCA86431FDCA875320FDCA9764310EDCA9765321FEDCA98754320FEDCB987654210FEDCA987654321FEDCBA987543210FDCBA98654310FDCB986531FDB850",
	mem_init1 => X"88777777666666555554444443333332222211111100000FFFFFFEEEEEDDDDDCCCCCBBBBBBAAAAA999998888877777666665555444443333322222111100000FFFFFEEEEDDDDDCCCCBBBBBAAAA999988888777766665555444433332222111110000FFFEEEEDDDDCCCCBBBBAAAA9999888777766665554444333322211110000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD71C60B50A50B50B61C83E950B72E951C840C84FB840C840D952EA730",
	mem_init0 => X"EDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA9876543210FEDCBA98765432100FEDDCCBBAA99887766554433221100FEEDDCCBBAA998776655443221100FEEDDCCBAA99887665543322100FEEDDCBBA9988766544322100FEEDCCBAA98876654332110FEEDCBBA9887655432210FEEDCBA998765443210FEDDCBA9876543210FEDCBA987654320FEDCB98764321FEDBA875421FECA97531FDB9742FDA73FB6F0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "all_luts.mif",
	init_file_layout => "port_a",
	logical_ram_name => "hdr_datapath:G1|ram_lut_doubleport:G1|altsyncram:altsyncram_component|altsyncram_40g2:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 11,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 4,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 2047,
	port_b_logical_ram_depth => 2048,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portbdatain => \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\,
	portaaddr => \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\,
	portbdataout => \G1|G1|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y33_N26
\G1|G2|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add1~8_combout\ = (\G1|G2|hcount\(8) & (\G1|G2|Add1~7\ $ (GND))) # (!\G1|G2|hcount\(8) & (!\G1|G2|Add1~7\ & VCC))
-- \G1|G2|Add1~9\ = CARRY((\G1|G2|hcount\(8) & !\G1|G2|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(8),
	datad => VCC,
	cin => \G1|G2|Add1~7\,
	combout => \G1|G2|Add1~8_combout\,
	cout => \G1|G2|Add1~9\);

-- Location: LCCOMB_X61_Y33_N8
\G1|G2|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add0~0_combout\ = \G1|G2|vcount\(1) $ (VCC)
-- \G1|G2|Add0~1\ = CARRY(\G1|G2|vcount\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(1),
	datad => VCC,
	combout => \G1|G2|Add0~0_combout\,
	cout => \G1|G2|Add0~1\);

-- Location: LCCOMB_X61_Y33_N18
\G1|G2|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add0~10_combout\ = (\G1|G2|vcount\(6) & (\G1|G2|Add0~9\ & VCC)) # (!\G1|G2|vcount\(6) & (!\G1|G2|Add0~9\))
-- \G1|G2|Add0~11\ = CARRY((!\G1|G2|vcount\(6) & !\G1|G2|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(6),
	datad => VCC,
	cin => \G1|G2|Add0~9\,
	combout => \G1|G2|Add0~10_combout\,
	cout => \G1|G2|Add0~11\);

-- Location: LCCOMB_X60_Y33_N10
\G1|G2|Add2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~19_combout\ = (\G1|G2|Add1~12_combout\ & ((\G1|G2|Add0~8_combout\ & (!\G1|G2|Add2~17\)) # (!\G1|G2|Add0~8_combout\ & ((\G1|G2|Add2~17\) # (GND))))) # (!\G1|G2|Add1~12_combout\ & ((\G1|G2|Add0~8_combout\ & (\G1|G2|Add2~17\ & VCC)) # 
-- (!\G1|G2|Add0~8_combout\ & (!\G1|G2|Add2~17\))))
-- \G1|G2|Add2~20\ = CARRY((\G1|G2|Add1~12_combout\ & ((!\G1|G2|Add2~17\) # (!\G1|G2|Add0~8_combout\))) # (!\G1|G2|Add1~12_combout\ & (!\G1|G2|Add0~8_combout\ & !\G1|G2|Add2~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add1~12_combout\,
	datab => \G1|G2|Add0~8_combout\,
	datad => VCC,
	cin => \G1|G2|Add2~17\,
	combout => \G1|G2|Add2~19_combout\,
	cout => \G1|G2|Add2~20\);

-- Location: LCCOMB_X61_Y33_N20
\G1|G2|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add0~12_combout\ = \G1|G2|vcount\(7) $ (!\G1|G2|Add0~11\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(7),
	cin => \G1|G2|Add0~11\,
	combout => \G1|G2|Add0~12_combout\);

-- Location: LCCOMB_X58_Y32_N10
\G1|G3|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~10_combout\ = (\G1|G3|cnt\(5) & (!\G1|G3|Add0~9\)) # (!\G1|G3|cnt\(5) & ((\G1|G3|Add0~9\) # (GND)))
-- \G1|G3|Add0~11\ = CARRY((!\G1|G3|Add0~9\) # (!\G1|G3|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(5),
	datad => VCC,
	cin => \G1|G3|Add0~9\,
	combout => \G1|G3|Add0~10_combout\,
	cout => \G1|G3|Add0~11\);

-- Location: LCCOMB_X58_Y32_N12
\G1|G3|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~12_combout\ = (\G1|G3|cnt\(6) & (\G1|G3|Add0~11\ $ (GND))) # (!\G1|G3|cnt\(6) & (!\G1|G3|Add0~11\ & VCC))
-- \G1|G3|Add0~13\ = CARRY((\G1|G3|cnt\(6) & !\G1|G3|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(6),
	datad => VCC,
	cin => \G1|G3|Add0~11\,
	combout => \G1|G3|Add0~12_combout\,
	cout => \G1|G3|Add0~13\);

-- Location: LCCOMB_X58_Y32_N24
\G1|G3|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~24_combout\ = (\G1|G3|cnt\(12) & (\G1|G3|Add0~23\ $ (GND))) # (!\G1|G3|cnt\(12) & (!\G1|G3|Add0~23\ & VCC))
-- \G1|G3|Add0~25\ = CARRY((\G1|G3|cnt\(12) & !\G1|G3|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(12),
	datad => VCC,
	cin => \G1|G3|Add0~23\,
	combout => \G1|G3|Add0~24_combout\,
	cout => \G1|G3|Add0~25\);

-- Location: LCCOMB_X58_Y32_N26
\G1|G3|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~26_combout\ = (\G1|G3|cnt\(13) & (!\G1|G3|Add0~25\)) # (!\G1|G3|cnt\(13) & ((\G1|G3|Add0~25\) # (GND)))
-- \G1|G3|Add0~27\ = CARRY((!\G1|G3|Add0~25\) # (!\G1|G3|cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(13),
	datad => VCC,
	cin => \G1|G3|Add0~25\,
	combout => \G1|G3|Add0~26_combout\,
	cout => \G1|G3|Add0~27\);

-- Location: LCCOMB_X58_Y32_N28
\G1|G3|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~28_combout\ = (\G1|G3|cnt\(14) & (\G1|G3|Add0~27\ $ (GND))) # (!\G1|G3|cnt\(14) & (!\G1|G3|Add0~27\ & VCC))
-- \G1|G3|Add0~29\ = CARRY((\G1|G3|cnt\(14) & !\G1|G3|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(14),
	datad => VCC,
	cin => \G1|G3|Add0~27\,
	combout => \G1|G3|Add0~28_combout\,
	cout => \G1|G3|Add0~29\);

-- Location: LCCOMB_X58_Y32_N30
\G1|G3|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~30_combout\ = \G1|G3|cnt\(15) $ (\G1|G3|Add0~29\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(15),
	cin => \G1|G3|Add0~29\,
	combout => \G1|G3|Add0~30_combout\);

-- Location: FF_X90_Y40_N29
\G1|G3|G0|mI2C_DATA[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux3~0_combout\,
	sclr => \G1|G3|G0|LUT_INDEX\(0),
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(9));

-- Location: FF_X92_Y40_N31
\G1|G3|G0|mI2C_DATA[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux8~0_combout\,
	sclr => \G1|G3|G0|ALT_INV_LUT_INDEX\(0),
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(4));

-- Location: FF_X90_Y40_N23
\G1|G3|G0|mI2C_DATA[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux2~0_combout\,
	sclr => \G1|G3|G0|LUT_INDEX\(0),
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(10));

-- Location: FF_X92_Y40_N15
\G1|G3|G0|mI2C_DATA[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux7~0_combout\,
	sclr => \G1|G3|G0|ALT_INV_LUT_INDEX\(0),
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(5));

-- Location: LCCOMB_X59_Y35_N12
\G1|G0|altsyncram_component|auto_generated|mux5|_~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~8_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1)) # 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a42~PORTBDATAOUT0\)))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a34~PORTBDATAOUT0\ & 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a34~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a42~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~8_combout\);

-- Location: LCCOMB_X56_Y31_N0
\G1|G0|altsyncram_component|auto_generated|mux5|_~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~12_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a43~PORTBDATAOUT0\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a35~PORTBDATAOUT0\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a43~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a35~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~12_combout\);

-- Location: LCCOMB_X52_Y31_N12
\G1|G0|altsyncram_component|auto_generated|mux5|_~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~14_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a19~PORTBDATAOUT0\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a3~PORTBDATAOUT0\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|ram_block1a19~PORTBDATAOUT0\,
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a3~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~14_combout\);

-- Location: LCCOMB_X52_Y32_N8
\G1|G0|altsyncram_component|auto_generated|mux5|_~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~16_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a44~PORTBDATAOUT0\) # 
-- (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a36~PORTBDATAOUT0\ & 
-- ((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|ram_block1a36~PORTBDATAOUT0\,
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a44~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~16_combout\);

-- Location: LCCOMB_X60_Y31_N22
\G1|G0|altsyncram_component|auto_generated|mux5|_~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~18_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)) # 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a20~PORTBDATAOUT0\)))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a4~PORTBDATAOUT0\ & 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a4~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a20~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~18_combout\);

-- Location: LCCOMB_X60_Y31_N12
\G1|G0|altsyncram_component|auto_generated|mux5|_~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~30_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)) # 
-- ((\G1|G0|altsyncram_component|auto_generated|ram_block1a23~PORTBDATAOUT0\)))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a7~PORTBDATAOUT0\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a7~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a23~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~30_combout\);

-- Location: FF_X60_Y32_N5
\G1|G3|pixel_address[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(14));

-- Location: FF_X60_Y32_N7
\G1|G3|pixel_address[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(15));

-- Location: FF_X60_Y32_N25
\G1|G3|pixel_address[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(13));

-- Location: LCCOMB_X60_Y32_N10
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\ = (\G1|G3|pixel_address\(15) & (!\G1|G3|pixel_address\(13) & \G1|G3|pixel_address\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_address\(15),
	datab => \G1|G3|pixel_address\(13),
	datac => \G1|G3|pixel_address\(14),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\);

-- Location: LCCOMB_X60_Y32_N8
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\ = (\G1|G3|pixel_address\(13) & (!\G1|G3|pixel_address\(14) & \G1|G3|pixel_address\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|pixel_address\(13),
	datac => \G1|G3|pixel_address\(14),
	datad => \G1|G3|pixel_address\(15),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\);

-- Location: LCCOMB_X60_Y32_N22
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\ = (\G1|G3|pixel_address\(15) & (!\G1|G3|pixel_address\(14) & !\G1|G3|pixel_address\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_address\(15),
	datac => \G1|G3|pixel_address\(14),
	datad => \G1|G3|pixel_address\(13),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\);

-- Location: LCCOMB_X60_Y32_N20
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\ = (\G1|G3|pixel_address\(15) & (\G1|G3|pixel_address\(14) & \G1|G3|pixel_address\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_address\(15),
	datab => \G1|G3|pixel_address\(14),
	datad => \G1|G3|pixel_address\(13),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\);

-- Location: LCCOMB_X60_Y32_N26
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\ = (!\G1|G3|pixel_address\(15) & (!\G1|G3|pixel_address\(14) & \G1|G3|pixel_address\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_address\(15),
	datac => \G1|G3|pixel_address\(14),
	datad => \G1|G3|pixel_address\(13),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\);

-- Location: LCCOMB_X60_Y32_N16
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\ = (!\G1|G3|pixel_address\(13) & (\G1|G3|pixel_address\(14) & !\G1|G3|pixel_address\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|pixel_address\(13),
	datac => \G1|G3|pixel_address\(14),
	datad => \G1|G3|pixel_address\(15),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\);

-- Location: LCCOMB_X60_Y32_N30
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3) = (!\G1|G3|pixel_address\(15) & (!\G1|G3|pixel_address\(14) & !\G1|G3|pixel_address\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_address\(15),
	datab => \G1|G3|pixel_address\(14),
	datad => \G1|G3|pixel_address\(13),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3));

-- Location: LCCOMB_X60_Y32_N28
\G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\ = (!\G1|G3|pixel_address\(15) & (\G1|G3|pixel_address\(14) & \G1|G3|pixel_address\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_address\(15),
	datac => \G1|G3|pixel_address\(14),
	datad => \G1|G3|pixel_address\(13),
	combout => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\);

-- Location: LCCOMB_X92_Y39_N6
\G1|G3|G0|I2C_Controller_inst|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux0~4_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & ((\G1|G3|G0|I2C_Controller_inst|SCLK~q\) # ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & \G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\)))) # 
-- (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & ((\G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\ & (\G1|G3|G0|I2C_Controller_inst|SCLK~q\)) # (!\G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\ & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datab => \G1|G3|G0|I2C_Controller_inst|SCLK~q\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datad => \G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux0~4_combout\);

-- Location: FF_X58_Y32_N29
\G1|G3|cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~28_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(14));

-- Location: LCCOMB_X60_Y32_N4
\G1|G3|pixel_address~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~0_combout\ = (\CMOS_LVAL~input_o\ & (\G1|G3|cnt\(14) & \CMOS_FVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMOS_LVAL~input_o\,
	datac => \G1|G3|cnt\(14),
	datad => \CMOS_FVAL~input_o\,
	combout => \G1|G3|pixel_address~0_combout\);

-- Location: FF_X58_Y32_N31
\G1|G3|cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~30_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(15));

-- Location: LCCOMB_X60_Y32_N6
\G1|G3|pixel_address~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~1_combout\ = (\CMOS_FVAL~input_o\ & (\CMOS_LVAL~input_o\ & \G1|G3|cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CMOS_FVAL~input_o\,
	datac => \CMOS_LVAL~input_o\,
	datad => \G1|G3|cnt\(15),
	combout => \G1|G3|pixel_address~1_combout\);

-- Location: FF_X58_Y32_N27
\G1|G3|cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~26_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(13));

-- Location: LCCOMB_X60_Y32_N24
\G1|G3|pixel_address~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~2_combout\ = (\CMOS_FVAL~input_o\ & (\CMOS_LVAL~input_o\ & \G1|G3|cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CMOS_FVAL~input_o\,
	datac => \CMOS_LVAL~input_o\,
	datad => \G1|G3|cnt\(13),
	combout => \G1|G3|pixel_address~2_combout\);

-- Location: FF_X63_Y31_N11
\G1|G3|pixel_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[4]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(2));

-- Location: FF_X63_Y31_N13
\G1|G3|pixel_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[5]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(3));

-- Location: FF_X63_Y32_N23
\G0|lut_offset_normal[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G0|lut_offset_normal\(9));

-- Location: FF_X58_Y32_N11
\G1|G3|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~10_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(5));

-- Location: FF_X58_Y32_N13
\G1|G3|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~12_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(6));

-- Location: FF_X88_Y39_N23
\G1|G3|G0|I2C_Controller_inst|ACK2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|ACK2~3_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \G1|G3|G0|I2C_Controller_inst|ACK1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|ACK2~q\);

-- Location: LCCOMB_X88_Y39_N16
\G1|G3|G0|I2C_Controller_inst|ACK2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK2~0_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)) # (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	combout => \G1|G3|G0|I2C_Controller_inst|ACK2~0_combout\);

-- Location: LCCOMB_X88_Y39_N18
\G1|G3|G0|I2C_Controller_inst|ACK2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK2~1_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4)))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & 
-- (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & !\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	combout => \G1|G3|G0|I2C_Controller_inst|ACK2~1_combout\);

-- Location: LCCOMB_X88_Y39_N28
\G1|G3|G0|I2C_Controller_inst|ACK2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK2~2_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & ((\G1|G3|G0|I2C_Controller_inst|ACK2~1_combout\ & ((!\CMOS_SDAT~input_o\))) # (!\G1|G3|G0|I2C_Controller_inst|ACK2~1_combout\ & 
-- (\G1|G3|G0|I2C_Controller_inst|ACK2~q\)))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & (\G1|G3|G0|I2C_Controller_inst|ACK2~q\ & ((\G1|G3|G0|I2C_Controller_inst|ACK2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|ACK2~q\,
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datac => \CMOS_SDAT~input_o\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK2~1_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|ACK2~2_combout\);

-- Location: LCCOMB_X88_Y39_N22
\G1|G3|G0|I2C_Controller_inst|ACK2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK2~3_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) & ((\G1|G3|G0|I2C_Controller_inst|ACK2~0_combout\ & (\G1|G3|G0|I2C_Controller_inst|ACK2~q\)) # (!\G1|G3|G0|I2C_Controller_inst|ACK2~0_combout\ & 
-- ((\G1|G3|G0|I2C_Controller_inst|ACK2~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datab => \G1|G3|G0|I2C_Controller_inst|ACK2~0_combout\,
	datac => \G1|G3|G0|I2C_Controller_inst|ACK2~q\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK2~2_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|ACK2~3_combout\);

-- Location: FF_X91_Y39_N3
\G1|G3|G0|I2C_Controller_inst|SD[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(2),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(2));

-- Location: FF_X91_Y39_N1
\G1|G3|G0|I2C_Controller_inst|SD[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD[8]~feeder_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(8));

-- Location: FF_X91_Y39_N19
\G1|G3|G0|I2C_Controller_inst|SD[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(9),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(9));

-- Location: LCCOMB_X91_Y39_N18
\G1|G3|G0|I2C_Controller_inst|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~0_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & ((\G1|G3|G0|I2C_Controller_inst|SD\(8)) # ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & 
-- (((\G1|G3|G0|I2C_Controller_inst|SD\(9) & !\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD\(8),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|SD\(9),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~0_combout\);

-- Location: FF_X91_Y39_N21
\G1|G3|G0|I2C_Controller_inst|SD[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(1),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(1));

-- Location: LCCOMB_X91_Y39_N2
\G1|G3|G0|I2C_Controller_inst|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~1_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & ((\G1|G3|G0|I2C_Controller_inst|Mux1~0_combout\ & (\G1|G3|G0|I2C_Controller_inst|SD\(1))) # (!\G1|G3|G0|I2C_Controller_inst|Mux1~0_combout\ & 
-- ((\G1|G3|G0|I2C_Controller_inst|SD\(2)))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & (((\G1|G3|G0|I2C_Controller_inst|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD\(1),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datac => \G1|G3|G0|I2C_Controller_inst|SD\(2),
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~0_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~1_combout\);

-- Location: FF_X91_Y39_N9
\G1|G3|G0|I2C_Controller_inst|SD[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD[0]~feeder_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(0));

-- Location: FF_X91_Y39_N13
\G1|G3|G0|I2C_Controller_inst|SD[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(4),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(4));

-- Location: FF_X91_Y39_N27
\G1|G3|G0|I2C_Controller_inst|SD[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD[10]~feeder_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(10));

-- Location: FF_X91_Y39_N7
\G1|G3|G0|I2C_Controller_inst|SD[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD[5]~feeder_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(5));

-- Location: FF_X91_Y39_N31
\G1|G3|G0|I2C_Controller_inst|SD[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(12),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(12));

-- Location: FF_X91_Y39_N25
\G1|G3|G0|I2C_Controller_inst|SD[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(13),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(13));

-- Location: LCCOMB_X91_Y39_N30
\G1|G3|G0|I2C_Controller_inst|Mux1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~12_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & (\G1|G3|G0|I2C_Controller_inst|SD\(12))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & 
-- ((\G1|G3|G0|I2C_Controller_inst|SD\(13)))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & (((\G1|G3|G0|I2C_Controller_inst|SD\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|SD\(12),
	datad => \G1|G3|G0|I2C_Controller_inst|SD\(13),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~12_combout\);

-- Location: LCCOMB_X89_Y39_N12
\G1|G3|G0|I2C_Controller_inst|DIR~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|DIR~5_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & (((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) $ 
-- (((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	combout => \G1|G3|G0|I2C_Controller_inst|DIR~5_combout\);

-- Location: LCCOMB_X89_Y39_N10
\G1|G3|G0|I2C_Controller_inst|DIR~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|DIR~6_combout\ = \G1|G3|G0|I2C_Controller_inst|DIR~5_combout\ $ (((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datad => \G1|G3|G0|I2C_Controller_inst|DIR~5_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|DIR~6_combout\);

-- Location: FF_X91_Y40_N1
\G1|G3|G0|mI2C_DATA[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux10~1_combout\,
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(2));

-- Location: FF_X91_Y40_N3
\G1|G3|G0|mI2C_DATA[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux4~1_combout\,
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(8));

-- Location: FF_X91_Y40_N21
\G1|G3|G0|mI2C_DATA[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux11~1_combout\,
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(1));

-- Location: FF_X91_Y40_N27
\G1|G3|G0|mI2C_DATA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux12~1_combout\,
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(0));

-- Location: FF_X91_Y40_N15
\G1|G3|G0|mI2C_DATA[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mI2C_DATA[12]~feeder_combout\,
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(12));

-- Location: FF_X91_Y40_N5
\G1|G3|G0|mI2C_DATA[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux0~1_combout\,
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(13));

-- Location: LCCOMB_X90_Y40_N20
\G1|G3|G0|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux10~0_combout\ = (\G1|G3|G0|LUT_INDEX\(0) & ((\G1|G3|G0|LUT_INDEX\(1) & ((\G1|G3|G0|LUT_INDEX\(2)))) # (!\G1|G3|G0|LUT_INDEX\(1) & (\G1|G3|G0|LUT_INDEX\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(0),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux10~0_combout\);

-- Location: LCCOMB_X91_Y40_N0
\G1|G3|G0|Mux10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux10~1_combout\ = (!\G1|G3|G0|LUT_INDEX\(4) & \G1|G3|G0|Mux10~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|LUT_INDEX\(4),
	datad => \G1|G3|G0|Mux10~0_combout\,
	combout => \G1|G3|G0|Mux10~1_combout\);

-- Location: LCCOMB_X91_Y40_N6
\G1|G3|G0|mI2C_DATA[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_DATA[12]~0_combout\ = (\KEY[0]~input_o\ & !\G1|G3|G0|mI2C_CLK_DIV\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \KEY[0]~input_o\,
	datad => \G1|G3|G0|mI2C_CLK_DIV\(2),
	combout => \G1|G3|G0|mI2C_DATA[12]~0_combout\);

-- Location: LCCOMB_X90_Y40_N30
\G1|G3|G0|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux4~0_combout\ = (\G1|G3|G0|LUT_INDEX\(3) & (!\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX\(4)))) # (!\G1|G3|G0|LUT_INDEX\(3) & (\G1|G3|G0|LUT_INDEX\(1) $ (((\G1|G3|G0|LUT_INDEX\(4)) # (\G1|G3|G0|LUT_INDEX\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(4),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux4~0_combout\);

-- Location: LCCOMB_X91_Y40_N2
\G1|G3|G0|Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux4~1_combout\ = (\G1|G3|G0|LUT_INDEX\(0)) # (\G1|G3|G0|Mux4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|LUT_INDEX\(0),
	datad => \G1|G3|G0|Mux4~0_combout\,
	combout => \G1|G3|G0|Mux4~1_combout\);

-- Location: LCCOMB_X90_Y40_N28
\G1|G3|G0|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux3~0_combout\ = (\G1|G3|G0|LUT_INDEX\(1) & ((\G1|G3|G0|LUT_INDEX\(3) & (!\G1|G3|G0|LUT_INDEX\(4))) # (!\G1|G3|G0|LUT_INDEX\(3) & (\G1|G3|G0|LUT_INDEX\(4) & \G1|G3|G0|LUT_INDEX\(2))))) # (!\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX\(3) & 
-- (\G1|G3|G0|LUT_INDEX\(4) $ (\G1|G3|G0|LUT_INDEX\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(4),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux3~0_combout\);

-- Location: LCCOMB_X90_Y40_N24
\G1|G3|G0|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux11~0_combout\ = (\G1|G3|G0|LUT_INDEX\(3) & (!\G1|G3|G0|LUT_INDEX\(4) & (\G1|G3|G0|LUT_INDEX\(1) $ (!\G1|G3|G0|LUT_INDEX\(2))))) # (!\G1|G3|G0|LUT_INDEX\(3) & (\G1|G3|G0|LUT_INDEX\(1) & (\G1|G3|G0|LUT_INDEX\(4) $ (\G1|G3|G0|LUT_INDEX\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(4),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(1),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux11~0_combout\);

-- Location: LCCOMB_X91_Y40_N20
\G1|G3|G0|Mux11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux11~1_combout\ = (\G1|G3|G0|Mux11~0_combout\ & (\G1|G3|G0|LUT_INDEX\(0) $ (\G1|G3|G0|LUT_INDEX\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|LUT_INDEX\(0),
	datac => \G1|G3|G0|LUT_INDEX\(4),
	datad => \G1|G3|G0|Mux11~0_combout\,
	combout => \G1|G3|G0|Mux11~1_combout\);

-- Location: LCCOMB_X92_Y40_N30
\G1|G3|G0|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux8~0_combout\ = (\G1|G3|G0|LUT_INDEX\(1) & ((\G1|G3|G0|LUT_INDEX\(4) & (!\G1|G3|G0|LUT_INDEX\(3) & \G1|G3|G0|LUT_INDEX\(2))) # (!\G1|G3|G0|LUT_INDEX\(4) & (\G1|G3|G0|LUT_INDEX\(3))))) # (!\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX\(4) & 
-- ((\G1|G3|G0|LUT_INDEX\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(4),
	datac => \G1|G3|G0|LUT_INDEX\(3),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux8~0_combout\);

-- Location: LCCOMB_X90_Y40_N22
\G1|G3|G0|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux2~0_combout\ = (\G1|G3|G0|LUT_INDEX\(3) & (((!\G1|G3|G0|LUT_INDEX\(4) & !\G1|G3|G0|LUT_INDEX\(2))))) # (!\G1|G3|G0|LUT_INDEX\(3) & ((\G1|G3|G0|LUT_INDEX\(1) & ((\G1|G3|G0|LUT_INDEX\(4)) # (\G1|G3|G0|LUT_INDEX\(2)))) # 
-- (!\G1|G3|G0|LUT_INDEX\(1) & (\G1|G3|G0|LUT_INDEX\(4) & \G1|G3|G0|LUT_INDEX\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(4),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux2~0_combout\);

-- Location: LCCOMB_X92_Y40_N14
\G1|G3|G0|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux7~0_combout\ = (\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX\(4) & (\G1|G3|G0|LUT_INDEX\(3) & !\G1|G3|G0|LUT_INDEX\(2)))) # (!\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX\(3) & (\G1|G3|G0|LUT_INDEX\(4) $ (\G1|G3|G0|LUT_INDEX\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(4),
	datac => \G1|G3|G0|LUT_INDEX\(3),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux7~0_combout\);

-- Location: LCCOMB_X90_Y40_N8
\G1|G3|G0|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux0~0_combout\ = (\G1|G3|G0|LUT_INDEX\(4)) # ((\G1|G3|G0|LUT_INDEX\(3) & ((\G1|G3|G0|LUT_INDEX\(2)))) # (!\G1|G3|G0|LUT_INDEX\(3) & (\G1|G3|G0|LUT_INDEX\(1) & !\G1|G3|G0|LUT_INDEX\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(4),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(1),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux0~0_combout\);

-- Location: LCCOMB_X91_Y40_N4
\G1|G3|G0|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux0~1_combout\ = (\G1|G3|G0|LUT_INDEX\(0)) # (!\G1|G3|G0|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|LUT_INDEX\(0),
	datad => \G1|G3|G0|Mux0~0_combout\,
	combout => \G1|G3|G0|Mux0~1_combout\);

-- Location: LCCOMB_X90_Y40_N10
\G1|G3|G0|Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux12~0_combout\ = (\G1|G3|G0|LUT_INDEX\(4) & (!\G1|G3|G0|LUT_INDEX\(3) & (\G1|G3|G0|LUT_INDEX\(0) $ (!\G1|G3|G0|LUT_INDEX\(2))))) # (!\G1|G3|G0|LUT_INDEX\(4) & (\G1|G3|G0|LUT_INDEX\(0) $ (((\G1|G3|G0|LUT_INDEX\(3) & \G1|G3|G0|LUT_INDEX\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(4),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(0),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux12~0_combout\);

-- Location: LCCOMB_X91_Y40_N26
\G1|G3|G0|Mux12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux12~1_combout\ = (\G1|G3|G0|Mux12~0_combout\ & ((\G1|G3|G0|LUT_INDEX\(1) & (\G1|G3|G0|LUT_INDEX\(2))) # (!\G1|G3|G0|LUT_INDEX\(1) & ((\G1|G3|G0|LUT_INDEX\(3)) # (!\G1|G3|G0|LUT_INDEX\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(2),
	datac => \G1|G3|G0|LUT_INDEX\(3),
	datad => \G1|G3|G0|Mux12~0_combout\,
	combout => \G1|G3|G0|Mux12~1_combout\);

-- Location: IOIBUF_X102_Y0_N22
\CMOS_DATA[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(4),
	o => \CMOS_DATA[4]~input_o\);

-- Location: IOIBUF_X96_Y0_N15
\CMOS_DATA[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(5),
	o => \CMOS_DATA[5]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X91_Y40_N14
\G1|G3|G0|mI2C_DATA[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_DATA[12]~feeder_combout\ = \G1|G3|G0|LUT_INDEX\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|LUT_INDEX\(0),
	combout => \G1|G3|G0|mI2C_DATA[12]~feeder_combout\);

-- Location: LCCOMB_X91_Y39_N26
\G1|G3|G0|I2C_Controller_inst|SD[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD[10]~feeder_combout\ = \G1|G3|G0|mI2C_DATA\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \G1|G3|G0|mI2C_DATA\(10),
	combout => \G1|G3|G0|I2C_Controller_inst|SD[10]~feeder_combout\);

-- Location: LCCOMB_X91_Y39_N6
\G1|G3|G0|I2C_Controller_inst|SD[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD[5]~feeder_combout\ = \G1|G3|G0|mI2C_DATA\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \G1|G3|G0|mI2C_DATA\(5),
	combout => \G1|G3|G0|I2C_Controller_inst|SD[5]~feeder_combout\);

-- Location: LCCOMB_X91_Y39_N0
\G1|G3|G0|I2C_Controller_inst|SD[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD[8]~feeder_combout\ = \G1|G3|G0|mI2C_DATA\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \G1|G3|G0|mI2C_DATA\(8),
	combout => \G1|G3|G0|I2C_Controller_inst|SD[8]~feeder_combout\);

-- Location: LCCOMB_X91_Y39_N8
\G1|G3|G0|I2C_Controller_inst|SD[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD[0]~feeder_combout\ = \G1|G3|G0|mI2C_DATA\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \G1|G3|G0|mI2C_DATA\(0),
	combout => \G1|G3|G0|I2C_Controller_inst|SD[0]~feeder_combout\);

-- Location: IOOBUF_X0_Y13_N2
\DRAM_DQ[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[0]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\DRAM_DQ[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[1]~output_o\);

-- Location: IOOBUF_X0_Y29_N16
\DRAM_DQ[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[2]~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\DRAM_DQ[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[3]~output_o\);

-- Location: IOOBUF_X0_Y29_N23
\DRAM_DQ[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[4]~output_o\);

-- Location: IOOBUF_X0_Y28_N16
\DRAM_DQ[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[5]~output_o\);

-- Location: IOOBUF_X0_Y28_N23
\DRAM_DQ[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[6]~output_o\);

-- Location: IOOBUF_X0_Y34_N9
\DRAM_DQ[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[7]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\DRAM_DQ[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[8]~output_o\);

-- Location: IOOBUF_X0_Y24_N9
\DRAM_DQ[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[9]~output_o\);

-- Location: IOOBUF_X0_Y27_N23
\DRAM_DQ[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[10]~output_o\);

-- Location: IOOBUF_X0_Y19_N9
\DRAM_DQ[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[11]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\DRAM_DQ[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[12]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\DRAM_DQ[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[13]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\DRAM_DQ[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[14]~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\DRAM_DQ[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \DRAM_DQ[15]~output_o\);

-- Location: IOOBUF_X38_Y73_N16
\VGA_HS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_hsync~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \VGA_HS~output_o\);

-- Location: IOOBUF_X54_Y73_N2
\VGA_VS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_vsync~reg0_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \VGA_VS~output_o\);

-- Location: IOOBUF_X85_Y0_N2
\CMOS_SDAT~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G3|G0|I2C_Controller_inst|ALT_INV_SDO~q\,
	oe => \G1|G3|G0|I2C_Controller_inst|ALT_INV_DIR~q\,
	devoe => ww_devoe,
	o => \CMOS_SDAT~output_o\);

-- Location: IOOBUF_X47_Y73_N2
\VGA_CLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clock_25~q\,
	devoe => ww_devoe,
	o => \VGA_CLK~output_o\);

-- Location: IOOBUF_X31_Y73_N9
\VGA_BLANK_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_nblank~combout\,
	devoe => ww_devoe,
	o => \VGA_BLANK_N~output_o\);

-- Location: IOOBUF_X35_Y73_N16
\VGA_SYNC_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \VGA_SYNC_N~output_o\);

-- Location: IOOBUF_X33_Y73_N2
\VGA_R[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[0]~0_combout\,
	devoe => ww_devoe,
	o => \VGA_R[0]~output_o\);

-- Location: IOOBUF_X31_Y73_N2
\VGA_R[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[1]~1_combout\,
	devoe => ww_devoe,
	o => \VGA_R[1]~output_o\);

-- Location: IOOBUF_X35_Y73_N23
\VGA_R[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[2]~2_combout\,
	devoe => ww_devoe,
	o => \VGA_R[2]~output_o\);

-- Location: IOOBUF_X33_Y73_N9
\VGA_R[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[3]~3_combout\,
	devoe => ww_devoe,
	o => \VGA_R[3]~output_o\);

-- Location: IOOBUF_X20_Y73_N9
\VGA_R[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[4]~4_combout\,
	devoe => ww_devoe,
	o => \VGA_R[4]~output_o\);

-- Location: IOOBUF_X40_Y73_N9
\VGA_R[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[5]~5_combout\,
	devoe => ww_devoe,
	o => \VGA_R[5]~output_o\);

-- Location: IOOBUF_X11_Y73_N23
\VGA_R[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[6]~6_combout\,
	devoe => ww_devoe,
	o => \VGA_R[6]~output_o\);

-- Location: IOOBUF_X20_Y73_N16
\VGA_R[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[7]~7_combout\,
	devoe => ww_devoe,
	o => \VGA_R[7]~output_o\);

-- Location: IOOBUF_X11_Y73_N16
\VGA_G[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[0]~0_combout\,
	devoe => ww_devoe,
	o => \VGA_G[0]~output_o\);

-- Location: IOOBUF_X25_Y73_N16
\VGA_G[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[1]~1_combout\,
	devoe => ww_devoe,
	o => \VGA_G[1]~output_o\);

-- Location: IOOBUF_X11_Y73_N9
\VGA_G[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[2]~2_combout\,
	devoe => ww_devoe,
	o => \VGA_G[2]~output_o\);

-- Location: IOOBUF_X25_Y73_N23
\VGA_G[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[3]~3_combout\,
	devoe => ww_devoe,
	o => \VGA_G[3]~output_o\);

-- Location: IOOBUF_X16_Y73_N9
\VGA_G[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[4]~4_combout\,
	devoe => ww_devoe,
	o => \VGA_G[4]~output_o\);

-- Location: IOOBUF_X16_Y73_N2
\VGA_G[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[5]~5_combout\,
	devoe => ww_devoe,
	o => \VGA_G[5]~output_o\);

-- Location: IOOBUF_X20_Y73_N2
\VGA_G[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[6]~6_combout\,
	devoe => ww_devoe,
	o => \VGA_G[6]~output_o\);

-- Location: IOOBUF_X23_Y73_N16
\VGA_G[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[7]~7_combout\,
	devoe => ww_devoe,
	o => \VGA_G[7]~output_o\);

-- Location: IOOBUF_X38_Y73_N9
\VGA_B[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[0]~0_combout\,
	devoe => ww_devoe,
	o => \VGA_B[0]~output_o\);

-- Location: IOOBUF_X38_Y73_N2
\VGA_B[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[1]~1_combout\,
	devoe => ww_devoe,
	o => \VGA_B[1]~output_o\);

-- Location: IOOBUF_X23_Y73_N2
\VGA_B[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[2]~2_combout\,
	devoe => ww_devoe,
	o => \VGA_B[2]~output_o\);

-- Location: IOOBUF_X42_Y73_N9
\VGA_B[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[3]~3_combout\,
	devoe => ww_devoe,
	o => \VGA_B[3]~output_o\);

-- Location: IOOBUF_X42_Y73_N2
\VGA_B[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[4]~4_combout\,
	devoe => ww_devoe,
	o => \VGA_B[4]~output_o\);

-- Location: IOOBUF_X52_Y73_N16
\VGA_B[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[5]~5_combout\,
	devoe => ww_devoe,
	o => \VGA_B[5]~output_o\);

-- Location: IOOBUF_X23_Y73_N9
\VGA_B[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[6]~6_combout\,
	devoe => ww_devoe,
	o => \VGA_B[6]~output_o\);

-- Location: IOOBUF_X52_Y73_N23
\VGA_B[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G2|vga_blue[7]~7_combout\,
	devoe => ww_devoe,
	o => \VGA_B[7]~output_o\);

-- Location: IOOBUF_X65_Y0_N16
\CMOS_MCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clock_25~q\,
	devoe => ww_devoe,
	o => \CMOS_MCLK~output_o\);

-- Location: IOOBUF_X83_Y0_N9
\CMOS_SCLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|G3|G0|I2C_Controller_inst|I2C_SCLK~combout\,
	devoe => ww_devoe,
	o => \CMOS_SCLK~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\LEDG[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\LEDG[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\LEDG[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[6]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\LEDG[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOOBUF_X0_Y34_N2
\DRAM_ADDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[0]~output_o\);

-- Location: IOOBUF_X0_Y15_N23
\DRAM_ADDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\DRAM_ADDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[2]~output_o\);

-- Location: IOOBUF_X0_Y42_N2
\DRAM_ADDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[3]~output_o\);

-- Location: IOOBUF_X0_Y15_N16
\DRAM_ADDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[4]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\DRAM_ADDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[5]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\DRAM_ADDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[6]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\DRAM_ADDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[7]~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\DRAM_ADDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[8]~output_o\);

-- Location: IOOBUF_X0_Y13_N9
\DRAM_ADDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[9]~output_o\);

-- Location: IOOBUF_X0_Y32_N23
\DRAM_ADDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[10]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\DRAM_ADDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[11]~output_o\);

-- Location: IOOBUF_X0_Y11_N23
\DRAM_ADDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_ADDR[12]~output_o\);

-- Location: IOOBUF_X0_Y16_N23
\DRAM_WE_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_WE_N~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\DRAM_CAS_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_CAS_N~output_o\);

-- Location: IOOBUF_X0_Y25_N23
\DRAM_RAS_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_RAS_N~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\DRAM_CS_N~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_CS_N~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\DRAM_CLK~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_CLK~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\DRAM_UDQM[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_UDQM[0]~output_o\);

-- Location: IOOBUF_X87_Y73_N2
\DRAM_UDQM[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_UDQM[1]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\DRAM_LDQM[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_LDQM[0]~output_o\);

-- Location: IOOBUF_X85_Y73_N9
\DRAM_LDQM[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_LDQM[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\DRAM_BA[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_BA[0]~output_o\);

-- Location: IOOBUF_X0_Y33_N16
\DRAM_BA[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DRAM_BA[1]~output_o\);

-- Location: LCCOMB_X56_Y72_N0
\clock_25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_25~0_combout\ = !\clock_25~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clock_25~q\,
	combout => \clock_25~0_combout\);

-- Location: LCCOMB_X56_Y72_N18
\clock_25~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \clock_25~feeder_combout\ = \clock_25~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clock_25~0_combout\,
	combout => \clock_25~feeder_combout\);

-- Location: FF_X56_Y72_N19
clock_25 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \clock_25~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clock_25~q\);

-- Location: CLKCTRL_G10
\clock_25~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock_25~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock_25~clkctrl_outclk\);

-- Location: LCCOMB_X63_Y33_N2
\G1|G2|hcount[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[0]~10_combout\ = \G1|G2|hcount\(0) $ (VCC)
-- \G1|G2|hcount[0]~11\ = CARRY(\G1|G2|hcount\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(0),
	datad => VCC,
	combout => \G1|G2|hcount[0]~10_combout\,
	cout => \G1|G2|hcount[0]~11\);

-- Location: LCCOMB_X63_Y33_N16
\G1|G2|hcount[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[7]~24_combout\ = (\G1|G2|hcount\(7) & (!\G1|G2|hcount[6]~23\)) # (!\G1|G2|hcount\(7) & ((\G1|G2|hcount[6]~23\) # (GND)))
-- \G1|G2|hcount[7]~25\ = CARRY((!\G1|G2|hcount[6]~23\) # (!\G1|G2|hcount\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(7),
	datad => VCC,
	cin => \G1|G2|hcount[6]~23\,
	combout => \G1|G2|hcount[7]~24_combout\,
	cout => \G1|G2|hcount[7]~25\);

-- Location: LCCOMB_X63_Y33_N18
\G1|G2|hcount[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[8]~26_combout\ = (\G1|G2|hcount\(8) & (\G1|G2|hcount[7]~25\ $ (GND))) # (!\G1|G2|hcount\(8) & (!\G1|G2|hcount[7]~25\ & VCC))
-- \G1|G2|hcount[8]~27\ = CARRY((\G1|G2|hcount\(8) & !\G1|G2|hcount[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(8),
	datad => VCC,
	cin => \G1|G2|hcount[7]~25\,
	combout => \G1|G2|hcount[8]~26_combout\,
	cout => \G1|G2|hcount[8]~27\);

-- Location: FF_X60_Y33_N31
\G1|G2|hcount[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|hcount[8]~26_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(8));

-- Location: LCCOMB_X61_Y33_N6
\G1|G2|LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan4~0_combout\ = ((!\G1|G2|hcount\(6) & (!\G1|G2|hcount\(5) & !\G1|G2|hcount\(7)))) # (!\G1|G2|hcount\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(6),
	datab => \G1|G2|hcount\(5),
	datac => \G1|G2|hcount\(8),
	datad => \G1|G2|hcount\(7),
	combout => \G1|G2|LessThan4~0_combout\);

-- Location: LCCOMB_X61_Y33_N30
\G1|G2|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan4~1_combout\ = (\G1|G2|hcount\(9) & !\G1|G2|LessThan4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(9),
	datad => \G1|G2|LessThan4~0_combout\,
	combout => \G1|G2|LessThan4~1_combout\);

-- Location: FF_X63_Y33_N3
\G1|G2|hcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|hcount[0]~10_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(0));

-- Location: LCCOMB_X63_Y33_N4
\G1|G2|hcount[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[1]~12_combout\ = (\G1|G2|hcount\(1) & (!\G1|G2|hcount[0]~11\)) # (!\G1|G2|hcount\(1) & ((\G1|G2|hcount[0]~11\) # (GND)))
-- \G1|G2|hcount[1]~13\ = CARRY((!\G1|G2|hcount[0]~11\) # (!\G1|G2|hcount\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(1),
	datad => VCC,
	cin => \G1|G2|hcount[0]~11\,
	combout => \G1|G2|hcount[1]~12_combout\,
	cout => \G1|G2|hcount[1]~13\);

-- Location: FF_X63_Y33_N5
\G1|G2|hcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|hcount[1]~12_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(1));

-- Location: LCCOMB_X63_Y33_N6
\G1|G2|hcount[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[2]~14_combout\ = (\G1|G2|hcount\(2) & (\G1|G2|hcount[1]~13\ $ (GND))) # (!\G1|G2|hcount\(2) & (!\G1|G2|hcount[1]~13\ & VCC))
-- \G1|G2|hcount[2]~15\ = CARRY((\G1|G2|hcount\(2) & !\G1|G2|hcount[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(2),
	datad => VCC,
	cin => \G1|G2|hcount[1]~13\,
	combout => \G1|G2|hcount[2]~14_combout\,
	cout => \G1|G2|hcount[2]~15\);

-- Location: LCCOMB_X63_Y33_N8
\G1|G2|hcount[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[3]~16_combout\ = (\G1|G2|hcount\(3) & (!\G1|G2|hcount[2]~15\)) # (!\G1|G2|hcount\(3) & ((\G1|G2|hcount[2]~15\) # (GND)))
-- \G1|G2|hcount[3]~17\ = CARRY((!\G1|G2|hcount[2]~15\) # (!\G1|G2|hcount\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(3),
	datad => VCC,
	cin => \G1|G2|hcount[2]~15\,
	combout => \G1|G2|hcount[3]~16_combout\,
	cout => \G1|G2|hcount[3]~17\);

-- Location: FF_X63_Y33_N9
\G1|G2|hcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|hcount[3]~16_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(3));

-- Location: LCCOMB_X63_Y33_N10
\G1|G2|hcount[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[4]~18_combout\ = (\G1|G2|hcount\(4) & (\G1|G2|hcount[3]~17\ $ (GND))) # (!\G1|G2|hcount\(4) & (!\G1|G2|hcount[3]~17\ & VCC))
-- \G1|G2|hcount[4]~19\ = CARRY((\G1|G2|hcount\(4) & !\G1|G2|hcount[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(4),
	datad => VCC,
	cin => \G1|G2|hcount[3]~17\,
	combout => \G1|G2|hcount[4]~18_combout\,
	cout => \G1|G2|hcount[4]~19\);

-- Location: FF_X60_Y33_N1
\G1|G2|hcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|hcount[4]~18_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(4));

-- Location: LCCOMB_X63_Y33_N12
\G1|G2|hcount[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[5]~20_combout\ = (\G1|G2|hcount\(5) & (!\G1|G2|hcount[4]~19\)) # (!\G1|G2|hcount\(5) & ((\G1|G2|hcount[4]~19\) # (GND)))
-- \G1|G2|hcount[5]~21\ = CARRY((!\G1|G2|hcount[4]~19\) # (!\G1|G2|hcount\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(5),
	datad => VCC,
	cin => \G1|G2|hcount[4]~19\,
	combout => \G1|G2|hcount[5]~20_combout\,
	cout => \G1|G2|hcount[5]~21\);

-- Location: FF_X60_Y33_N15
\G1|G2|hcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|hcount[5]~20_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(5));

-- Location: LCCOMB_X63_Y33_N14
\G1|G2|hcount[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[6]~22_combout\ = (\G1|G2|hcount\(6) & (\G1|G2|hcount[5]~21\ $ (GND))) # (!\G1|G2|hcount\(6) & (!\G1|G2|hcount[5]~21\ & VCC))
-- \G1|G2|hcount[6]~23\ = CARRY((\G1|G2|hcount\(6) & !\G1|G2|hcount[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(6),
	datad => VCC,
	cin => \G1|G2|hcount[5]~21\,
	combout => \G1|G2|hcount[6]~22_combout\,
	cout => \G1|G2|hcount[6]~23\);

-- Location: FF_X60_Y33_N21
\G1|G2|hcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|hcount[7]~24_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(7));

-- Location: LCCOMB_X63_Y33_N20
\G1|G2|hcount[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|hcount[9]~28_combout\ = \G1|G2|hcount[8]~27\ $ (\G1|G2|hcount\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \G1|G2|hcount\(9),
	cin => \G1|G2|hcount[8]~27\,
	combout => \G1|G2|hcount[9]~28_combout\);

-- Location: FF_X60_Y33_N23
\G1|G2|hcount[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|hcount[9]~28_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(9));

-- Location: LCCOMB_X61_Y33_N24
\G1|G2|LessThan5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan5~0_combout\ = (!\G1|G2|hcount\(9) & (!\G1|G2|hcount\(8) & ((!\G1|G2|hcount\(5)) # (!\G1|G2|hcount\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(6),
	datab => \G1|G2|hcount\(5),
	datac => \G1|G2|hcount\(9),
	datad => \G1|G2|hcount\(8),
	combout => \G1|G2|LessThan5~0_combout\);

-- Location: LCCOMB_X61_Y33_N2
\G1|G2|LessThan5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan5~1_combout\ = (\G1|G2|hcount\(7)) # (!\G1|G2|LessThan5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(7),
	datad => \G1|G2|LessThan5~0_combout\,
	combout => \G1|G2|LessThan5~1_combout\);

-- Location: FF_X61_Y33_N3
\G1|G2|vga_hsync~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|LessThan5~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vga_hsync~reg0_q\);

-- Location: LCCOMB_X62_Y33_N6
\G1|G2|vcount[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[0]~10_combout\ = \G1|G2|vcount\(0) $ (VCC)
-- \G1|G2|vcount[0]~11\ = CARRY(\G1|G2|vcount\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(0),
	datad => VCC,
	combout => \G1|G2|vcount[0]~10_combout\,
	cout => \G1|G2|vcount[0]~11\);

-- Location: LCCOMB_X62_Y33_N14
\G1|G2|vcount[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[4]~18_combout\ = (\G1|G2|vcount\(4) & (\G1|G2|vcount[3]~17\ $ (GND))) # (!\G1|G2|vcount\(4) & (!\G1|G2|vcount[3]~17\ & VCC))
-- \G1|G2|vcount[4]~19\ = CARRY((\G1|G2|vcount\(4) & !\G1|G2|vcount[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(4),
	datad => VCC,
	cin => \G1|G2|vcount[3]~17\,
	combout => \G1|G2|vcount[4]~18_combout\,
	cout => \G1|G2|vcount[4]~19\);

-- Location: LCCOMB_X62_Y33_N16
\G1|G2|vcount[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[5]~20_combout\ = (\G1|G2|vcount\(5) & (!\G1|G2|vcount[4]~19\)) # (!\G1|G2|vcount\(5) & ((\G1|G2|vcount[4]~19\) # (GND)))
-- \G1|G2|vcount[5]~21\ = CARRY((!\G1|G2|vcount[4]~19\) # (!\G1|G2|vcount\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(5),
	datad => VCC,
	cin => \G1|G2|vcount[4]~19\,
	combout => \G1|G2|vcount[5]~20_combout\,
	cout => \G1|G2|vcount[5]~21\);

-- Location: LCCOMB_X63_Y33_N26
\G1|G2|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Equal0~1_combout\ = (!\G1|G2|hcount\(0) & (!\G1|G2|hcount\(9) & (!\G1|G2|hcount\(3) & !\G1|G2|hcount\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(0),
	datab => \G1|G2|hcount\(9),
	datac => \G1|G2|hcount\(3),
	datad => \G1|G2|hcount\(8),
	combout => \G1|G2|Equal0~1_combout\);

-- Location: LCCOMB_X63_Y33_N0
\G1|G2|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Equal0~0_combout\ = (!\G1|G2|hcount\(6) & (!\G1|G2|hcount\(4) & (!\G1|G2|hcount\(7) & !\G1|G2|hcount\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(6),
	datab => \G1|G2|hcount\(4),
	datac => \G1|G2|hcount\(7),
	datad => \G1|G2|hcount\(5),
	combout => \G1|G2|Equal0~0_combout\);

-- Location: LCCOMB_X63_Y33_N28
\G1|G2|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Equal0~2_combout\ = (!\G1|G2|hcount\(2) & (!\G1|G2|hcount\(1) & (\G1|G2|Equal0~1_combout\ & \G1|G2|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(2),
	datab => \G1|G2|hcount\(1),
	datac => \G1|G2|Equal0~1_combout\,
	datad => \G1|G2|Equal0~0_combout\,
	combout => \G1|G2|Equal0~2_combout\);

-- Location: FF_X62_Y33_N17
\G1|G2|vcount[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|vcount[5]~20_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(5));

-- Location: LCCOMB_X62_Y33_N18
\G1|G2|vcount[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[6]~22_combout\ = (\G1|G2|vcount\(6) & (\G1|G2|vcount[5]~21\ $ (GND))) # (!\G1|G2|vcount\(6) & (!\G1|G2|vcount[5]~21\ & VCC))
-- \G1|G2|vcount[6]~23\ = CARRY((\G1|G2|vcount\(6) & !\G1|G2|vcount[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(6),
	datad => VCC,
	cin => \G1|G2|vcount[5]~21\,
	combout => \G1|G2|vcount[6]~22_combout\,
	cout => \G1|G2|vcount[6]~23\);

-- Location: FF_X62_Y33_N19
\G1|G2|vcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|vcount[6]~22_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(6));

-- Location: LCCOMB_X62_Y33_N20
\G1|G2|vcount[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[7]~24_combout\ = (\G1|G2|vcount\(7) & (!\G1|G2|vcount[6]~23\)) # (!\G1|G2|vcount\(7) & ((\G1|G2|vcount[6]~23\) # (GND)))
-- \G1|G2|vcount[7]~25\ = CARRY((!\G1|G2|vcount[6]~23\) # (!\G1|G2|vcount\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(7),
	datad => VCC,
	cin => \G1|G2|vcount[6]~23\,
	combout => \G1|G2|vcount[7]~24_combout\,
	cout => \G1|G2|vcount[7]~25\);

-- Location: FF_X62_Y33_N21
\G1|G2|vcount[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|vcount[7]~24_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(7));

-- Location: LCCOMB_X62_Y33_N22
\G1|G2|vcount[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[8]~26_combout\ = (\G1|G2|vcount\(8) & (\G1|G2|vcount[7]~25\ $ (GND))) # (!\G1|G2|vcount\(8) & (!\G1|G2|vcount[7]~25\ & VCC))
-- \G1|G2|vcount[8]~27\ = CARRY((\G1|G2|vcount\(8) & !\G1|G2|vcount[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datad => VCC,
	cin => \G1|G2|vcount[7]~25\,
	combout => \G1|G2|vcount[8]~26_combout\,
	cout => \G1|G2|vcount[8]~27\);

-- Location: LCCOMB_X62_Y33_N24
\G1|G2|vcount[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[9]~28_combout\ = \G1|G2|vcount[8]~27\ $ (\G1|G2|vcount\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \G1|G2|vcount\(9),
	cin => \G1|G2|vcount[8]~27\,
	combout => \G1|G2|vcount[9]~28_combout\);

-- Location: FF_X62_Y33_N25
\G1|G2|vcount[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|vcount[9]~28_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(9));

-- Location: LCCOMB_X62_Y33_N4
\G1|G2|LessThan6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan6~1_combout\ = (((!\G1|G2|vcount\(1) & !\G1|G2|vcount\(0))) # (!\G1|G2|vcount\(2))) # (!\G1|G2|vcount\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(3),
	datab => \G1|G2|vcount\(2),
	datac => \G1|G2|vcount\(1),
	datad => \G1|G2|vcount\(0),
	combout => \G1|G2|LessThan6~1_combout\);

-- Location: LCCOMB_X62_Y33_N30
\G1|G2|LessThan6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan6~2_combout\ = (\G1|G2|vcount\(9) & ((!\G1|G2|LessThan6~0_combout\) # (!\G1|G2|LessThan6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(9),
	datac => \G1|G2|LessThan6~1_combout\,
	datad => \G1|G2|LessThan6~0_combout\,
	combout => \G1|G2|LessThan6~2_combout\);

-- Location: FF_X61_Y33_N21
\G1|G2|vcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|vcount[0]~10_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	sload => VCC,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(0));

-- Location: LCCOMB_X62_Y33_N8
\G1|G2|vcount[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[1]~12_combout\ = (\G1|G2|vcount\(1) & (!\G1|G2|vcount[0]~11\)) # (!\G1|G2|vcount\(1) & ((\G1|G2|vcount[0]~11\) # (GND)))
-- \G1|G2|vcount[1]~13\ = CARRY((!\G1|G2|vcount[0]~11\) # (!\G1|G2|vcount\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(1),
	datad => VCC,
	cin => \G1|G2|vcount[0]~11\,
	combout => \G1|G2|vcount[1]~12_combout\,
	cout => \G1|G2|vcount[1]~13\);

-- Location: FF_X61_Y33_N29
\G1|G2|vcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|vcount[1]~12_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	sload => VCC,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(1));

-- Location: LCCOMB_X62_Y33_N10
\G1|G2|vcount[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[2]~14_combout\ = (\G1|G2|vcount\(2) & (\G1|G2|vcount[1]~13\ $ (GND))) # (!\G1|G2|vcount\(2) & (!\G1|G2|vcount[1]~13\ & VCC))
-- \G1|G2|vcount[2]~15\ = CARRY((\G1|G2|vcount\(2) & !\G1|G2|vcount[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(2),
	datad => VCC,
	cin => \G1|G2|vcount[1]~13\,
	combout => \G1|G2|vcount[2]~14_combout\,
	cout => \G1|G2|vcount[2]~15\);

-- Location: FF_X61_Y33_N31
\G1|G2|vcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|vcount[2]~14_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	sload => VCC,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(2));

-- Location: LCCOMB_X62_Y33_N12
\G1|G2|vcount[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vcount[3]~16_combout\ = (\G1|G2|vcount\(3) & (!\G1|G2|vcount[2]~15\)) # (!\G1|G2|vcount\(3) & ((\G1|G2|vcount[2]~15\) # (GND)))
-- \G1|G2|vcount[3]~17\ = CARRY((!\G1|G2|vcount[2]~15\) # (!\G1|G2|vcount\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(3),
	datad => VCC,
	cin => \G1|G2|vcount[2]~15\,
	combout => \G1|G2|vcount[3]~16_combout\,
	cout => \G1|G2|vcount[3]~17\);

-- Location: FF_X61_Y33_N23
\G1|G2|vcount[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|vcount[4]~18_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	sload => VCC,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(4));

-- Location: FF_X62_Y33_N23
\G1|G2|vcount[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|vcount[8]~26_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(8));

-- Location: LCCOMB_X62_Y33_N2
\G1|G2|LessThan6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan6~0_combout\ = (\G1|G2|LessThan2~0_combout\ & (!\G1|G2|vcount\(4) & (!\G1|G2|vcount\(8) & !\G1|G2|vcount\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|LessThan2~0_combout\,
	datab => \G1|G2|vcount\(4),
	datac => \G1|G2|vcount\(8),
	datad => \G1|G2|vcount\(7),
	combout => \G1|G2|LessThan6~0_combout\);

-- Location: LCCOMB_X62_Y33_N0
\G1|G2|LessThan7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan7~1_combout\ = (\G1|G2|vcount\(3)) # ((\G1|G2|vcount\(1)) # ((\G1|G2|vcount\(9)) # (\G1|G2|vcount\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(3),
	datab => \G1|G2|vcount\(1),
	datac => \G1|G2|vcount\(9),
	datad => \G1|G2|vcount\(2),
	combout => \G1|G2|LessThan7~1_combout\);

-- Location: LCCOMB_X62_Y33_N28
\G1|G2|vga_vsync~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_vsync~0_combout\ = (\G1|G2|Equal0~2_combout\ & (((\G1|G2|LessThan7~1_combout\)) # (!\G1|G2|LessThan6~0_combout\))) # (!\G1|G2|Equal0~2_combout\ & (((\G1|G2|vga_vsync~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Equal0~2_combout\,
	datab => \G1|G2|LessThan6~0_combout\,
	datac => \G1|G2|vga_vsync~reg0_q\,
	datad => \G1|G2|LessThan7~1_combout\,
	combout => \G1|G2|vga_vsync~0_combout\);

-- Location: FF_X62_Y33_N29
\G1|G2|vga_vsync~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|vga_vsync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vga_vsync~reg0_q\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X92_Y39_N12
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~6_combout\ = \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) $ (VCC)
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~7\ = CARRY(\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datad => VCC,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~6_combout\,
	cout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~7\);

-- Location: LCCOMB_X92_Y39_N14
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~12_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~7\)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & 
-- ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~7\) # (GND)))
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~13\ = CARRY((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~7\) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datad => VCC,
	cin => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~7\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~12_combout\,
	cout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~13\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X92_Y39_N2
\KEY[0]~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \KEY[0]~_wirecell_combout\ = !\KEY[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KEY[0]~input_o\,
	combout => \KEY[0]~_wirecell_combout\);

-- Location: LCCOMB_X92_Y39_N4
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9_combout\);

-- Location: LCCOMB_X92_Y39_N20
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~18_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~17\ $ (GND))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & 
-- (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~17\ & VCC))
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~19\ = CARRY((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & !\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datad => VCC,
	cin => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~17\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~18_combout\,
	cout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~19\);

-- Location: LCCOMB_X92_Y39_N22
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[5]~20_combout\ = \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) $ (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	cin => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~19\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[5]~20_combout\);

-- Location: FF_X92_Y39_N23
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[5]~20_combout\,
	asdata => \KEY[0]~_wirecell_combout\,
	sload => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5));

-- Location: LCCOMB_X92_Y39_N30
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~10_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) & \G1|G3|G0|mI2C_GO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datad => \G1|G3|G0|mI2C_GO~q\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~10_combout\);

-- Location: LCCOMB_X90_Y39_N22
\G1|G3|G0|mI2C_CLK_DIV[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_CLK_DIV[0]~5_combout\ = \G1|G3|G0|mI2C_CLK_DIV\(0) $ (VCC)
-- \G1|G3|G0|mI2C_CLK_DIV[0]~6\ = CARRY(\G1|G3|G0|mI2C_CLK_DIV\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|mI2C_CLK_DIV\(0),
	datad => VCC,
	combout => \G1|G3|G0|mI2C_CLK_DIV[0]~5_combout\,
	cout => \G1|G3|G0|mI2C_CLK_DIV[0]~6\);

-- Location: LCCOMB_X90_Y39_N26
\G1|G3|G0|mI2C_CLK_DIV[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_CLK_DIV[2]~9_combout\ = (\G1|G3|G0|mI2C_CLK_DIV\(2) & (\G1|G3|G0|mI2C_CLK_DIV[1]~8\ $ (GND))) # (!\G1|G3|G0|mI2C_CLK_DIV\(2) & (!\G1|G3|G0|mI2C_CLK_DIV[1]~8\ & VCC))
-- \G1|G3|G0|mI2C_CLK_DIV[2]~10\ = CARRY((\G1|G3|G0|mI2C_CLK_DIV\(2) & !\G1|G3|G0|mI2C_CLK_DIV[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mI2C_CLK_DIV\(2),
	datad => VCC,
	cin => \G1|G3|G0|mI2C_CLK_DIV[1]~8\,
	combout => \G1|G3|G0|mI2C_CLK_DIV[2]~9_combout\,
	cout => \G1|G3|G0|mI2C_CLK_DIV[2]~10\);

-- Location: LCCOMB_X90_Y39_N28
\G1|G3|G0|mI2C_CLK_DIV[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_CLK_DIV[3]~11_combout\ = (\G1|G3|G0|mI2C_CLK_DIV\(3) & (!\G1|G3|G0|mI2C_CLK_DIV[2]~10\)) # (!\G1|G3|G0|mI2C_CLK_DIV\(3) & ((\G1|G3|G0|mI2C_CLK_DIV[2]~10\) # (GND)))
-- \G1|G3|G0|mI2C_CLK_DIV[3]~12\ = CARRY((!\G1|G3|G0|mI2C_CLK_DIV[2]~10\) # (!\G1|G3|G0|mI2C_CLK_DIV\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mI2C_CLK_DIV\(3),
	datad => VCC,
	cin => \G1|G3|G0|mI2C_CLK_DIV[2]~10\,
	combout => \G1|G3|G0|mI2C_CLK_DIV[3]~11_combout\,
	cout => \G1|G3|G0|mI2C_CLK_DIV[3]~12\);

-- Location: LCCOMB_X90_Y39_N30
\G1|G3|G0|mI2C_CLK_DIV[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_CLK_DIV[4]~14_combout\ = \G1|G3|G0|mI2C_CLK_DIV[3]~12\ $ (!\G1|G3|G0|mI2C_CLK_DIV\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \G1|G3|G0|mI2C_CLK_DIV\(4),
	cin => \G1|G3|G0|mI2C_CLK_DIV[3]~12\,
	combout => \G1|G3|G0|mI2C_CLK_DIV[4]~14_combout\);

-- Location: FF_X90_Y39_N31
\G1|G3|G0|mI2C_CLK_DIV[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mI2C_CLK_DIV[4]~14_combout\,
	sclr => \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_CLK_DIV\(4));

-- Location: LCCOMB_X90_Y39_N14
\G1|G3|G0|mI2C_CLK_DIV[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\ = (\G1|G3|G0|mI2C_CLK_DIV\(4)) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datad => \G1|G3|G0|mI2C_CLK_DIV\(4),
	combout => \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\);

-- Location: FF_X90_Y39_N23
\G1|G3|G0|mI2C_CLK_DIV[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mI2C_CLK_DIV[0]~5_combout\,
	sclr => \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_CLK_DIV\(0));

-- Location: LCCOMB_X90_Y39_N24
\G1|G3|G0|mI2C_CLK_DIV[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_CLK_DIV[1]~7_combout\ = (\G1|G3|G0|mI2C_CLK_DIV\(1) & (!\G1|G3|G0|mI2C_CLK_DIV[0]~6\)) # (!\G1|G3|G0|mI2C_CLK_DIV\(1) & ((\G1|G3|G0|mI2C_CLK_DIV[0]~6\) # (GND)))
-- \G1|G3|G0|mI2C_CLK_DIV[1]~8\ = CARRY((!\G1|G3|G0|mI2C_CLK_DIV[0]~6\) # (!\G1|G3|G0|mI2C_CLK_DIV\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|mI2C_CLK_DIV\(1),
	datad => VCC,
	cin => \G1|G3|G0|mI2C_CLK_DIV[0]~6\,
	combout => \G1|G3|G0|mI2C_CLK_DIV[1]~7_combout\,
	cout => \G1|G3|G0|mI2C_CLK_DIV[1]~8\);

-- Location: FF_X90_Y39_N25
\G1|G3|G0|mI2C_CLK_DIV[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mI2C_CLK_DIV[1]~7_combout\,
	sclr => \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_CLK_DIV\(1));

-- Location: FF_X90_Y39_N27
\G1|G3|G0|mI2C_CLK_DIV[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mI2C_CLK_DIV[2]~9_combout\,
	sclr => \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_CLK_DIV\(2));

-- Location: FF_X90_Y39_N29
\G1|G3|G0|mI2C_CLK_DIV[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mI2C_CLK_DIV[3]~11_combout\,
	sclr => \G1|G3|G0|mI2C_CLK_DIV[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_CLK_DIV\(3));

-- Location: LCCOMB_X90_Y39_N18
\G1|G3|G0|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Equal0~0_combout\ = (!\G1|G3|G0|mI2C_CLK_DIV\(4) & (!\G1|G3|G0|mI2C_CLK_DIV\(1) & (!\G1|G3|G0|mI2C_CLK_DIV\(0) & \G1|G3|G0|mI2C_CLK_DIV\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mI2C_CLK_DIV\(4),
	datab => \G1|G3|G0|mI2C_CLK_DIV\(1),
	datac => \G1|G3|G0|mI2C_CLK_DIV\(0),
	datad => \G1|G3|G0|mI2C_CLK_DIV\(3),
	combout => \G1|G3|G0|Equal0~0_combout\);

-- Location: LCCOMB_X90_Y39_N20
\G1|G3|G0|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Equal0~1_combout\ = (!\G1|G3|G0|mI2C_CLK_DIV\(2) & \G1|G3|G0|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|mI2C_CLK_DIV\(2),
	datad => \G1|G3|G0|Equal0~0_combout\,
	combout => \G1|G3|G0|Equal0~1_combout\);

-- Location: LCCOMB_X92_Y39_N8
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\ = ((\G1|G3|G0|Equal0~1_combout\ & ((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~10_combout\) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9_combout\)))) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9_combout\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~10_combout\,
	datad => \G1|G3|G0|Equal0~1_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\);

-- Location: FF_X92_Y39_N13
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~6_combout\,
	asdata => \KEY[0]~_wirecell_combout\,
	sload => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0));

-- Location: LCCOMB_X92_Y39_N26
\G1|G3|G0|I2C_Controller_inst|SD[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & !\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	combout => \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\);

-- Location: LCCOMB_X90_Y39_N12
\G1|G3|G0|I2C_Controller_inst|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux5~0_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) & ((\G1|G3|G0|I2C_Controller_inst|FIN~q\) # ((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|FIN~q\,
	datad => \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux5~0_combout\);

-- Location: FF_X90_Y39_N13
\G1|G3|G0|I2C_Controller_inst|FIN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|Mux5~0_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \G1|G3|G0|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|FIN~q\);

-- Location: LCCOMB_X89_Y40_N18
\G1|G3|G0|LUT_INDEX[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|LUT_INDEX[0]~5_combout\ = \G1|G3|G0|LUT_INDEX\(0) $ (VCC)
-- \G1|G3|G0|LUT_INDEX[0]~6\ = CARRY(\G1|G3|G0|LUT_INDEX\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|LUT_INDEX\(0),
	datad => VCC,
	combout => \G1|G3|G0|LUT_INDEX[0]~5_combout\,
	cout => \G1|G3|G0|LUT_INDEX[0]~6\);

-- Location: LCCOMB_X89_Y40_N2
\G1|G3|G0|LUT_INDEX[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|LUT_INDEX[2]~13_combout\ = (\G1|G3|G0|mI2C_CLK_DIV\(2)) # (!\G1|G3|G0|mSetup_ST.st20_next_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|mI2C_CLK_DIV\(2),
	datad => \G1|G3|G0|mSetup_ST.st20_next_data~q\,
	combout => \G1|G3|G0|LUT_INDEX[2]~13_combout\);

-- Location: LCCOMB_X89_Y40_N16
\G1|G3|G0|LUT_INDEX[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|LUT_INDEX[2]~14_combout\ = ((\G1|G3|G0|mSetup_ST~10_combout\ & (\G1|G3|G0|Equal0~0_combout\ & !\G1|G3|G0|LUT_INDEX[2]~13_combout\))) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mSetup_ST~10_combout\,
	datab => \KEY[0]~input_o\,
	datac => \G1|G3|G0|Equal0~0_combout\,
	datad => \G1|G3|G0|LUT_INDEX[2]~13_combout\,
	combout => \G1|G3|G0|LUT_INDEX[2]~14_combout\);

-- Location: FF_X89_Y40_N19
\G1|G3|G0|LUT_INDEX[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|LUT_INDEX[0]~5_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \G1|G3|G0|LUT_INDEX[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|LUT_INDEX\(0));

-- Location: LCCOMB_X89_Y40_N20
\G1|G3|G0|LUT_INDEX[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|LUT_INDEX[1]~7_combout\ = (\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX[0]~6\)) # (!\G1|G3|G0|LUT_INDEX\(1) & ((\G1|G3|G0|LUT_INDEX[0]~6\) # (GND)))
-- \G1|G3|G0|LUT_INDEX[1]~8\ = CARRY((!\G1|G3|G0|LUT_INDEX[0]~6\) # (!\G1|G3|G0|LUT_INDEX\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|LUT_INDEX\(1),
	datad => VCC,
	cin => \G1|G3|G0|LUT_INDEX[0]~6\,
	combout => \G1|G3|G0|LUT_INDEX[1]~7_combout\,
	cout => \G1|G3|G0|LUT_INDEX[1]~8\);

-- Location: FF_X89_Y40_N21
\G1|G3|G0|LUT_INDEX[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|LUT_INDEX[1]~7_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \G1|G3|G0|LUT_INDEX[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|LUT_INDEX\(1));

-- Location: LCCOMB_X89_Y40_N22
\G1|G3|G0|LUT_INDEX[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|LUT_INDEX[2]~9_combout\ = (\G1|G3|G0|LUT_INDEX\(2) & (\G1|G3|G0|LUT_INDEX[1]~8\ $ (GND))) # (!\G1|G3|G0|LUT_INDEX\(2) & (!\G1|G3|G0|LUT_INDEX[1]~8\ & VCC))
-- \G1|G3|G0|LUT_INDEX[2]~10\ = CARRY((\G1|G3|G0|LUT_INDEX\(2) & !\G1|G3|G0|LUT_INDEX[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(2),
	datad => VCC,
	cin => \G1|G3|G0|LUT_INDEX[1]~8\,
	combout => \G1|G3|G0|LUT_INDEX[2]~9_combout\,
	cout => \G1|G3|G0|LUT_INDEX[2]~10\);

-- Location: LCCOMB_X89_Y40_N24
\G1|G3|G0|LUT_INDEX[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|LUT_INDEX[3]~11_combout\ = (\G1|G3|G0|LUT_INDEX\(3) & (!\G1|G3|G0|LUT_INDEX[2]~10\)) # (!\G1|G3|G0|LUT_INDEX\(3) & ((\G1|G3|G0|LUT_INDEX[2]~10\) # (GND)))
-- \G1|G3|G0|LUT_INDEX[3]~12\ = CARRY((!\G1|G3|G0|LUT_INDEX[2]~10\) # (!\G1|G3|G0|LUT_INDEX\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(3),
	datad => VCC,
	cin => \G1|G3|G0|LUT_INDEX[2]~10\,
	combout => \G1|G3|G0|LUT_INDEX[3]~11_combout\,
	cout => \G1|G3|G0|LUT_INDEX[3]~12\);

-- Location: LCCOMB_X89_Y40_N26
\G1|G3|G0|LUT_INDEX[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|LUT_INDEX[4]~15_combout\ = \G1|G3|G0|LUT_INDEX[3]~12\ $ (!\G1|G3|G0|LUT_INDEX\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \G1|G3|G0|LUT_INDEX\(4),
	cin => \G1|G3|G0|LUT_INDEX[3]~12\,
	combout => \G1|G3|G0|LUT_INDEX[4]~15_combout\);

-- Location: FF_X89_Y40_N27
\G1|G3|G0|LUT_INDEX[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|LUT_INDEX[4]~15_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \G1|G3|G0|LUT_INDEX[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|LUT_INDEX\(4));

-- Location: FF_X89_Y40_N25
\G1|G3|G0|LUT_INDEX[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|LUT_INDEX[3]~11_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \G1|G3|G0|LUT_INDEX[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|LUT_INDEX\(3));

-- Location: LCCOMB_X89_Y40_N8
\G1|G3|G0|mSetup_ST~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~10_combout\ = (!\G1|G3|G0|LUT_INDEX\(3)) # (!\G1|G3|G0|LUT_INDEX\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|LUT_INDEX\(4),
	datad => \G1|G3|G0|LUT_INDEX\(3),
	combout => \G1|G3|G0|mSetup_ST~10_combout\);

-- Location: LCCOMB_X91_Y40_N30
\G1|G3|G0|mSetup_ST~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~11_combout\ = (!\G1|G3|G0|mI2C_CLK_DIV\(2) & (!\G1|G3|G0|I2C_Controller_inst|FIN~q\ & (\G1|G3|G0|mSetup_ST~10_combout\ & \G1|G3|G0|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mI2C_CLK_DIV\(2),
	datab => \G1|G3|G0|I2C_Controller_inst|FIN~q\,
	datac => \G1|G3|G0|mSetup_ST~10_combout\,
	datad => \G1|G3|G0|Equal0~0_combout\,
	combout => \G1|G3|G0|mSetup_ST~11_combout\);

-- Location: LCCOMB_X88_Y39_N24
\G1|G3|G0|I2C_Controller_inst|ACK1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK1~0_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0)) # ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4)) # (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	combout => \G1|G3|G0|I2C_Controller_inst|ACK1~0_combout\);

-- Location: LCCOMB_X88_Y39_N6
\G1|G3|G0|I2C_Controller_inst|ACK1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK1~1_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & (!\CMOS_SDAT~input_o\)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & 
-- ((\G1|G3|G0|I2C_Controller_inst|ACK1~q\))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & (((\G1|G3|G0|I2C_Controller_inst|ACK1~q\ & \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMOS_SDAT~input_o\,
	datab => \G1|G3|G0|I2C_Controller_inst|ACK1~q\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	combout => \G1|G3|G0|I2C_Controller_inst|ACK1~1_combout\);

-- Location: LCCOMB_X88_Y39_N4
\G1|G3|G0|I2C_Controller_inst|ACK1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK1~2_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) & ((\G1|G3|G0|I2C_Controller_inst|ACK1~0_combout\ & (\G1|G3|G0|I2C_Controller_inst|ACK1~q\)) # (!\G1|G3|G0|I2C_Controller_inst|ACK1~0_combout\ & 
-- ((\G1|G3|G0|I2C_Controller_inst|ACK1~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datab => \G1|G3|G0|I2C_Controller_inst|ACK1~0_combout\,
	datac => \G1|G3|G0|I2C_Controller_inst|ACK1~q\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK1~1_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|ACK1~2_combout\);

-- Location: LCCOMB_X88_Y39_N20
\G1|G3|G0|I2C_Controller_inst|ACK1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK1~3_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	combout => \G1|G3|G0|I2C_Controller_inst|ACK1~3_combout\);

-- Location: LCCOMB_X88_Y39_N14
\G1|G3|G0|I2C_Controller_inst|ACK1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK1~4_combout\ = (\G1|G3|G0|Equal0~0_combout\ & (!\G1|G3|G0|mI2C_CLK_DIV\(2) & ((\G1|G3|G0|I2C_Controller_inst|ACK1~3_combout\) # (!\G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|Equal0~0_combout\,
	datab => \G1|G3|G0|mI2C_CLK_DIV\(2),
	datac => \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK1~3_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|ACK1~4_combout\);

-- Location: FF_X88_Y39_N5
\G1|G3|G0|I2C_Controller_inst|ACK1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|ACK1~2_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \G1|G3|G0|I2C_Controller_inst|ACK1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|ACK1~q\);

-- Location: IOIBUF_X85_Y0_N1
\CMOS_SDAT~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => CMOS_SDAT,
	o => \CMOS_SDAT~input_o\);

-- Location: LCCOMB_X88_Y39_N10
\G1|G3|G0|I2C_Controller_inst|ACK3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK3~0_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\ & (\G1|G3|G0|I2C_Controller_inst|ACK3~q\)) # (!\G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\ & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9_combout\ & 
-- (\G1|G3|G0|I2C_Controller_inst|ACK3~q\ $ (!\CMOS_SDAT~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|ACK3~q\,
	datab => \CMOS_SDAT~input_o\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~9_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|ACK3~0_combout\);

-- Location: LCCOMB_X88_Y39_N12
\G1|G3|G0|I2C_Controller_inst|ACK3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK3~1_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) & (\G1|G3|G0|I2C_Controller_inst|ACK3~q\ $ (((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & \G1|G3|G0|I2C_Controller_inst|ACK3~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|ACK3~q\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK3~0_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|ACK3~1_combout\);

-- Location: FF_X88_Y39_N13
\G1|G3|G0|I2C_Controller_inst|ACK3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|ACK3~1_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \G1|G3|G0|I2C_Controller_inst|ACK1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|ACK3~q\);

-- Location: LCCOMB_X88_Y39_N2
\G1|G3|G0|I2C_Controller_inst|ACK~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|ACK~0_combout\ = (\G1|G3|G0|I2C_Controller_inst|ACK2~q\ & (\G1|G3|G0|I2C_Controller_inst|ACK1~q\ & \G1|G3|G0|I2C_Controller_inst|ACK3~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|ACK2~q\,
	datac => \G1|G3|G0|I2C_Controller_inst|ACK1~q\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK3~q\,
	combout => \G1|G3|G0|I2C_Controller_inst|ACK~0_combout\);

-- Location: LCCOMB_X91_Y40_N18
\G1|G3|G0|mSetup_ST~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~13_combout\ = (\G1|G3|G0|mSetup_ST.st10_wait_ack~q\ & (\G1|G3|G0|mSetup_ST~11_combout\ & \G1|G3|G0|I2C_Controller_inst|ACK~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mSetup_ST.st10_wait_ack~q\,
	datac => \G1|G3|G0|mSetup_ST~11_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK~0_combout\,
	combout => \G1|G3|G0|mSetup_ST~13_combout\);

-- Location: LCCOMB_X91_Y40_N8
\G1|G3|G0|mSetup_ST~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~14_combout\ = (\G1|G3|G0|mSetup_ST~13_combout\) # ((!\G1|G3|G0|mSetup_ST~17_combout\ & \G1|G3|G0|mSetup_ST.st20_next_data~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mSetup_ST~17_combout\,
	datac => \G1|G3|G0|mSetup_ST.st20_next_data~q\,
	datad => \G1|G3|G0|mSetup_ST~13_combout\,
	combout => \G1|G3|G0|mSetup_ST~14_combout\);

-- Location: FF_X91_Y40_N9
\G1|G3|G0|mSetup_ST.st20_next_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mSetup_ST~14_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mSetup_ST.st20_next_data~q\);

-- Location: LCCOMB_X90_Y40_N14
\G1|G3|G0|mSetup_ST~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~15_combout\ = (\G1|G3|G0|mSetup_ST.st20_next_data~q\) # ((\G1|G3|G0|mSetup_ST.st10_wait_ack~q\ & (!\G1|G3|G0|I2C_Controller_inst|FIN~q\ & !\G1|G3|G0|I2C_Controller_inst|ACK~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mSetup_ST.st20_next_data~q\,
	datab => \G1|G3|G0|mSetup_ST.st10_wait_ack~q\,
	datac => \G1|G3|G0|I2C_Controller_inst|FIN~q\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK~0_combout\,
	combout => \G1|G3|G0|mSetup_ST~15_combout\);

-- Location: LCCOMB_X91_Y40_N10
\G1|G3|G0|mSetup_ST~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~17_combout\ = (!\G1|G3|G0|mI2C_CLK_DIV\(2) & (\G1|G3|G0|Equal0~0_combout\ & ((!\G1|G3|G0|LUT_INDEX\(3)) # (!\G1|G3|G0|LUT_INDEX\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(4),
	datab => \G1|G3|G0|mI2C_CLK_DIV\(2),
	datac => \G1|G3|G0|LUT_INDEX\(3),
	datad => \G1|G3|G0|Equal0~0_combout\,
	combout => \G1|G3|G0|mSetup_ST~17_combout\);

-- Location: LCCOMB_X90_Y40_N16
\G1|G3|G0|mSetup_ST~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~16_combout\ = (\KEY[0]~input_o\ & ((\G1|G3|G0|mSetup_ST~17_combout\ & (!\G1|G3|G0|mSetup_ST~15_combout\)) # (!\G1|G3|G0|mSetup_ST~17_combout\ & ((\G1|G3|G0|mSetup_ST.st0_send_data~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \G1|G3|G0|mSetup_ST~15_combout\,
	datac => \G1|G3|G0|mSetup_ST.st0_send_data~q\,
	datad => \G1|G3|G0|mSetup_ST~17_combout\,
	combout => \G1|G3|G0|mSetup_ST~16_combout\);

-- Location: FF_X90_Y40_N17
\G1|G3|G0|mSetup_ST.st0_send_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mSetup_ST~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mSetup_ST.st0_send_data~q\);

-- Location: LCCOMB_X91_Y40_N22
\G1|G3|G0|mSetup_ST~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mSetup_ST~12_combout\ = (\G1|G3|G0|mSetup_ST~11_combout\ & (!\G1|G3|G0|mSetup_ST.st0_send_data~q\ & ((\G1|G3|G0|mSetup_ST~17_combout\)))) # (!\G1|G3|G0|mSetup_ST~11_combout\ & ((\G1|G3|G0|mSetup_ST.st10_wait_ack~q\) # 
-- ((!\G1|G3|G0|mSetup_ST.st0_send_data~q\ & \G1|G3|G0|mSetup_ST~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mSetup_ST~11_combout\,
	datab => \G1|G3|G0|mSetup_ST.st0_send_data~q\,
	datac => \G1|G3|G0|mSetup_ST.st10_wait_ack~q\,
	datad => \G1|G3|G0|mSetup_ST~17_combout\,
	combout => \G1|G3|G0|mSetup_ST~12_combout\);

-- Location: FF_X91_Y40_N23
\G1|G3|G0|mSetup_ST.st10_wait_ack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mSetup_ST~12_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mSetup_ST.st10_wait_ack~q\);

-- Location: LCCOMB_X91_Y40_N12
\G1|G3|G0|mI2C_GO~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_GO~0_combout\ = (\G1|G3|G0|mI2C_GO~q\ & (((\G1|G3|G0|I2C_Controller_inst|ACK~0_combout\) # (!\G1|G3|G0|mSetup_ST~11_combout\)) # (!\G1|G3|G0|mSetup_ST.st10_wait_ack~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mSetup_ST.st10_wait_ack~q\,
	datab => \G1|G3|G0|mI2C_GO~q\,
	datac => \G1|G3|G0|mSetup_ST~11_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|ACK~0_combout\,
	combout => \G1|G3|G0|mI2C_GO~0_combout\);

-- Location: LCCOMB_X91_Y40_N24
\G1|G3|G0|mI2C_GO~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_GO~1_combout\ = (\G1|G3|G0|mI2C_GO~0_combout\) # ((\G1|G3|G0|mSetup_ST~17_combout\ & (!\G1|G3|G0|mSetup_ST.st20_next_data~q\ & !\G1|G3|G0|mSetup_ST.st10_wait_ack~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mSetup_ST~17_combout\,
	datab => \G1|G3|G0|mSetup_ST.st20_next_data~q\,
	datac => \G1|G3|G0|mSetup_ST.st10_wait_ack~q\,
	datad => \G1|G3|G0|mI2C_GO~0_combout\,
	combout => \G1|G3|G0|mI2C_GO~1_combout\);

-- Location: FF_X91_Y40_N25
\G1|G3|G0|mI2C_GO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|mI2C_GO~1_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_GO~q\);

-- Location: LCCOMB_X92_Y39_N10
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\ = (!\G1|G3|G0|mI2C_GO~q\) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KEY[0]~input_o\,
	datad => \G1|G3|G0|mI2C_GO~q\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\);

-- Location: FF_X92_Y39_N15
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~12_combout\,
	asdata => \KEY[0]~_wirecell_combout\,
	sload => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1));

-- Location: LCCOMB_X92_Y39_N16
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~14_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~13\ $ (GND))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & 
-- (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~13\ & VCC))
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~15\ = CARRY((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & !\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datad => VCC,
	cin => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[1]~13\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~14_combout\,
	cout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~15\);

-- Location: FF_X92_Y39_N17
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~14_combout\,
	asdata => \KEY[0]~_wirecell_combout\,
	sload => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2));

-- Location: LCCOMB_X92_Y39_N18
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~16_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~15\)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & 
-- ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~15\) # (GND)))
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~17\ = CARRY((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~15\) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datad => VCC,
	cin => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[2]~15\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~16_combout\,
	cout => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~17\);

-- Location: FF_X92_Y39_N19
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[3]~16_combout\,
	asdata => \KEY[0]~_wirecell_combout\,
	sload => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3));

-- Location: FF_X92_Y39_N21
\G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[4]~18_combout\,
	asdata => \KEY[0]~_wirecell_combout\,
	sload => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~8_combout\,
	ena => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4));

-- Location: LCCOMB_X91_Y39_N12
\G1|G3|G0|I2C_Controller_inst|Mux1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~9_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1)) # (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~9_combout\);

-- Location: LCCOMB_X90_Y39_N16
\G1|G3|G0|I2C_Controller_inst|Mux1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~10_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0)) # (!\G1|G3|G0|I2C_Controller_inst|SDO~q\))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & 
-- ((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SDO~q\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~10_combout\);

-- Location: LCCOMB_X90_Y39_N6
\G1|G3|G0|I2C_Controller_inst|Mux1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~11_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & (((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & 
-- (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & ((\G1|G3|G0|I2C_Controller_inst|Mux1~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~10_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~11_combout\);

-- Location: LCCOMB_X90_Y39_N4
\G1|G3|G0|I2C_Controller_inst|Mux1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~13_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & ((\G1|G3|G0|I2C_Controller_inst|Mux1~11_combout\ & (\G1|G3|G0|I2C_Controller_inst|Mux1~12_combout\)) # (!\G1|G3|G0|I2C_Controller_inst|Mux1~11_combout\ & 
-- ((\G1|G3|G0|I2C_Controller_inst|Mux1~9_combout\))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & (((\G1|G3|G0|I2C_Controller_inst|Mux1~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|Mux1~12_combout\,
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datac => \G1|G3|G0|I2C_Controller_inst|Mux1~9_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~11_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~13_combout\);

-- Location: FF_X89_Y40_N23
\G1|G3|G0|LUT_INDEX[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|LUT_INDEX[2]~9_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \G1|G3|G0|LUT_INDEX[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|LUT_INDEX\(2));

-- Location: LCCOMB_X92_Y40_N12
\G1|G3|G0|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux6~0_combout\ = (\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX\(4) & ((\G1|G3|G0|LUT_INDEX\(2))))) # (!\G1|G3|G0|LUT_INDEX\(1) & (!\G1|G3|G0|LUT_INDEX\(2) & (\G1|G3|G0|LUT_INDEX\(4) $ (\G1|G3|G0|LUT_INDEX\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(4),
	datac => \G1|G3|G0|LUT_INDEX\(3),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux6~0_combout\);

-- Location: LCCOMB_X91_Y40_N28
\G1|G3|G0|mI2C_DATA[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|mI2C_DATA[12]~1_combout\ = (\G1|G3|G0|mI2C_DATA[12]~0_combout\ & (!\G1|G3|G0|mSetup_ST.st0_send_data~q\ & (\G1|G3|G0|mSetup_ST~10_combout\ & \G1|G3|G0|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mI2C_DATA[12]~0_combout\,
	datab => \G1|G3|G0|mSetup_ST.st0_send_data~q\,
	datac => \G1|G3|G0|mSetup_ST~10_combout\,
	datad => \G1|G3|G0|Equal0~0_combout\,
	combout => \G1|G3|G0|mI2C_DATA[12]~1_combout\);

-- Location: FF_X92_Y40_N13
\G1|G3|G0|mI2C_DATA[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux6~0_combout\,
	sclr => \G1|G3|G0|ALT_INV_LUT_INDEX\(0),
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(6));

-- Location: LCCOMB_X91_Y39_N24
\G1|G3|G0|I2C_Controller_inst|SD[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD[12]~1_combout\ = (\KEY[0]~input_o\ & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & !\G1|G3|G0|mI2C_CLK_DIV\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datad => \G1|G3|G0|mI2C_CLK_DIV\(2),
	combout => \G1|G3|G0|I2C_Controller_inst|SD[12]~1_combout\);

-- Location: LCCOMB_X91_Y39_N14
\G1|G3|G0|I2C_Controller_inst|SD[12]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) & (\G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\ & (\G1|G3|G0|Equal0~0_combout\ & \G1|G3|G0|I2C_Controller_inst|SD[12]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datab => \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\,
	datac => \G1|G3|G0|Equal0~0_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|SD[12]~1_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\);

-- Location: FF_X91_Y39_N29
\G1|G3|G0|I2C_Controller_inst|SD[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(6),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(6));

-- Location: LCCOMB_X91_Y39_N28
\G1|G3|G0|I2C_Controller_inst|Mux1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~6_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & (\G1|G3|G0|I2C_Controller_inst|SD\(5))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & 
-- ((\G1|G3|G0|I2C_Controller_inst|SD\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD\(5),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datac => \G1|G3|G0|I2C_Controller_inst|SD\(6),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~6_combout\);

-- Location: LCCOMB_X90_Y39_N8
\G1|G3|G0|I2C_Controller_inst|Mux1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~7_combout\ = (\G1|G3|G0|I2C_Controller_inst|Mux1~6_combout\) # ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & (!\G1|G3|G0|I2C_Controller_inst|SDO~q\ & \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datab => \G1|G3|G0|I2C_Controller_inst|SDO~q\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~6_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~7_combout\);

-- Location: LCCOMB_X92_Y40_N8
\G1|G3|G0|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux5~0_combout\ = (\G1|G3|G0|LUT_INDEX\(4) & (!\G1|G3|G0|LUT_INDEX\(3) & ((!\G1|G3|G0|LUT_INDEX\(2)) # (!\G1|G3|G0|LUT_INDEX\(1))))) # (!\G1|G3|G0|LUT_INDEX\(4) & ((\G1|G3|G0|LUT_INDEX\(3) $ (\G1|G3|G0|LUT_INDEX\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(4),
	datac => \G1|G3|G0|LUT_INDEX\(3),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux5~0_combout\);

-- Location: FF_X92_Y40_N9
\G1|G3|G0|mI2C_DATA[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux5~0_combout\,
	sclr => \G1|G3|G0|ALT_INV_LUT_INDEX\(0),
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(7));

-- Location: FF_X91_Y39_N23
\G1|G3|G0|I2C_Controller_inst|SD[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(7),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(7));

-- Location: LCCOMB_X91_Y39_N22
\G1|G3|G0|I2C_Controller_inst|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~2_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & (((\G1|G3|G0|I2C_Controller_inst|SD\(7)) # (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & 
-- ((\G1|G3|G0|I2C_Controller_inst|SD\(0)) # ((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD\(0),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|SD\(7),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~2_combout\);

-- Location: LCCOMB_X92_Y40_N20
\G1|G3|G0|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux9~0_combout\ = (\G1|G3|G0|LUT_INDEX\(4) & (((!\G1|G3|G0|LUT_INDEX\(3) & \G1|G3|G0|LUT_INDEX\(2))))) # (!\G1|G3|G0|LUT_INDEX\(4) & ((\G1|G3|G0|LUT_INDEX\(1) & ((\G1|G3|G0|LUT_INDEX\(2)))) # (!\G1|G3|G0|LUT_INDEX\(1) & 
-- (\G1|G3|G0|LUT_INDEX\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(4),
	datac => \G1|G3|G0|LUT_INDEX\(3),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux9~0_combout\);

-- Location: FF_X92_Y40_N21
\G1|G3|G0|mI2C_DATA[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux9~0_combout\,
	sclr => \G1|G3|G0|ALT_INV_LUT_INDEX\(0),
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(3));

-- Location: FF_X91_Y39_N11
\G1|G3|G0|I2C_Controller_inst|SD[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(3),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(3));

-- Location: LCCOMB_X90_Y40_N2
\G1|G3|G0|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux1~0_combout\ = (!\G1|G3|G0|LUT_INDEX\(0) & ((\G1|G3|G0|LUT_INDEX\(3) & ((!\G1|G3|G0|LUT_INDEX\(2)))) # (!\G1|G3|G0|LUT_INDEX\(3) & ((\G1|G3|G0|LUT_INDEX\(1)) # (\G1|G3|G0|LUT_INDEX\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|LUT_INDEX\(1),
	datab => \G1|G3|G0|LUT_INDEX\(3),
	datac => \G1|G3|G0|LUT_INDEX\(0),
	datad => \G1|G3|G0|LUT_INDEX\(2),
	combout => \G1|G3|G0|Mux1~0_combout\);

-- Location: LCCOMB_X91_Y40_N16
\G1|G3|G0|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|Mux1~1_combout\ = (!\G1|G3|G0|LUT_INDEX\(4) & \G1|G3|G0|Mux1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G3|G0|LUT_INDEX\(4),
	datad => \G1|G3|G0|Mux1~0_combout\,
	combout => \G1|G3|G0|Mux1~1_combout\);

-- Location: FF_X91_Y40_N17
\G1|G3|G0|mI2C_DATA[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|Mux1~1_combout\,
	ena => \G1|G3|G0|mI2C_DATA[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|mI2C_DATA\(11));

-- Location: FF_X91_Y39_N17
\G1|G3|G0|I2C_Controller_inst|SD[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \G1|G3|G0|mI2C_DATA\(11),
	sload => VCC,
	ena => \G1|G3|G0|I2C_Controller_inst|SD[12]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SD\(11));

-- Location: LCCOMB_X91_Y39_N16
\G1|G3|G0|I2C_Controller_inst|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~3_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & (((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & 
-- (\G1|G3|G0|I2C_Controller_inst|SD\(10))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & ((\G1|G3|G0|I2C_Controller_inst|SD\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD\(10),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datac => \G1|G3|G0|I2C_Controller_inst|SD\(11),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~3_combout\);

-- Location: LCCOMB_X91_Y39_N10
\G1|G3|G0|I2C_Controller_inst|Mux1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~4_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & ((\G1|G3|G0|I2C_Controller_inst|Mux1~3_combout\ & ((\G1|G3|G0|I2C_Controller_inst|SD\(3)))) # (!\G1|G3|G0|I2C_Controller_inst|Mux1~3_combout\ & 
-- (\G1|G3|G0|I2C_Controller_inst|SD\(4))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & (((\G1|G3|G0|I2C_Controller_inst|Mux1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD\(4),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datac => \G1|G3|G0|I2C_Controller_inst|SD\(3),
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~3_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~4_combout\);

-- Location: LCCOMB_X91_Y39_N4
\G1|G3|G0|I2C_Controller_inst|Mux1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~5_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & 
-- (\G1|G3|G0|I2C_Controller_inst|Mux1~2_combout\)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & ((\G1|G3|G0|I2C_Controller_inst|Mux1~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datac => \G1|G3|G0|I2C_Controller_inst|Mux1~2_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~4_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~5_combout\);

-- Location: LCCOMB_X90_Y39_N10
\G1|G3|G0|I2C_Controller_inst|Mux1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~8_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & ((\G1|G3|G0|I2C_Controller_inst|Mux1~5_combout\ & ((\G1|G3|G0|I2C_Controller_inst|Mux1~7_combout\))) # (!\G1|G3|G0|I2C_Controller_inst|Mux1~5_combout\ & 
-- (\G1|G3|G0|I2C_Controller_inst|Mux1~1_combout\)))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & (((\G1|G3|G0|I2C_Controller_inst|Mux1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|Mux1~1_combout\,
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datac => \G1|G3|G0|I2C_Controller_inst|Mux1~7_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~5_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~8_combout\);

-- Location: LCCOMB_X90_Y39_N2
\G1|G3|G0|I2C_Controller_inst|Mux1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux1~14_combout\ = (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & ((!\G1|G3|G0|I2C_Controller_inst|Mux1~8_combout\))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & 
-- (!\G1|G3|G0|I2C_Controller_inst|Mux1~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datac => \G1|G3|G0|I2C_Controller_inst|Mux1~13_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|Mux1~8_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux1~14_combout\);

-- Location: FF_X90_Y39_N3
\G1|G3|G0|I2C_Controller_inst|SDO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|Mux1~14_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \G1|G3|G0|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SDO~q\);

-- Location: LCCOMB_X89_Y39_N20
\G1|G3|G0|I2C_Controller_inst|DIR~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|DIR~8_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0)) # (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2)))) # 
-- (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) & (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) $ 
-- (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	combout => \G1|G3|G0|I2C_Controller_inst|DIR~8_combout\);

-- Location: LCCOMB_X89_Y39_N18
\G1|G3|G0|I2C_Controller_inst|DIR~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|DIR~9_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3) $ (\G1|G3|G0|I2C_Controller_inst|DIR~8_combout\)))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1) & 
-- (\G1|G3|G0|I2C_Controller_inst|DIR~8_combout\ & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4)) # (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datad => \G1|G3|G0|I2C_Controller_inst|DIR~8_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|DIR~9_combout\);

-- Location: LCCOMB_X88_Y39_N8
\G1|G3|G0|I2C_Controller_inst|DIR~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|DIR~4_combout\ = (!\G1|G3|G0|mI2C_CLK_DIV\(2) & (\G1|G3|G0|Equal0~0_combout\ & !\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mI2C_CLK_DIV\(2),
	datac => \G1|G3|G0|Equal0~0_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	combout => \G1|G3|G0|I2C_Controller_inst|DIR~4_combout\);

-- Location: LCCOMB_X89_Y39_N2
\G1|G3|G0|I2C_Controller_inst|DIR~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|DIR~7_combout\ = (\G1|G3|G0|I2C_Controller_inst|DIR~6_combout\ & ((\G1|G3|G0|I2C_Controller_inst|DIR~q\) # ((\G1|G3|G0|I2C_Controller_inst|DIR~9_combout\ & \G1|G3|G0|I2C_Controller_inst|DIR~4_combout\)))) # 
-- (!\G1|G3|G0|I2C_Controller_inst|DIR~6_combout\ & (\G1|G3|G0|I2C_Controller_inst|DIR~q\ & ((\G1|G3|G0|I2C_Controller_inst|DIR~9_combout\) # (!\G1|G3|G0|I2C_Controller_inst|DIR~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|DIR~6_combout\,
	datab => \G1|G3|G0|I2C_Controller_inst|DIR~9_combout\,
	datac => \G1|G3|G0|I2C_Controller_inst|DIR~q\,
	datad => \G1|G3|G0|I2C_Controller_inst|DIR~4_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|DIR~7_combout\);

-- Location: FF_X89_Y39_N3
\G1|G3|G0|I2C_Controller_inst|DIR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|DIR~7_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|DIR~q\);

-- Location: LCCOMB_X36_Y72_N24
\G1|G2|vga_nblank\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_nblank~combout\ = (\G1|G2|vga_hsync~reg0_q\ & \G1|G2|vga_vsync~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_hsync~reg0_q\,
	datad => \G1|G2|vga_vsync~reg0_q\,
	combout => \G1|G2|vga_nblank~combout\);

-- Location: FF_X61_Y33_N1
\G1|G2|vcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|vcount[3]~16_combout\,
	sclr => \G1|G2|LessThan6~2_combout\,
	sload => VCC,
	ena => \G1|G2|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|vcount\(3));

-- Location: LCCOMB_X61_Y33_N28
\G1|G2|LessThan7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan7~0_combout\ = (!\G1|G2|vcount\(2) & (!\G1|G2|vcount\(1) & !\G1|G2|vcount\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(2),
	datac => \G1|G2|vcount\(1),
	datad => \G1|G2|vcount\(3),
	combout => \G1|G2|LessThan7~0_combout\);

-- Location: LCCOMB_X62_Y33_N26
\G1|G2|LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan2~0_combout\ = (!\G1|G2|vcount\(6) & !\G1|G2|vcount\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(6),
	datad => \G1|G2|vcount\(5),
	combout => \G1|G2|LessThan2~0_combout\);

-- Location: LCCOMB_X61_Y33_N22
\G1|G2|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan2~1_combout\ = ((\G1|G2|LessThan2~0_combout\ & ((\G1|G2|LessThan7~0_combout\) # (!\G1|G2|vcount\(4))))) # (!\G1|G2|vcount\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(7),
	datab => \G1|G2|LessThan7~0_combout\,
	datac => \G1|G2|vcount\(4),
	datad => \G1|G2|LessThan2~0_combout\,
	combout => \G1|G2|LessThan2~1_combout\);

-- Location: LCCOMB_X59_Y33_N18
\G1|G2|vga_rgb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_rgb~1_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|LessThan2~1_combout\ $ (!\G1|G2|vcount\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~0_combout\,
	datab => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vcount\(8),
	combout => \G1|G2|vga_rgb~1_combout\);

-- Location: LCCOMB_X75_Y39_N4
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: IOIBUF_X109_Y0_N8
\CMOS_DATA[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(2),
	o => \CMOS_DATA[2]~input_o\);

-- Location: IOIBUF_X94_Y0_N1
\CMOS_LVAL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_LVAL,
	o => \CMOS_LVAL~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\CMOS_FVAL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_FVAL,
	o => \CMOS_FVAL~input_o\);

-- Location: LCCOMB_X60_Y32_N18
\G1|G3|p1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|p1~0_combout\ = (\CMOS_LVAL~input_o\ & \CMOS_FVAL~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CMOS_LVAL~input_o\,
	datad => \CMOS_FVAL~input_o\,
	combout => \G1|G3|p1~0_combout\);

-- Location: FF_X63_Y31_N7
\G1|G3|pixel_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[2]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(0));

-- Location: LCCOMB_X63_Y31_N6
\G1|address_pixel_ram_lutinverse[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[0]~0_combout\ = (\G0|lut_offset_inverse\(0) & (\G1|G3|pixel_data\(0) & VCC)) # (!\G0|lut_offset_inverse\(0) & (\G1|G3|pixel_data\(0) $ (VCC)))
-- \G1|address_pixel_ram_lutinverse[0]~1\ = CARRY((!\G0|lut_offset_inverse\(0) & \G1|G3|pixel_data\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G0|lut_offset_inverse\(0),
	datab => \G1|G3|pixel_data\(0),
	datad => VCC,
	combout => \G1|address_pixel_ram_lutinverse[0]~0_combout\,
	cout => \G1|address_pixel_ram_lutinverse[0]~1\);

-- Location: IOIBUF_X96_Y0_N22
\CMOS_DATA[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(3),
	o => \CMOS_DATA[3]~input_o\);

-- Location: FF_X63_Y31_N9
\G1|G3|pixel_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[3]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(1));

-- Location: LCCOMB_X63_Y31_N8
\G1|address_pixel_ram_lutinverse[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[1]~2_combout\ = (\G1|G3|pixel_data\(1) & (!\G1|address_pixel_ram_lutinverse[0]~1\)) # (!\G1|G3|pixel_data\(1) & ((\G1|address_pixel_ram_lutinverse[0]~1\) # (GND)))
-- \G1|address_pixel_ram_lutinverse[1]~3\ = CARRY((!\G1|address_pixel_ram_lutinverse[0]~1\) # (!\G1|G3|pixel_data\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|pixel_data\(1),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutinverse[0]~1\,
	combout => \G1|address_pixel_ram_lutinverse[1]~2_combout\,
	cout => \G1|address_pixel_ram_lutinverse[1]~3\);

-- Location: LCCOMB_X63_Y31_N10
\G1|address_pixel_ram_lutinverse[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[2]~4_combout\ = (\G1|G3|pixel_data\(2) & (\G1|address_pixel_ram_lutinverse[1]~3\ $ (GND))) # (!\G1|G3|pixel_data\(2) & (!\G1|address_pixel_ram_lutinverse[1]~3\ & VCC))
-- \G1|address_pixel_ram_lutinverse[2]~5\ = CARRY((\G1|G3|pixel_data\(2) & !\G1|address_pixel_ram_lutinverse[1]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_data\(2),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutinverse[1]~3\,
	combout => \G1|address_pixel_ram_lutinverse[2]~4_combout\,
	cout => \G1|address_pixel_ram_lutinverse[2]~5\);

-- Location: LCCOMB_X63_Y31_N12
\G1|address_pixel_ram_lutinverse[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[3]~6_combout\ = (\G1|G3|pixel_data\(3) & (!\G1|address_pixel_ram_lutinverse[2]~5\)) # (!\G1|G3|pixel_data\(3) & ((\G1|address_pixel_ram_lutinverse[2]~5\) # (GND)))
-- \G1|address_pixel_ram_lutinverse[3]~7\ = CARRY((!\G1|address_pixel_ram_lutinverse[2]~5\) # (!\G1|G3|pixel_data\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|pixel_data\(3),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutinverse[2]~5\,
	combout => \G1|address_pixel_ram_lutinverse[3]~6_combout\,
	cout => \G1|address_pixel_ram_lutinverse[3]~7\);

-- Location: IOIBUF_X102_Y0_N15
\CMOS_DATA[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(6),
	o => \CMOS_DATA[6]~input_o\);

-- Location: FF_X63_Y31_N15
\G1|G3|pixel_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[6]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(4));

-- Location: LCCOMB_X63_Y31_N14
\G1|address_pixel_ram_lutinverse[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[4]~8_combout\ = (\G1|G3|pixel_data\(4) & (\G1|address_pixel_ram_lutinverse[3]~7\ $ (GND))) # (!\G1|G3|pixel_data\(4) & (!\G1|address_pixel_ram_lutinverse[3]~7\ & VCC))
-- \G1|address_pixel_ram_lutinverse[4]~9\ = CARRY((\G1|G3|pixel_data\(4) & !\G1|address_pixel_ram_lutinverse[3]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|pixel_data\(4),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutinverse[3]~7\,
	combout => \G1|address_pixel_ram_lutinverse[4]~8_combout\,
	cout => \G1|address_pixel_ram_lutinverse[4]~9\);

-- Location: IOIBUF_X65_Y0_N22
\CMOS_DATA[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(7),
	o => \CMOS_DATA[7]~input_o\);

-- Location: FF_X63_Y31_N17
\G1|G3|pixel_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[7]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(5));

-- Location: LCCOMB_X63_Y31_N16
\G1|address_pixel_ram_lutinverse[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[5]~10_combout\ = (\G1|G3|pixel_data\(5) & (!\G1|address_pixel_ram_lutinverse[4]~9\)) # (!\G1|G3|pixel_data\(5) & ((\G1|address_pixel_ram_lutinverse[4]~9\) # (GND)))
-- \G1|address_pixel_ram_lutinverse[5]~11\ = CARRY((!\G1|address_pixel_ram_lutinverse[4]~9\) # (!\G1|G3|pixel_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|pixel_data\(5),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutinverse[4]~9\,
	combout => \G1|address_pixel_ram_lutinverse[5]~10_combout\,
	cout => \G1|address_pixel_ram_lutinverse[5]~11\);

-- Location: IOIBUF_X60_Y0_N15
\CMOS_DATA[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(8),
	o => \CMOS_DATA[8]~input_o\);

-- Location: FF_X63_Y31_N19
\G1|G3|pixel_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[8]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(6));

-- Location: LCCOMB_X63_Y31_N18
\G1|address_pixel_ram_lutinverse[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[6]~12_combout\ = (\G1|G3|pixel_data\(6) & (\G1|address_pixel_ram_lutinverse[5]~11\ $ (GND))) # (!\G1|G3|pixel_data\(6) & (!\G1|address_pixel_ram_lutinverse[5]~11\ & VCC))
-- \G1|address_pixel_ram_lutinverse[6]~13\ = CARRY((\G1|G3|pixel_data\(6) & !\G1|address_pixel_ram_lutinverse[5]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|pixel_data\(6),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutinverse[5]~11\,
	combout => \G1|address_pixel_ram_lutinverse[6]~12_combout\,
	cout => \G1|address_pixel_ram_lutinverse[6]~13\);

-- Location: IOIBUF_X60_Y0_N8
\CMOS_DATA[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(9),
	o => \CMOS_DATA[9]~input_o\);

-- Location: FF_X63_Y31_N21
\G1|G3|pixel_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \CMOS_DATA[9]~input_o\,
	sload => VCC,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_data\(7));

-- Location: LCCOMB_X63_Y31_N20
\G1|address_pixel_ram_lutinverse[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[7]~14_combout\ = (\G1|G3|pixel_data\(7) & (!\G1|address_pixel_ram_lutinverse[6]~13\)) # (!\G1|G3|pixel_data\(7) & ((\G1|address_pixel_ram_lutinverse[6]~13\) # (GND)))
-- \G1|address_pixel_ram_lutinverse[7]~15\ = CARRY((!\G1|address_pixel_ram_lutinverse[6]~13\) # (!\G1|G3|pixel_data\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|pixel_data\(7),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutinverse[6]~13\,
	combout => \G1|address_pixel_ram_lutinverse[7]~14_combout\,
	cout => \G1|address_pixel_ram_lutinverse[7]~15\);

-- Location: LCCOMB_X63_Y31_N22
\G1|address_pixel_ram_lutinverse[8]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutinverse[8]~16_combout\ = !\G1|address_pixel_ram_lutinverse[7]~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \G1|address_pixel_ram_lutinverse[7]~15\,
	combout => \G1|address_pixel_ram_lutinverse[8]~16_combout\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: FF_X65_Y32_N1
\G0|lut_offset_inverse[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G0|lut_offset_inverse\(9));

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: FF_X65_Y32_N19
\G0|lut_offset_inverse[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G0|lut_offset_inverse\(10));

-- Location: LCCOMB_X63_Y32_N4
\G1|address_pixel_ram_lutnormal[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[0]~0_combout\ = (\G0|lut_offset_inverse\(0) & (\G1|G1|altsyncram_component|auto_generated|q_a\(0) & VCC)) # (!\G0|lut_offset_inverse\(0) & (\G1|G1|altsyncram_component|auto_generated|q_a\(0) $ (VCC)))
-- \G1|address_pixel_ram_lutnormal[0]~1\ = CARRY((!\G0|lut_offset_inverse\(0) & \G1|G1|altsyncram_component|auto_generated|q_a\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G0|lut_offset_inverse\(0),
	datab => \G1|G1|altsyncram_component|auto_generated|q_a\(0),
	datad => VCC,
	combout => \G1|address_pixel_ram_lutnormal[0]~0_combout\,
	cout => \G1|address_pixel_ram_lutnormal[0]~1\);

-- Location: LCCOMB_X63_Y32_N6
\G1|address_pixel_ram_lutnormal[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[1]~2_combout\ = (\G1|G1|altsyncram_component|auto_generated|q_a\(1) & (!\G1|address_pixel_ram_lutnormal[0]~1\)) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(1) & ((\G1|address_pixel_ram_lutnormal[0]~1\) # (GND)))
-- \G1|address_pixel_ram_lutnormal[1]~3\ = CARRY((!\G1|address_pixel_ram_lutnormal[0]~1\) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G1|altsyncram_component|auto_generated|q_a\(1),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[0]~1\,
	combout => \G1|address_pixel_ram_lutnormal[1]~2_combout\,
	cout => \G1|address_pixel_ram_lutnormal[1]~3\);

-- Location: LCCOMB_X63_Y32_N8
\G1|address_pixel_ram_lutnormal[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[2]~4_combout\ = (\G1|G1|altsyncram_component|auto_generated|q_a\(2) & (\G1|address_pixel_ram_lutnormal[1]~3\ $ (GND))) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(2) & (!\G1|address_pixel_ram_lutnormal[1]~3\ & VCC))
-- \G1|address_pixel_ram_lutnormal[2]~5\ = CARRY((\G1|G1|altsyncram_component|auto_generated|q_a\(2) & !\G1|address_pixel_ram_lutnormal[1]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G1|altsyncram_component|auto_generated|q_a\(2),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[1]~3\,
	combout => \G1|address_pixel_ram_lutnormal[2]~4_combout\,
	cout => \G1|address_pixel_ram_lutnormal[2]~5\);

-- Location: LCCOMB_X63_Y32_N0
\G0|lut_offset_inverse[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G0|lut_offset_inverse[0]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \G0|lut_offset_inverse[0]~feeder_combout\);

-- Location: FF_X63_Y32_N1
\G0|lut_offset_inverse[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G0|lut_offset_inverse[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G0|lut_offset_inverse\(0));

-- Location: LCCOMB_X63_Y32_N10
\G1|address_pixel_ram_lutnormal[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[3]~6_combout\ = (\G1|G1|altsyncram_component|auto_generated|q_a\(3) & (!\G1|address_pixel_ram_lutnormal[2]~5\)) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(3) & ((\G1|address_pixel_ram_lutnormal[2]~5\) # (GND)))
-- \G1|address_pixel_ram_lutnormal[3]~7\ = CARRY((!\G1|address_pixel_ram_lutnormal[2]~5\) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G1|altsyncram_component|auto_generated|q_a\(3),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[2]~5\,
	combout => \G1|address_pixel_ram_lutnormal[3]~6_combout\,
	cout => \G1|address_pixel_ram_lutnormal[3]~7\);

-- Location: LCCOMB_X63_Y32_N12
\G1|address_pixel_ram_lutnormal[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[4]~8_combout\ = (\G1|G1|altsyncram_component|auto_generated|q_a\(4) & (\G1|address_pixel_ram_lutnormal[3]~7\ $ (GND))) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(4) & (!\G1|address_pixel_ram_lutnormal[3]~7\ & VCC))
-- \G1|address_pixel_ram_lutnormal[4]~9\ = CARRY((\G1|G1|altsyncram_component|auto_generated|q_a\(4) & !\G1|address_pixel_ram_lutnormal[3]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G1|altsyncram_component|auto_generated|q_a\(4),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[3]~7\,
	combout => \G1|address_pixel_ram_lutnormal[4]~8_combout\,
	cout => \G1|address_pixel_ram_lutnormal[4]~9\);

-- Location: LCCOMB_X63_Y32_N14
\G1|address_pixel_ram_lutnormal[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[5]~10_combout\ = (\G1|G1|altsyncram_component|auto_generated|q_a\(5) & (!\G1|address_pixel_ram_lutnormal[4]~9\)) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(5) & ((\G1|address_pixel_ram_lutnormal[4]~9\) # (GND)))
-- \G1|address_pixel_ram_lutnormal[5]~11\ = CARRY((!\G1|address_pixel_ram_lutnormal[4]~9\) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G1|altsyncram_component|auto_generated|q_a\(5),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[4]~9\,
	combout => \G1|address_pixel_ram_lutnormal[5]~10_combout\,
	cout => \G1|address_pixel_ram_lutnormal[5]~11\);

-- Location: LCCOMB_X63_Y32_N16
\G1|address_pixel_ram_lutnormal[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[6]~12_combout\ = (\G1|G1|altsyncram_component|auto_generated|q_a\(6) & (\G1|address_pixel_ram_lutnormal[5]~11\ $ (GND))) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(6) & (!\G1|address_pixel_ram_lutnormal[5]~11\ & 
-- VCC))
-- \G1|address_pixel_ram_lutnormal[6]~13\ = CARRY((\G1|G1|altsyncram_component|auto_generated|q_a\(6) & !\G1|address_pixel_ram_lutnormal[5]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G1|altsyncram_component|auto_generated|q_a\(6),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[5]~11\,
	combout => \G1|address_pixel_ram_lutnormal[6]~12_combout\,
	cout => \G1|address_pixel_ram_lutnormal[6]~13\);

-- Location: LCCOMB_X63_Y32_N18
\G1|address_pixel_ram_lutnormal[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[7]~14_combout\ = (\G1|G1|altsyncram_component|auto_generated|q_a\(7) & (!\G1|address_pixel_ram_lutnormal[6]~13\)) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(7) & ((\G1|address_pixel_ram_lutnormal[6]~13\) # (GND)))
-- \G1|address_pixel_ram_lutnormal[7]~15\ = CARRY((!\G1|address_pixel_ram_lutnormal[6]~13\) # (!\G1|G1|altsyncram_component|auto_generated|q_a\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G1|altsyncram_component|auto_generated|q_a\(7),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[6]~13\,
	combout => \G1|address_pixel_ram_lutnormal[7]~14_combout\,
	cout => \G1|address_pixel_ram_lutnormal[7]~15\);

-- Location: LCCOMB_X63_Y32_N20
\G1|address_pixel_ram_lutnormal[8]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[8]~16_combout\ = (\G0|lut_offset_inverse\(0) & (\G1|address_pixel_ram_lutnormal[7]~15\ $ (GND))) # (!\G0|lut_offset_inverse\(0) & (!\G1|address_pixel_ram_lutnormal[7]~15\ & VCC))
-- \G1|address_pixel_ram_lutnormal[8]~17\ = CARRY((\G0|lut_offset_inverse\(0) & !\G1|address_pixel_ram_lutnormal[7]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G0|lut_offset_inverse\(0),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[7]~15\,
	combout => \G1|address_pixel_ram_lutnormal[8]~16_combout\,
	cout => \G1|address_pixel_ram_lutnormal[8]~17\);

-- Location: LCCOMB_X63_Y32_N22
\G1|address_pixel_ram_lutnormal[9]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[9]~18_combout\ = (\G0|lut_offset_normal\(9) & (!\G1|address_pixel_ram_lutnormal[8]~17\)) # (!\G0|lut_offset_normal\(9) & ((\G1|address_pixel_ram_lutnormal[8]~17\) # (GND)))
-- \G1|address_pixel_ram_lutnormal[9]~19\ = CARRY((!\G1|address_pixel_ram_lutnormal[8]~17\) # (!\G0|lut_offset_normal\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G0|lut_offset_normal\(9),
	datad => VCC,
	cin => \G1|address_pixel_ram_lutnormal[8]~17\,
	combout => \G1|address_pixel_ram_lutnormal[9]~18_combout\,
	cout => \G1|address_pixel_ram_lutnormal[9]~19\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: FF_X63_Y32_N25
\G0|lut_offset_normal[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G0|lut_offset_normal\(10));

-- Location: LCCOMB_X63_Y32_N24
\G1|address_pixel_ram_lutnormal[10]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|address_pixel_ram_lutnormal[10]~20_combout\ = \G1|address_pixel_ram_lutnormal[9]~19\ $ (!\G0|lut_offset_normal\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \G0|lut_offset_normal\(10),
	cin => \G1|address_pixel_ram_lutnormal[9]~19\,
	combout => \G1|address_pixel_ram_lutnormal[10]~20_combout\);

-- Location: M9K_X64_Y32_N0
\G1|G1|altsyncram_component|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA999999999999999999999988888888888888888877777777777777766666666666655555555555444444444433333333322222222211111111110000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEDDDDCCCCCCBBBBBBAAAAAA99999999988888888877777777777666666666666665555555555555555544444444444444444444333333333333333333333333222222222222222222222222222211111111111111111111111111100000000000000000",
	mem_init2 => X"9999999999999999999999999999999999999998888888888888888888888888888888888877777777777777777777777777777666666666666666666666666555555555555555555555544444444444444444443333333333333333332222222222222222221111111111111111111000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEDDDDDDCCCCCCCBBBBBBBBAAAAAAAAA999999999988888888888777777777776666666666666555555555555554444444444444433333333333333322222222222221111111111000000",
	mem_init1 => X"3333333333333333333333333333333333333333333333322222222222222222222222222222222222222222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEDDDCCCBBBAAA999888877766665555444333332222111100000",
	mem_init0 => X"FFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAA99999999999999998888888888888888777777777777777766666666666666665555555555555555444444444444444433333333333333332222222222222222111111111111111100000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAA99999999999999999998888888888888888877777777777777766666666666665555555555544444444433333332222211100",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "all_luts.mif",
	init_file_layout => "port_a",
	logical_ram_name => "hdr_datapath:G1|ram_lut_doubleport:G1|altsyncram:altsyncram_component|altsyncram_40g2:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 11,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 4,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 2047,
	port_b_logical_ram_depth => 2048,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portbdatain => \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAIN_bus\,
	portaaddr => \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\,
	portbdataout => \G1|G1|altsyncram_component|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X58_Y32_N0
\G1|G3|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~0_combout\ = \G1|G3|cnt\(0) $ (VCC)
-- \G1|G3|Add0~1\ = CARRY(\G1|G3|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(0),
	datad => VCC,
	combout => \G1|G3|Add0~0_combout\,
	cout => \G1|G3|Add0~1\);

-- Location: FF_X58_Y32_N1
\G1|G3|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~0_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(0));

-- Location: LCCOMB_X59_Y32_N6
\G1|G3|pixel_address~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~3_combout\ = (\CMOS_FVAL~input_o\ & (\G1|G3|cnt\(0) & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMOS_FVAL~input_o\,
	datac => \G1|G3|cnt\(0),
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~3_combout\);

-- Location: FF_X59_Y32_N7
\G1|G3|pixel_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(0));

-- Location: LCCOMB_X59_Y32_N12
\G1|G3|pixel_address~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~4_combout\ = (\G1|G3|cnt\(1) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(1),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~4_combout\);

-- Location: FF_X59_Y32_N13
\G1|G3|pixel_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(1));

-- Location: LCCOMB_X58_Y32_N2
\G1|G3|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~2_combout\ = (\G1|G3|cnt\(1) & (!\G1|G3|Add0~1\)) # (!\G1|G3|cnt\(1) & ((\G1|G3|Add0~1\) # (GND)))
-- \G1|G3|Add0~3\ = CARRY((!\G1|G3|Add0~1\) # (!\G1|G3|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(1),
	datad => VCC,
	cin => \G1|G3|Add0~1\,
	combout => \G1|G3|Add0~2_combout\,
	cout => \G1|G3|Add0~3\);

-- Location: FF_X58_Y32_N3
\G1|G3|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~2_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(1));

-- Location: LCCOMB_X58_Y32_N4
\G1|G3|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~4_combout\ = (\G1|G3|cnt\(2) & (\G1|G3|Add0~3\ $ (GND))) # (!\G1|G3|cnt\(2) & (!\G1|G3|Add0~3\ & VCC))
-- \G1|G3|Add0~5\ = CARRY((\G1|G3|cnt\(2) & !\G1|G3|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(2),
	datad => VCC,
	cin => \G1|G3|Add0~3\,
	combout => \G1|G3|Add0~4_combout\,
	cout => \G1|G3|Add0~5\);

-- Location: FF_X58_Y32_N5
\G1|G3|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~4_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(2));

-- Location: LCCOMB_X59_Y32_N2
\G1|G3|pixel_address~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~5_combout\ = (\CMOS_FVAL~input_o\ & (\G1|G3|cnt\(2) & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMOS_FVAL~input_o\,
	datac => \G1|G3|cnt\(2),
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~5_combout\);

-- Location: FF_X59_Y32_N3
\G1|G3|pixel_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(2));

-- Location: LCCOMB_X58_Y32_N6
\G1|G3|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~6_combout\ = (\G1|G3|cnt\(3) & (!\G1|G3|Add0~5\)) # (!\G1|G3|cnt\(3) & ((\G1|G3|Add0~5\) # (GND)))
-- \G1|G3|Add0~7\ = CARRY((!\G1|G3|Add0~5\) # (!\G1|G3|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(3),
	datad => VCC,
	cin => \G1|G3|Add0~5\,
	combout => \G1|G3|Add0~6_combout\,
	cout => \G1|G3|Add0~7\);

-- Location: FF_X58_Y32_N7
\G1|G3|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~6_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(3));

-- Location: LCCOMB_X59_Y32_N0
\G1|G3|pixel_address~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~6_combout\ = (\CMOS_FVAL~input_o\ & (\G1|G3|cnt\(3) & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMOS_FVAL~input_o\,
	datac => \G1|G3|cnt\(3),
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~6_combout\);

-- Location: FF_X59_Y32_N1
\G1|G3|pixel_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(3));

-- Location: LCCOMB_X59_Y32_N30
\G1|G3|pixel_address~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~7_combout\ = (\G1|G3|cnt\(4) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(4),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~7_combout\);

-- Location: FF_X59_Y32_N31
\G1|G3|pixel_address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(4));

-- Location: LCCOMB_X59_Y32_N20
\G1|G3|pixel_address~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~8_combout\ = (\G1|G3|cnt\(5) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(5),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~8_combout\);

-- Location: FF_X59_Y32_N21
\G1|G3|pixel_address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(5));

-- Location: LCCOMB_X59_Y32_N26
\G1|G3|pixel_address~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~9_combout\ = (\G1|G3|cnt\(6) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(6),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~9_combout\);

-- Location: FF_X59_Y32_N27
\G1|G3|pixel_address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(6));

-- Location: LCCOMB_X59_Y32_N16
\G1|G3|pixel_address~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~10_combout\ = (\G1|G3|cnt\(7) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(7),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~10_combout\);

-- Location: FF_X59_Y32_N17
\G1|G3|pixel_address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(7));

-- Location: LCCOMB_X58_Y32_N8
\G1|G3|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~8_combout\ = (\G1|G3|cnt\(4) & (\G1|G3|Add0~7\ $ (GND))) # (!\G1|G3|cnt\(4) & (!\G1|G3|Add0~7\ & VCC))
-- \G1|G3|Add0~9\ = CARRY((\G1|G3|cnt\(4) & !\G1|G3|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(4),
	datad => VCC,
	cin => \G1|G3|Add0~7\,
	combout => \G1|G3|Add0~8_combout\,
	cout => \G1|G3|Add0~9\);

-- Location: FF_X58_Y32_N9
\G1|G3|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~8_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(4));

-- Location: LCCOMB_X58_Y32_N14
\G1|G3|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~14_combout\ = (\G1|G3|cnt\(7) & (!\G1|G3|Add0~13\)) # (!\G1|G3|cnt\(7) & ((\G1|G3|Add0~13\) # (GND)))
-- \G1|G3|Add0~15\ = CARRY((!\G1|G3|Add0~13\) # (!\G1|G3|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(7),
	datad => VCC,
	cin => \G1|G3|Add0~13\,
	combout => \G1|G3|Add0~14_combout\,
	cout => \G1|G3|Add0~15\);

-- Location: FF_X58_Y32_N15
\G1|G3|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~14_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(7));

-- Location: LCCOMB_X58_Y32_N16
\G1|G3|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~16_combout\ = (\G1|G3|cnt\(8) & (\G1|G3|Add0~15\ $ (GND))) # (!\G1|G3|cnt\(8) & (!\G1|G3|Add0~15\ & VCC))
-- \G1|G3|Add0~17\ = CARRY((\G1|G3|cnt\(8) & !\G1|G3|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(8),
	datad => VCC,
	cin => \G1|G3|Add0~15\,
	combout => \G1|G3|Add0~16_combout\,
	cout => \G1|G3|Add0~17\);

-- Location: FF_X58_Y32_N17
\G1|G3|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~16_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(8));

-- Location: LCCOMB_X59_Y32_N22
\G1|G3|pixel_address~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~11_combout\ = (\CMOS_FVAL~input_o\ & (\G1|G3|cnt\(8) & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMOS_FVAL~input_o\,
	datac => \G1|G3|cnt\(8),
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~11_combout\);

-- Location: FF_X59_Y32_N23
\G1|G3|pixel_address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(8));

-- Location: LCCOMB_X58_Y32_N18
\G1|G3|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~18_combout\ = (\G1|G3|cnt\(9) & (!\G1|G3|Add0~17\)) # (!\G1|G3|cnt\(9) & ((\G1|G3|Add0~17\) # (GND)))
-- \G1|G3|Add0~19\ = CARRY((!\G1|G3|Add0~17\) # (!\G1|G3|cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(9),
	datad => VCC,
	cin => \G1|G3|Add0~17\,
	combout => \G1|G3|Add0~18_combout\,
	cout => \G1|G3|Add0~19\);

-- Location: FF_X58_Y32_N19
\G1|G3|cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~18_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(9));

-- Location: LCCOMB_X59_Y32_N28
\G1|G3|pixel_address~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~12_combout\ = (\G1|G3|cnt\(9) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(9),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~12_combout\);

-- Location: FF_X59_Y32_N29
\G1|G3|pixel_address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(9));

-- Location: LCCOMB_X58_Y32_N20
\G1|G3|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~20_combout\ = (\G1|G3|cnt\(10) & (\G1|G3|Add0~19\ $ (GND))) # (!\G1|G3|cnt\(10) & (!\G1|G3|Add0~19\ & VCC))
-- \G1|G3|Add0~21\ = CARRY((\G1|G3|cnt\(10) & !\G1|G3|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(10),
	datad => VCC,
	cin => \G1|G3|Add0~19\,
	combout => \G1|G3|Add0~20_combout\,
	cout => \G1|G3|Add0~21\);

-- Location: FF_X58_Y32_N21
\G1|G3|cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~20_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(10));

-- Location: LCCOMB_X59_Y32_N14
\G1|G3|pixel_address~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~13_combout\ = (\G1|G3|cnt\(10) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(10),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~13_combout\);

-- Location: FF_X59_Y32_N15
\G1|G3|pixel_address[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(10));

-- Location: LCCOMB_X58_Y32_N22
\G1|G3|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|Add0~22_combout\ = (\G1|G3|cnt\(11) & (!\G1|G3|Add0~21\)) # (!\G1|G3|cnt\(11) & ((\G1|G3|Add0~21\) # (GND)))
-- \G1|G3|Add0~23\ = CARRY((!\G1|G3|Add0~21\) # (!\G1|G3|cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|cnt\(11),
	datad => VCC,
	cin => \G1|G3|Add0~21\,
	combout => \G1|G3|Add0~22_combout\,
	cout => \G1|G3|Add0~23\);

-- Location: FF_X58_Y32_N23
\G1|G3|cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~22_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(11));

-- Location: LCCOMB_X59_Y32_N8
\G1|G3|pixel_address~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~14_combout\ = (\G1|G3|cnt\(11) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(11),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~14_combout\);

-- Location: FF_X59_Y32_N9
\G1|G3|pixel_address[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(11));

-- Location: FF_X58_Y32_N25
\G1|G3|cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|Add0~24_combout\,
	ena => \G1|G3|p1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|cnt\(12));

-- Location: LCCOMB_X59_Y32_N10
\G1|G3|pixel_address~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|pixel_address~15_combout\ = (\G1|G3|cnt\(12) & (\CMOS_FVAL~input_o\ & \CMOS_LVAL~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|cnt\(12),
	datac => \CMOS_FVAL~input_o\,
	datad => \CMOS_LVAL~input_o\,
	combout => \G1|G3|pixel_address~15_combout\);

-- Location: FF_X59_Y32_N11
\G1|G3|pixel_address[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G3|pixel_address~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|pixel_address\(12));

-- Location: FF_X60_Y33_N9
\G1|G2|hcount[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G2|hcount[6]~22_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(6));

-- Location: LCCOMB_X59_Y33_N10
\G1|G2|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|LessThan0~0_combout\ = (!\G1|G2|hcount\(7) & (((!\G1|G2|hcount\(5) & !\G1|G2|hcount\(4))) # (!\G1|G2|hcount\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(7),
	datab => \G1|G2|hcount\(5),
	datac => \G1|G2|hcount\(4),
	datad => \G1|G2|hcount\(6),
	combout => \G1|G2|LessThan0~0_combout\);

-- Location: LCCOMB_X59_Y33_N6
\G1|G2|vga_rgb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_rgb~0_combout\ = (!\G1|G2|vcount\(9) & ((\G1|G2|hcount\(9) & (!\G1|G2|hcount\(8) & \G1|G2|LessThan0~0_combout\)) # (!\G1|G2|hcount\(9) & (\G1|G2|hcount\(8) & !\G1|G2|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(9),
	datab => \G1|G2|hcount\(9),
	datac => \G1|G2|hcount\(8),
	datad => \G1|G2|LessThan0~0_combout\,
	combout => \G1|G2|vga_rgb~0_combout\);

-- Location: LCCOMB_X59_Y33_N2
\G1|G2|pixel_address[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[0]~0_combout\ = (\G1|G2|hcount\(0) & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|hcount\(0),
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vga_rgb~0_combout\,
	combout => \G1|G2|pixel_address[0]~0_combout\);

-- Location: LCCOMB_X59_Y33_N22
\G1|G2|pixel_address[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[1]~1_combout\ = (\G1|G2|hcount\(1) & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|hcount\(1),
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vga_rgb~0_combout\,
	combout => \G1|G2|pixel_address[1]~1_combout\);

-- Location: FF_X63_Y33_N7
\G1|G2|hcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|hcount[2]~14_combout\,
	sclr => \G1|G2|LessThan4~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G2|hcount\(2));

-- Location: LCCOMB_X59_Y33_N20
\G1|G2|pixel_address[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[2]~2_combout\ = (\G1|G2|hcount\(2) & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|hcount\(2),
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vga_rgb~0_combout\,
	combout => \G1|G2|pixel_address[2]~2_combout\);

-- Location: LCCOMB_X59_Y33_N28
\G1|G2|pixel_address[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[3]~3_combout\ = (\G1|G2|hcount\(3) & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|hcount\(3),
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vga_rgb~0_combout\,
	combout => \G1|G2|pixel_address[3]~3_combout\);

-- Location: LCCOMB_X60_Y33_N18
\G1|G2|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add1~0_combout\ = \G1|G2|hcount\(4) $ (VCC)
-- \G1|G2|Add1~1\ = CARRY(\G1|G2|hcount\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(4),
	datad => VCC,
	combout => \G1|G2|Add1~0_combout\,
	cout => \G1|G2|Add1~1\);

-- Location: LCCOMB_X59_Y33_N16
\G1|G2|pixel_address[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[4]~4_combout\ = (\G1|G2|Add1~0_combout\ & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|Add1~0_combout\,
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vga_rgb~0_combout\,
	combout => \G1|G2|pixel_address[4]~4_combout\);

-- Location: LCCOMB_X60_Y33_N20
\G1|G2|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add1~2_combout\ = (\G1|G2|hcount\(5) & (\G1|G2|Add1~1\ & VCC)) # (!\G1|G2|hcount\(5) & (!\G1|G2|Add1~1\))
-- \G1|G2|Add1~3\ = CARRY((!\G1|G2|hcount\(5) & !\G1|G2|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(5),
	datad => VCC,
	cin => \G1|G2|Add1~1\,
	combout => \G1|G2|Add1~2_combout\,
	cout => \G1|G2|Add1~3\);

-- Location: LCCOMB_X59_Y33_N14
\G1|G2|pixel_address[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[5]~5_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add1~2_combout\ & (\G1|G2|LessThan2~1_combout\ $ (!\G1|G2|vcount\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~0_combout\,
	datab => \G1|G2|LessThan2~1_combout\,
	datac => \G1|G2|Add1~2_combout\,
	datad => \G1|G2|vcount\(8),
	combout => \G1|G2|pixel_address[5]~5_combout\);

-- Location: LCCOMB_X60_Y33_N22
\G1|G2|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add1~4_combout\ = (\G1|G2|hcount\(6) & (\G1|G2|Add1~3\ $ (GND))) # (!\G1|G2|hcount\(6) & (!\G1|G2|Add1~3\ & VCC))
-- \G1|G2|Add1~5\ = CARRY((\G1|G2|hcount\(6) & !\G1|G2|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(6),
	datad => VCC,
	cin => \G1|G2|Add1~3\,
	combout => \G1|G2|Add1~4_combout\,
	cout => \G1|G2|Add1~5\);

-- Location: LCCOMB_X59_Y33_N8
\G1|G2|pixel_address[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[6]~6_combout\ = (\G1|G2|Add1~4_combout\ & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|Add1~4_combout\,
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vga_rgb~0_combout\,
	combout => \G1|G2|pixel_address[6]~6_combout\);

-- Location: LCCOMB_X60_Y33_N24
\G1|G2|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add1~6_combout\ = (\G1|G2|hcount\(7) & (\G1|G2|Add1~5\ & VCC)) # (!\G1|G2|hcount\(7) & (!\G1|G2|Add1~5\))
-- \G1|G2|Add1~7\ = CARRY((!\G1|G2|hcount\(7) & !\G1|G2|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|hcount\(7),
	datad => VCC,
	cin => \G1|G2|Add1~5\,
	combout => \G1|G2|Add1~6_combout\,
	cout => \G1|G2|Add1~7\);

-- Location: LCCOMB_X59_Y33_N0
\G1|G2|pixel_address[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|pixel_address[7]~7_combout\ = (\G1|G2|Add1~6_combout\ & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|Add1~6_combout\,
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|vga_rgb~0_combout\,
	combout => \G1|G2|pixel_address[7]~7_combout\);

-- Location: LCCOMB_X60_Y33_N0
\G1|G2|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~4_combout\ = (\G1|G2|Add1~8_combout\ & (\G1|G2|vcount\(0) $ (VCC))) # (!\G1|G2|Add1~8_combout\ & (\G1|G2|vcount\(0) & VCC))
-- \G1|G2|Add2~5\ = CARRY((\G1|G2|Add1~8_combout\ & \G1|G2|vcount\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add1~8_combout\,
	datab => \G1|G2|vcount\(0),
	datad => VCC,
	combout => \G1|G2|Add2~4_combout\,
	cout => \G1|G2|Add2~5\);

-- Location: LCCOMB_X59_Y33_N12
\G1|G2|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~6_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add2~4_combout\ & (\G1|G2|LessThan2~1_combout\ $ (!\G1|G2|vcount\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~0_combout\,
	datab => \G1|G2|LessThan2~1_combout\,
	datac => \G1|G2|Add2~4_combout\,
	datad => \G1|G2|vcount\(8),
	combout => \G1|G2|Add2~6_combout\);

-- Location: LCCOMB_X60_Y33_N28
\G1|G2|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add1~10_combout\ = (\G1|G2|hcount\(9) & (\G1|G2|Add1~9\ & VCC)) # (!\G1|G2|hcount\(9) & (!\G1|G2|Add1~9\))
-- \G1|G2|Add1~11\ = CARRY((!\G1|G2|hcount\(9) & !\G1|G2|Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|hcount\(9),
	datad => VCC,
	cin => \G1|G2|Add1~9\,
	combout => \G1|G2|Add1~10_combout\,
	cout => \G1|G2|Add1~11\);

-- Location: LCCOMB_X60_Y33_N2
\G1|G2|Add2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~7_combout\ = (\G1|G2|Add0~0_combout\ & ((\G1|G2|Add1~10_combout\ & (\G1|G2|Add2~5\ & VCC)) # (!\G1|G2|Add1~10_combout\ & (!\G1|G2|Add2~5\)))) # (!\G1|G2|Add0~0_combout\ & ((\G1|G2|Add1~10_combout\ & (!\G1|G2|Add2~5\)) # 
-- (!\G1|G2|Add1~10_combout\ & ((\G1|G2|Add2~5\) # (GND)))))
-- \G1|G2|Add2~8\ = CARRY((\G1|G2|Add0~0_combout\ & (!\G1|G2|Add1~10_combout\ & !\G1|G2|Add2~5\)) # (!\G1|G2|Add0~0_combout\ & ((!\G1|G2|Add2~5\) # (!\G1|G2|Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add0~0_combout\,
	datab => \G1|G2|Add1~10_combout\,
	datad => VCC,
	cin => \G1|G2|Add2~5\,
	combout => \G1|G2|Add2~7_combout\,
	cout => \G1|G2|Add2~8\);

-- Location: LCCOMB_X59_Y33_N4
\G1|G2|Add2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~9_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add2~7_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~0_combout\,
	datab => \G1|G2|vcount\(8),
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|Add2~7_combout\,
	combout => \G1|G2|Add2~9_combout\);

-- Location: LCCOMB_X61_Y33_N10
\G1|G2|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add0~2_combout\ = (\G1|G2|vcount\(2) & (\G1|G2|Add0~1\ & VCC)) # (!\G1|G2|vcount\(2) & (!\G1|G2|Add0~1\))
-- \G1|G2|Add0~3\ = CARRY((!\G1|G2|vcount\(2) & !\G1|G2|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(2),
	datad => VCC,
	cin => \G1|G2|Add0~1\,
	combout => \G1|G2|Add0~2_combout\,
	cout => \G1|G2|Add0~3\);

-- Location: LCCOMB_X60_Y33_N4
\G1|G2|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~10_combout\ = ((\G1|G2|Add1~12_combout\ $ (\G1|G2|Add0~2_combout\ $ (\G1|G2|Add2~8\)))) # (GND)
-- \G1|G2|Add2~11\ = CARRY((\G1|G2|Add1~12_combout\ & (\G1|G2|Add0~2_combout\ & !\G1|G2|Add2~8\)) # (!\G1|G2|Add1~12_combout\ & ((\G1|G2|Add0~2_combout\) # (!\G1|G2|Add2~8\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add1~12_combout\,
	datab => \G1|G2|Add0~2_combout\,
	datad => VCC,
	cin => \G1|G2|Add2~8\,
	combout => \G1|G2|Add2~10_combout\,
	cout => \G1|G2|Add2~11\);

-- Location: LCCOMB_X59_Y33_N30
\G1|G2|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~12_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add2~10_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~0_combout\,
	datab => \G1|G2|vcount\(8),
	datac => \G1|G2|LessThan2~1_combout\,
	datad => \G1|G2|Add2~10_combout\,
	combout => \G1|G2|Add2~12_combout\);

-- Location: LCCOMB_X61_Y33_N12
\G1|G2|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add0~4_combout\ = (\G1|G2|vcount\(3) & ((GND) # (!\G1|G2|Add0~3\))) # (!\G1|G2|vcount\(3) & (\G1|G2|Add0~3\ $ (GND)))
-- \G1|G2|Add0~5\ = CARRY((\G1|G2|vcount\(3)) # (!\G1|G2|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \G1|G2|vcount\(3),
	datad => VCC,
	cin => \G1|G2|Add0~3\,
	combout => \G1|G2|Add0~4_combout\,
	cout => \G1|G2|Add0~5\);

-- Location: LCCOMB_X60_Y33_N6
\G1|G2|Add2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~13_combout\ = (\G1|G2|Add1~12_combout\ & ((\G1|G2|Add0~4_combout\ & (!\G1|G2|Add2~11\)) # (!\G1|G2|Add0~4_combout\ & ((\G1|G2|Add2~11\) # (GND))))) # (!\G1|G2|Add1~12_combout\ & ((\G1|G2|Add0~4_combout\ & (\G1|G2|Add2~11\ & VCC)) # 
-- (!\G1|G2|Add0~4_combout\ & (!\G1|G2|Add2~11\))))
-- \G1|G2|Add2~14\ = CARRY((\G1|G2|Add1~12_combout\ & ((!\G1|G2|Add2~11\) # (!\G1|G2|Add0~4_combout\))) # (!\G1|G2|Add1~12_combout\ & (!\G1|G2|Add0~4_combout\ & !\G1|G2|Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add1~12_combout\,
	datab => \G1|G2|Add0~4_combout\,
	datad => VCC,
	cin => \G1|G2|Add2~11\,
	combout => \G1|G2|Add2~13_combout\,
	cout => \G1|G2|Add2~14\);

-- Location: LCCOMB_X60_Y33_N16
\G1|G2|Add2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~15_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add2~13_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|LessThan2~1_combout\,
	datac => \G1|G2|vga_rgb~0_combout\,
	datad => \G1|G2|Add2~13_combout\,
	combout => \G1|G2|Add2~15_combout\);

-- Location: LCCOMB_X61_Y33_N14
\G1|G2|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add0~6_combout\ = (\G1|G2|vcount\(4) & (!\G1|G2|Add0~5\)) # (!\G1|G2|vcount\(4) & ((\G1|G2|Add0~5\) # (GND)))
-- \G1|G2|Add0~7\ = CARRY((!\G1|G2|Add0~5\) # (!\G1|G2|vcount\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(4),
	datad => VCC,
	cin => \G1|G2|Add0~5\,
	combout => \G1|G2|Add0~6_combout\,
	cout => \G1|G2|Add0~7\);

-- Location: LCCOMB_X60_Y33_N8
\G1|G2|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~16_combout\ = ((\G1|G2|Add1~12_combout\ $ (\G1|G2|Add0~6_combout\ $ (\G1|G2|Add2~14\)))) # (GND)
-- \G1|G2|Add2~17\ = CARRY((\G1|G2|Add1~12_combout\ & (\G1|G2|Add0~6_combout\ & !\G1|G2|Add2~14\)) # (!\G1|G2|Add1~12_combout\ & ((\G1|G2|Add0~6_combout\) # (!\G1|G2|Add2~14\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add1~12_combout\,
	datab => \G1|G2|Add0~6_combout\,
	datad => VCC,
	cin => \G1|G2|Add2~14\,
	combout => \G1|G2|Add2~16_combout\,
	cout => \G1|G2|Add2~17\);

-- Location: LCCOMB_X59_Y33_N24
\G1|G2|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~18_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add2~16_combout\ & (\G1|G2|LessThan2~1_combout\ $ (!\G1|G2|vcount\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~0_combout\,
	datab => \G1|G2|LessThan2~1_combout\,
	datac => \G1|G2|Add2~16_combout\,
	datad => \G1|G2|vcount\(8),
	combout => \G1|G2|Add2~18_combout\);

-- Location: M9K_X51_Y24_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a8\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a8_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X61_Y33_N26
\G1|G2|Add2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~23_combout\ = (\G1|G2|Add2~19_combout\ & (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add2~19_combout\,
	datab => \G1|G2|vcount\(8),
	datac => \G1|G2|vga_rgb~0_combout\,
	datad => \G1|G2|LessThan2~1_combout\,
	combout => \G1|G2|Add2~23_combout\);

-- Location: FF_X61_Y33_N27
\G1|G0|altsyncram_component|auto_generated|address_reg_b[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|Add2~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G0|altsyncram_component|auto_generated|address_reg_b\(0));

-- Location: LCCOMB_X58_Y33_N18
\G1|G0|altsyncram_component|auto_generated|out_address_reg_b[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[0]~feeder_combout\ = \G1|G0|altsyncram_component|auto_generated|address_reg_b\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G0|altsyncram_component|auto_generated|address_reg_b\(0),
	combout => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[0]~feeder_combout\);

-- Location: FF_X58_Y33_N19
\G1|G0|altsyncram_component|auto_generated|out_address_reg_b[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0));

-- Location: M9K_X64_Y29_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y27_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a16\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a16_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y31_N0
\G1|G0|altsyncram_component|auto_generated|mux5|_~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~2_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)) # 
-- ((\G1|G0|altsyncram_component|auto_generated|ram_block1a16~PORTBDATAOUT0\)))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a0~PORTBDATAOUT0\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a0~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a16~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~2_combout\);

-- Location: LCCOMB_X60_Y31_N2
\G1|G0|altsyncram_component|auto_generated|mux5|_~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~3_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~2_combout\ & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a24~PORTBDATAOUT0\)) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~2_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a8~PORTBDATAOUT0\))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((\G1|G0|altsyncram_component|auto_generated|mux5|_~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|ram_block1a24~PORTBDATAOUT0\,
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a8~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datad => \G1|G0|altsyncram_component|auto_generated|mux5|_~2_combout\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~3_combout\);

-- Location: LCCOMB_X60_Y33_N30
\G1|G2|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add1~12_combout\ = !\G1|G2|Add1~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \G1|G2|Add1~11\,
	combout => \G1|G2|Add1~12_combout\);

-- Location: LCCOMB_X61_Y33_N16
\G1|G2|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add0~8_combout\ = (\G1|G2|vcount\(5) & ((GND) # (!\G1|G2|Add0~7\))) # (!\G1|G2|vcount\(5) & (\G1|G2|Add0~7\ $ (GND)))
-- \G1|G2|Add0~9\ = CARRY((\G1|G2|vcount\(5)) # (!\G1|G2|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(5),
	datad => VCC,
	cin => \G1|G2|Add0~7\,
	combout => \G1|G2|Add0~8_combout\,
	cout => \G1|G2|Add0~9\);

-- Location: LCCOMB_X60_Y33_N12
\G1|G2|Add2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~21_combout\ = ((\G1|G2|Add1~12_combout\ $ (\G1|G2|Add0~10_combout\ $ (\G1|G2|Add2~20\)))) # (GND)
-- \G1|G2|Add2~22\ = CARRY((\G1|G2|Add1~12_combout\ & (\G1|G2|Add0~10_combout\ & !\G1|G2|Add2~20\)) # (!\G1|G2|Add1~12_combout\ & ((\G1|G2|Add0~10_combout\) # (!\G1|G2|Add2~20\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add1~12_combout\,
	datab => \G1|G2|Add0~10_combout\,
	datad => VCC,
	cin => \G1|G2|Add2~20\,
	combout => \G1|G2|Add2~21_combout\,
	cout => \G1|G2|Add2~22\);

-- Location: LCCOMB_X60_Y33_N14
\G1|G2|Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~24_combout\ = \G1|G2|Add0~12_combout\ $ (\G1|G2|Add2~22\ $ (!\G1|G2|Add1~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|Add0~12_combout\,
	datad => \G1|G2|Add1~12_combout\,
	cin => \G1|G2|Add2~22\,
	combout => \G1|G2|Add2~24_combout\);

-- Location: LCCOMB_X59_Y33_N26
\G1|G2|Add2~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~27_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add2~24_combout\ & (\G1|G2|LessThan2~1_combout\ $ (!\G1|G2|vcount\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~0_combout\,
	datab => \G1|G2|LessThan2~1_combout\,
	datac => \G1|G2|Add2~24_combout\,
	datad => \G1|G2|vcount\(8),
	combout => \G1|G2|Add2~27_combout\);

-- Location: FF_X59_Y33_N27
\G1|G0|altsyncram_component|auto_generated|address_reg_b[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|Add2~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G0|altsyncram_component|auto_generated|address_reg_b\(2));

-- Location: FF_X59_Y33_N19
\G1|G0|altsyncram_component|auto_generated|out_address_reg_b[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	asdata => \G1|G0|altsyncram_component|auto_generated|address_reg_b\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2));

-- Location: M9K_X64_Y25_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a48\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a48_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y24_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a32\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a32_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y23_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a40\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a40_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y31_N8
\G1|G0|altsyncram_component|auto_generated|mux5|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~0_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a40~PORTBDATAOUT0\))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a32~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a32~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a40~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~0_combout\);

-- Location: M9K_X64_Y27_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a56\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a56_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y31_N10
\G1|G0|altsyncram_component|auto_generated|mux5|_~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~1_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~0_combout\ & 
-- ((\G1|G0|altsyncram_component|auto_generated|ram_block1a56~PORTBDATAOUT0\))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~0_combout\ & (\G1|G0|altsyncram_component|auto_generated|ram_block1a48~PORTBDATAOUT0\)))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (((\G1|G0|altsyncram_component|auto_generated|mux5|_~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a48~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|mux5|_~0_combout\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a56~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~1_combout\);

-- Location: LCCOMB_X60_Y31_N20
\G1|G2|vga_blue[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[0]~0_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~1_combout\))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~1_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~3_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datad => \G1|G0|altsyncram_component|auto_generated|mux5|_~1_combout\,
	combout => \G1|G2|vga_blue[0]~0_combout\);

-- Location: M9K_X51_Y26_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a1\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

-- Location: M9K_X37_Y29_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a17\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a17_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N16
\G1|G0|altsyncram_component|auto_generated|mux5|_~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~6_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a17~PORTBDATAOUT0\) # 
-- (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a1~PORTBDATAOUT0\ & 
-- ((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a1~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a17~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~6_combout\);

-- Location: M9K_X37_Y30_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a9\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N26
\G1|G0|altsyncram_component|auto_generated|mux5|_~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~7_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~6_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a25~PORTBDATAOUT0\) # 
-- ((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~6_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a9~PORTBDATAOUT0\ & 
-- \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|ram_block1a25~PORTBDATAOUT0\,
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~6_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a9~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~7_combout\);

-- Location: M9K_X51_Y27_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a33\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a33_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y33_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a41\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a41_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N0
\G1|G0|altsyncram_component|auto_generated|mux5|_~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~4_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a41~PORTBDATAOUT0\))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a33~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a33~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a41~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~4_combout\);

-- Location: M9K_X37_Y33_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a57\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a57_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y31_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a49\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a49_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N14
\G1|G0|altsyncram_component|auto_generated|mux5|_~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~5_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~4_combout\ & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a57~PORTBDATAOUT0\)) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~4_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a49~PORTBDATAOUT0\))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~4_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a57~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a49~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~5_combout\);

-- Location: LCCOMB_X52_Y31_N20
\G1|G2|vga_blue[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[1]~1_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~5_combout\))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~7_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datac => \G1|G0|altsyncram_component|auto_generated|mux5|_~5_combout\,
	datad => \G1|G2|vga_rgb~1_combout\,
	combout => \G1|G2|vga_blue[1]~1_combout\);

-- Location: M9K_X78_Y33_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a58\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a58_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X61_Y33_N4
\G1|G2|Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|Add2~26_combout\ = (\G1|G2|vga_rgb~0_combout\ & (\G1|G2|Add2~21_combout\ & (\G1|G2|vcount\(8) $ (!\G1|G2|LessThan2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vcount\(8),
	datab => \G1|G2|LessThan2~1_combout\,
	datac => \G1|G2|vga_rgb~0_combout\,
	datad => \G1|G2|Add2~21_combout\,
	combout => \G1|G2|Add2~26_combout\);

-- Location: FF_X61_Y33_N5
\G1|G0|altsyncram_component|auto_generated|address_reg_b[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G2|Add2~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G0|altsyncram_component|auto_generated|address_reg_b\(1));

-- Location: LCCOMB_X58_Y33_N0
\G1|G0|altsyncram_component|auto_generated|out_address_reg_b[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[1]~feeder_combout\ = \G1|G0|altsyncram_component|auto_generated|address_reg_b\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \G1|G0|altsyncram_component|auto_generated|address_reg_b\(1),
	combout => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[1]~feeder_combout\);

-- Location: FF_X58_Y33_N1
\G1|G0|altsyncram_component|auto_generated|out_address_reg_b[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_25~clkctrl_outclk\,
	d => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1));

-- Location: M9K_X78_Y35_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a50\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a50_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N22
\G1|G0|altsyncram_component|auto_generated|mux5|_~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~9_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~8_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a58~PORTBDATAOUT0\) # 
-- ((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~8_combout\ & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & 
-- \G1|G0|altsyncram_component|auto_generated|ram_block1a50~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~8_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a58~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a50~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~9_combout\);

-- Location: M9K_X51_Y35_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a18\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a18_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y39_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N0
\G1|G0|altsyncram_component|auto_generated|mux5|_~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~10_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a18~PORTBDATAOUT0\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a2~PORTBDATAOUT0\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a18~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a2~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~10_combout\);

-- Location: M9K_X51_Y25_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a10\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N18
\G1|G0|altsyncram_component|auto_generated|mux5|_~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~11_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~10_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a26~PORTBDATAOUT0\) # 
-- ((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~10_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a10~PORTBDATAOUT0\ & 
-- \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|ram_block1a26~PORTBDATAOUT0\,
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~10_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a10~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~11_combout\);

-- Location: LCCOMB_X59_Y35_N20
\G1|G2|vga_blue[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[2]~2_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~9_combout\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~1_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datac => \G1|G0|altsyncram_component|auto_generated|mux5|_~9_combout\,
	datad => \G1|G0|altsyncram_component|auto_generated|mux5|_~11_combout\,
	combout => \G1|G2|vga_blue[2]~2_combout\);

-- Location: M9K_X51_Y31_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a51\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a51_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y20_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a59\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a59_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N10
\G1|G0|altsyncram_component|auto_generated|mux5|_~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~13_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~12_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a59~PORTBDATAOUT0\) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~12_combout\ & (\G1|G0|altsyncram_component|auto_generated|ram_block1a51~PORTBDATAOUT0\ & 
-- ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~12_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a51~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a59~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~13_combout\);

-- Location: M9K_X64_Y35_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a11\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a11_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y26_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a27\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a27_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N22
\G1|G0|altsyncram_component|auto_generated|mux5|_~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~15_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~14_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a27~PORTBDATAOUT0\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~14_combout\ & (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a11~PORTBDATAOUT0\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~14_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a11~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a27~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~15_combout\);

-- Location: LCCOMB_X52_Y31_N24
\G1|G2|vga_blue[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[3]~3_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~13_combout\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~15_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~13_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datac => \G1|G0|altsyncram_component|auto_generated|mux5|_~15_combout\,
	datad => \G1|G2|vga_rgb~1_combout\,
	combout => \G1|G2|vga_blue[3]~3_combout\);

-- Location: M9K_X51_Y29_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a52\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a52_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y32_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a60\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a60_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y32_N24
\G1|G0|altsyncram_component|auto_generated|mux5|_~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~17_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~16_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a60~PORTBDATAOUT0\) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~16_combout\ & (\G1|G0|altsyncram_component|auto_generated|ram_block1a52~PORTBDATAOUT0\ & 
-- (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~16_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a52~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a60~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~17_combout\);

-- Location: M9K_X37_Y28_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a12\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a12_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y38_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a28\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a28_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y31_N16
\G1|G0|altsyncram_component|auto_generated|mux5|_~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~19_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~18_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a28~PORTBDATAOUT0\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~18_combout\ & (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a12~PORTBDATAOUT0\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~18_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a12~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a28~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~19_combout\);

-- Location: LCCOMB_X60_Y31_N26
\G1|G2|vga_blue[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[4]~4_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~17_combout\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~1_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~17_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datad => \G1|G0|altsyncram_component|auto_generated|mux5|_~19_combout\,
	combout => \G1|G2|vga_blue[4]~4_combout\);

-- Location: M9K_X51_Y34_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a61\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a61_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y21_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a53\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a53_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y33_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a45\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a45_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y40_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a37\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a37_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N26
\G1|G0|altsyncram_component|auto_generated|mux5|_~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~20_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a45~PORTBDATAOUT0\) # 
-- ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & 
-- \G1|G0|altsyncram_component|auto_generated|ram_block1a37~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a45~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a37~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~20_combout\);

-- Location: LCCOMB_X52_Y31_N30
\G1|G0|altsyncram_component|auto_generated|mux5|_~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~21_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~20_combout\ & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a61~PORTBDATAOUT0\)) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~20_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a53~PORTBDATAOUT0\))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (((\G1|G0|altsyncram_component|auto_generated|mux5|_~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a61~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a53~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|mux5|_~20_combout\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~21_combout\);

-- Location: M9K_X51_Y30_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a21\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a21_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y39_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a5\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N28
\G1|G0|altsyncram_component|auto_generated|mux5|_~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~22_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)) # 
-- ((\G1|G0|altsyncram_component|auto_generated|ram_block1a21~PORTBDATAOUT0\)))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & 
-- ((\G1|G0|altsyncram_component|auto_generated|ram_block1a5~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a21~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a5~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~22_combout\);

-- Location: M9K_X37_Y37_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a29\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a29_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X52_Y31_N18
\G1|G0|altsyncram_component|auto_generated|mux5|_~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~23_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~22_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a29~PORTBDATAOUT0\) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~22_combout\ & (\G1|G0|altsyncram_component|auto_generated|ram_block1a13~PORTBDATAOUT0\ & 
-- ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|ram_block1a13~PORTBDATAOUT0\,
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~22_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a29~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~23_combout\);

-- Location: LCCOMB_X52_Y31_N8
\G1|G2|vga_blue[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[5]~5_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~21_combout\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~23_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~21_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datac => \G1|G0|altsyncram_component|auto_generated|mux5|_~23_combout\,
	datad => \G1|G2|vga_rgb~1_combout\,
	combout => \G1|G2|vga_blue[5]~5_combout\);

-- Location: M9K_X64_Y36_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a22\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode854w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a22_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y37_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode827w\(3),
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N24
\G1|G0|altsyncram_component|auto_generated|mux5|_~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~26_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a22~PORTBDATAOUT0\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a6~PORTBDATAOUT0\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a22~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a6~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~26_combout\);

-- Location: M9K_X37_Y35_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a14\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a14_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N2
\G1|G0|altsyncram_component|auto_generated|mux5|_~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~27_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~26_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a30~PORTBDATAOUT0\) # 
-- ((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~26_combout\ & (((\G1|G0|altsyncram_component|auto_generated|ram_block1a14~PORTBDATAOUT0\ & 
-- \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|ram_block1a30~PORTBDATAOUT0\,
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~26_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a14~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~27_combout\);

-- Location: M9K_X78_Y38_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a38\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a38_PORTBDATAOUT_bus\);

-- Location: M9K_X51_Y38_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a46\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a46_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N8
\G1|G0|altsyncram_component|auto_generated|mux5|_~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~24_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1)) # 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a46~PORTBDATAOUT0\)))) # (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a38~PORTBDATAOUT0\ & 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a38~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a46~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~24_combout\);

-- Location: M9K_X37_Y34_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a62\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a62_PORTBDATAOUT_bus\);

-- Location: M9K_X78_Y36_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a54\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a54_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X59_Y35_N10
\G1|G0|altsyncram_component|auto_generated|mux5|_~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~25_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~24_combout\ & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a62~PORTBDATAOUT0\)) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~24_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a54~PORTBDATAOUT0\))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~24_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a62~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a54~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~25_combout\);

-- Location: LCCOMB_X59_Y35_N4
\G1|G2|vga_blue[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[6]~6_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~25_combout\))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G2|vga_rgb~1_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~27_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datad => \G1|G0|altsyncram_component|auto_generated|mux5|_~25_combout\,
	combout => \G1|G2|vga_blue[6]~6_combout\);

-- Location: M9K_X64_Y20_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a63\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode904w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a63_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y21_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a47\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode884w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a47_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y30_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a39\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode874w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a39_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y31_N4
\G1|G0|altsyncram_component|auto_generated|mux5|_~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~28_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & (\G1|G0|altsyncram_component|auto_generated|ram_block1a47~PORTBDATAOUT0\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a39~PORTBDATAOUT0\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datac => \G1|G0|altsyncram_component|auto_generated|ram_block1a47~PORTBDATAOUT0\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a39~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~28_combout\);

-- Location: M9K_X64_Y22_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a55\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode894w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a55_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y31_N18
\G1|G0|altsyncram_component|auto_generated|mux5|_~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~29_combout\ = (\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~28_combout\ & 
-- (\G1|G0|altsyncram_component|auto_generated|ram_block1a63~PORTBDATAOUT0\)) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~28_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a55~PORTBDATAOUT0\))))) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1) & (((\G1|G0|altsyncram_component|auto_generated|mux5|_~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(1),
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a63~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|mux5|_~28_combout\,
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a55~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~29_combout\);

-- Location: M9K_X51_Y32_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a31\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode864w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a31_PORTBDATAOUT_bus\);

-- Location: M9K_X64_Y28_N0
\G1|G0|altsyncram_component|auto_generated|ram_block1a15\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "hdr_datapath:G1|ram_image:G0|altsyncram:altsyncram_component|altsyncram_a5n3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 65536,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "old_data",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 13,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock0",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 8191,
	port_b_logical_ram_depth => 65536,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "old_data",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \G1|G0|altsyncram_component|auto_generated|decode2|w_anode844w[3]~0_combout\,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clock_25~clkctrl_outclk\,
	portadatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portbdatain => \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBDATAIN_bus\,
	portaaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portbaddr => \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\,
	portbdataout => \G1|G0|altsyncram_component|auto_generated|ram_block1a15_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X60_Y31_N30
\G1|G0|altsyncram_component|auto_generated|mux5|_~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G0|altsyncram_component|auto_generated|mux5|_~31_combout\ = (\G1|G0|altsyncram_component|auto_generated|mux5|_~30_combout\ & ((\G1|G0|altsyncram_component|auto_generated|ram_block1a31~PORTBDATAOUT0\) # 
-- ((!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0))))) # (!\G1|G0|altsyncram_component|auto_generated|mux5|_~30_combout\ & (((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0) & 
-- \G1|G0|altsyncram_component|auto_generated|ram_block1a15~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|mux5|_~30_combout\,
	datab => \G1|G0|altsyncram_component|auto_generated|ram_block1a31~PORTBDATAOUT0\,
	datac => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(0),
	datad => \G1|G0|altsyncram_component|auto_generated|ram_block1a15~PORTBDATAOUT0\,
	combout => \G1|G0|altsyncram_component|auto_generated|mux5|_~31_combout\);

-- Location: LCCOMB_X60_Y31_N24
\G1|G2|vga_blue[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G2|vga_blue[7]~7_combout\ = (\G1|G2|vga_rgb~1_combout\ & ((\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & (\G1|G0|altsyncram_component|auto_generated|mux5|_~29_combout\)) # 
-- (!\G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2) & ((\G1|G0|altsyncram_component|auto_generated|mux5|_~31_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G0|altsyncram_component|auto_generated|out_address_reg_b\(2),
	datab => \G1|G0|altsyncram_component|auto_generated|mux5|_~29_combout\,
	datac => \G1|G0|altsyncram_component|auto_generated|mux5|_~31_combout\,
	datad => \G1|G2|vga_rgb~1_combout\,
	combout => \G1|G2|vga_blue[7]~7_combout\);

-- Location: LCCOMB_X90_Y39_N0
\G1|G3|G0|I2C_Controller_inst|SCLK_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SCLK_out~2_combout\ = (!\G1|G3|G0|mI2C_CLK_DIV\(3) & (!\G1|G3|G0|mI2C_CLK_DIV\(4) & !\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|mI2C_CLK_DIV\(3),
	datab => \G1|G3|G0|mI2C_CLK_DIV\(4),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	combout => \G1|G3|G0|I2C_Controller_inst|SCLK_out~2_combout\);

-- Location: LCCOMB_X89_Y39_N0
\G1|G3|G0|I2C_Controller_inst|SCLK_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SCLK_out~0_combout\ = (((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	combout => \G1|G3|G0|I2C_Controller_inst|SCLK_out~0_combout\);

-- Location: LCCOMB_X89_Y39_N22
\G1|G3|G0|I2C_Controller_inst|SCLK_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|SCLK_out~1_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & (((\G1|G3|G0|I2C_Controller_inst|SCLK_out~0_combout\)))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2)) 
-- # ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	datad => \G1|G3|G0|I2C_Controller_inst|SCLK_out~0_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|SCLK_out~1_combout\);

-- Location: LCCOMB_X92_Y39_N28
\G1|G3|G0|I2C_Controller_inst|Mux0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & ((\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2)))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4) & 
-- (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2) & \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(4),
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(3),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\);

-- Location: LCCOMB_X92_Y39_N0
\G1|G3|G0|I2C_Controller_inst|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux0~3_combout\ = (\G1|G3|G0|I2C_Controller_inst|SCLK~q\ & (((!\G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(2),
	datab => \G1|G3|G0|I2C_Controller_inst|SCLK~q\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(1),
	datad => \G1|G3|G0|I2C_Controller_inst|Mux0~6_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux0~3_combout\);

-- Location: LCCOMB_X91_Y39_N20
\G1|G3|G0|I2C_Controller_inst|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux0~2_combout\ = (\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & ((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5)))) # (!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0) & (\G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\ & 
-- \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(0),
	datab => \G1|G3|G0|I2C_Controller_inst|SD[12]~0_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	combout => \G1|G3|G0|I2C_Controller_inst|Mux0~2_combout\);

-- Location: LCCOMB_X92_Y39_N24
\G1|G3|G0|I2C_Controller_inst|Mux0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|Mux0~5_combout\ = (\G1|G3|G0|I2C_Controller_inst|Mux0~2_combout\ & ((\G1|G3|G0|I2C_Controller_inst|Mux0~3_combout\) # ((\G1|G3|G0|I2C_Controller_inst|Mux0~4_combout\ & \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5))))) # 
-- (!\G1|G3|G0|I2C_Controller_inst|Mux0~2_combout\ & (\G1|G3|G0|I2C_Controller_inst|Mux0~4_combout\ & ((!\G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \G1|G3|G0|I2C_Controller_inst|Mux0~4_combout\,
	datab => \G1|G3|G0|I2C_Controller_inst|Mux0~3_combout\,
	datac => \G1|G3|G0|I2C_Controller_inst|SD_COUNTER\(5),
	datad => \G1|G3|G0|I2C_Controller_inst|Mux0~2_combout\,
	combout => \G1|G3|G0|I2C_Controller_inst|Mux0~5_combout\);

-- Location: FF_X92_Y39_N25
\G1|G3|G0|I2C_Controller_inst|SCLK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \G1|G3|G0|I2C_Controller_inst|Mux0~5_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \G1|G3|G0|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|G3|G0|I2C_Controller_inst|SCLK~q\);

-- Location: LCCOMB_X89_Y39_N16
\G1|G3|G0|I2C_Controller_inst|I2C_SCLK\ : cycloneive_lcell_comb
-- Equation(s):
-- \G1|G3|G0|I2C_Controller_inst|I2C_SCLK~combout\ = ((\G1|G3|G0|I2C_Controller_inst|SCLK_out~2_combout\ & \G1|G3|G0|I2C_Controller_inst|SCLK_out~1_combout\)) # (!\G1|G3|G0|I2C_Controller_inst|SCLK~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \G1|G3|G0|I2C_Controller_inst|SCLK_out~2_combout\,
	datac => \G1|G3|G0|I2C_Controller_inst|SCLK_out~1_combout\,
	datad => \G1|G3|G0|I2C_Controller_inst|SCLK~q\,
	combout => \G1|G3|G0|I2C_Controller_inst|I2C_SCLK~combout\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: IOIBUF_X107_Y0_N1
\CMOS_DATA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(0),
	o => \CMOS_DATA[0]~input_o\);

-- Location: IOIBUF_X60_Y0_N22
\CMOS_DATA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_DATA(1),
	o => \CMOS_DATA[1]~input_o\);

-- Location: IOIBUF_X94_Y0_N8
\CMOS_PIXCLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMOS_PIXCLK,
	o => \CMOS_PIXCLK~input_o\);

-- Location: IOIBUF_X0_Y13_N1
\DRAM_DQ[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(0),
	o => \DRAM_DQ[0]~input_o\);

-- Location: IOIBUF_X0_Y26_N15
\DRAM_DQ[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(1),
	o => \DRAM_DQ[1]~input_o\);

-- Location: IOIBUF_X0_Y29_N15
\DRAM_DQ[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(2),
	o => \DRAM_DQ[2]~input_o\);

-- Location: IOIBUF_X0_Y25_N15
\DRAM_DQ[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(3),
	o => \DRAM_DQ[3]~input_o\);

-- Location: IOIBUF_X0_Y29_N22
\DRAM_DQ[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(4),
	o => \DRAM_DQ[4]~input_o\);

-- Location: IOIBUF_X0_Y28_N15
\DRAM_DQ[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(5),
	o => \DRAM_DQ[5]~input_o\);

-- Location: IOIBUF_X0_Y28_N22
\DRAM_DQ[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(6),
	o => \DRAM_DQ[6]~input_o\);

-- Location: IOIBUF_X0_Y34_N8
\DRAM_DQ[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(7),
	o => \DRAM_DQ[7]~input_o\);

-- Location: IOIBUF_X0_Y24_N15
\DRAM_DQ[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(8),
	o => \DRAM_DQ[8]~input_o\);

-- Location: IOIBUF_X0_Y24_N8
\DRAM_DQ[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(9),
	o => \DRAM_DQ[9]~input_o\);

-- Location: IOIBUF_X0_Y27_N22
\DRAM_DQ[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(10),
	o => \DRAM_DQ[10]~input_o\);

-- Location: IOIBUF_X0_Y19_N8
\DRAM_DQ[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(11),
	o => \DRAM_DQ[11]~input_o\);

-- Location: IOIBUF_X0_Y27_N15
\DRAM_DQ[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(12),
	o => \DRAM_DQ[12]~input_o\);

-- Location: IOIBUF_X0_Y23_N15
\DRAM_DQ[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(13),
	o => \DRAM_DQ[13]~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\DRAM_DQ[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(14),
	o => \DRAM_DQ[14]~input_o\);

-- Location: IOIBUF_X0_Y24_N22
\DRAM_DQ[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => DRAM_DQ(15),
	o => \DRAM_DQ[15]~input_o\);

-- Location: IOIBUF_X38_Y73_N15
\VGA_HS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => VGA_HS,
	o => \VGA_HS~input_o\);

-- Location: IOIBUF_X54_Y73_N1
\VGA_VS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => VGA_VS,
	o => \VGA_VS~input_o\);

ww_VGA_CLK <= \VGA_CLK~output_o\;

ww_VGA_BLANK_N <= \VGA_BLANK_N~output_o\;

ww_VGA_SYNC_N <= \VGA_SYNC_N~output_o\;

ww_VGA_R(0) <= \VGA_R[0]~output_o\;

ww_VGA_R(1) <= \VGA_R[1]~output_o\;

ww_VGA_R(2) <= \VGA_R[2]~output_o\;

ww_VGA_R(3) <= \VGA_R[3]~output_o\;

ww_VGA_R(4) <= \VGA_R[4]~output_o\;

ww_VGA_R(5) <= \VGA_R[5]~output_o\;

ww_VGA_R(6) <= \VGA_R[6]~output_o\;

ww_VGA_R(7) <= \VGA_R[7]~output_o\;

ww_VGA_G(0) <= \VGA_G[0]~output_o\;

ww_VGA_G(1) <= \VGA_G[1]~output_o\;

ww_VGA_G(2) <= \VGA_G[2]~output_o\;

ww_VGA_G(3) <= \VGA_G[3]~output_o\;

ww_VGA_G(4) <= \VGA_G[4]~output_o\;

ww_VGA_G(5) <= \VGA_G[5]~output_o\;

ww_VGA_G(6) <= \VGA_G[6]~output_o\;

ww_VGA_G(7) <= \VGA_G[7]~output_o\;

ww_VGA_B(0) <= \VGA_B[0]~output_o\;

ww_VGA_B(1) <= \VGA_B[1]~output_o\;

ww_VGA_B(2) <= \VGA_B[2]~output_o\;

ww_VGA_B(3) <= \VGA_B[3]~output_o\;

ww_VGA_B(4) <= \VGA_B[4]~output_o\;

ww_VGA_B(5) <= \VGA_B[5]~output_o\;

ww_VGA_B(6) <= \VGA_B[6]~output_o\;

ww_VGA_B(7) <= \VGA_B[7]~output_o\;

ww_CMOS_MCLK <= \CMOS_MCLK~output_o\;

ww_CMOS_SCLK <= \CMOS_SCLK~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;

ww_LEDG(5) <= \LEDG[5]~output_o\;

ww_LEDG(6) <= \LEDG[6]~output_o\;

ww_LEDG(7) <= \LEDG[7]~output_o\;

ww_DRAM_ADDR(0) <= \DRAM_ADDR[0]~output_o\;

ww_DRAM_ADDR(1) <= \DRAM_ADDR[1]~output_o\;

ww_DRAM_ADDR(2) <= \DRAM_ADDR[2]~output_o\;

ww_DRAM_ADDR(3) <= \DRAM_ADDR[3]~output_o\;

ww_DRAM_ADDR(4) <= \DRAM_ADDR[4]~output_o\;

ww_DRAM_ADDR(5) <= \DRAM_ADDR[5]~output_o\;

ww_DRAM_ADDR(6) <= \DRAM_ADDR[6]~output_o\;

ww_DRAM_ADDR(7) <= \DRAM_ADDR[7]~output_o\;

ww_DRAM_ADDR(8) <= \DRAM_ADDR[8]~output_o\;

ww_DRAM_ADDR(9) <= \DRAM_ADDR[9]~output_o\;

ww_DRAM_ADDR(10) <= \DRAM_ADDR[10]~output_o\;

ww_DRAM_ADDR(11) <= \DRAM_ADDR[11]~output_o\;

ww_DRAM_ADDR(12) <= \DRAM_ADDR[12]~output_o\;

ww_DRAM_WE_N <= \DRAM_WE_N~output_o\;

ww_DRAM_CAS_N <= \DRAM_CAS_N~output_o\;

ww_DRAM_RAS_N <= \DRAM_RAS_N~output_o\;

ww_DRAM_CS_N <= \DRAM_CS_N~output_o\;

ww_DRAM_CLK <= \DRAM_CLK~output_o\;

ww_DRAM_UDQM(0) <= \DRAM_UDQM[0]~output_o\;

ww_DRAM_UDQM(1) <= \DRAM_UDQM[1]~output_o\;

ww_DRAM_LDQM(0) <= \DRAM_LDQM[0]~output_o\;

ww_DRAM_LDQM(1) <= \DRAM_LDQM[1]~output_o\;

ww_DRAM_BA(0) <= \DRAM_BA[0]~output_o\;

ww_DRAM_BA(1) <= \DRAM_BA[1]~output_o\;

DRAM_DQ(0) <= \DRAM_DQ[0]~output_o\;

DRAM_DQ(1) <= \DRAM_DQ[1]~output_o\;

DRAM_DQ(2) <= \DRAM_DQ[2]~output_o\;

DRAM_DQ(3) <= \DRAM_DQ[3]~output_o\;

DRAM_DQ(4) <= \DRAM_DQ[4]~output_o\;

DRAM_DQ(5) <= \DRAM_DQ[5]~output_o\;

DRAM_DQ(6) <= \DRAM_DQ[6]~output_o\;

DRAM_DQ(7) <= \DRAM_DQ[7]~output_o\;

DRAM_DQ(8) <= \DRAM_DQ[8]~output_o\;

DRAM_DQ(9) <= \DRAM_DQ[9]~output_o\;

DRAM_DQ(10) <= \DRAM_DQ[10]~output_o\;

DRAM_DQ(11) <= \DRAM_DQ[11]~output_o\;

DRAM_DQ(12) <= \DRAM_DQ[12]~output_o\;

DRAM_DQ(13) <= \DRAM_DQ[13]~output_o\;

DRAM_DQ(14) <= \DRAM_DQ[14]~output_o\;

DRAM_DQ(15) <= \DRAM_DQ[15]~output_o\;

VGA_HS <= \VGA_HS~output_o\;

VGA_VS <= \VGA_VS~output_o\;

CMOS_SDAT <= \CMOS_SDAT~output_o\;
END structure;


