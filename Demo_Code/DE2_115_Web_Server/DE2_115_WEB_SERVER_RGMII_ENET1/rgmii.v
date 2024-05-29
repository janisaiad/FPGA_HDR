// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	Ethernet Card  
//
// --------------------------------------------------------------------
//
// Revision History : RGMII
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date  :| Changes Made:
//   V1.0 :| Peli Li           :| 2010/03/30 :| Initial Revision
// --------------------------------------------------------------------

module RGMII (

		//--- PHY Interface

		reset_rx_clk_n,
		phy_rx_clk,
		//phy_rx_col,
		//phy_rx_crs,
		phy_rx_ctl,
		phy_rx_d,
		//phy_rx_dv,
		//phy_rx_err,

		reset_tx_clk_n,
		tx_clk_ref125,		// 125MHz TX local reference clock
		tx_clk_phy125,		// 125MHz TX clock for RGMII
		tx_clk_mac,			// TX clock to use by the MAC
		tx_clk,				// 25MHz/2.5MHz TX clock from PHY,
		phy_gtx_clk,		// TX clock to PHY
		phy_tx_d,
		//phy_tx_en,
		//phy_tx_err,
		phy_tx_ctl,

		phy_mdio,
		//--- Local MII Interface

//		m_rx_col,
//		m_rx_crs,
//		m_rx_d,
//		m_rx_dv,
//		m_rx_err,
//
//		m_tx_d,
//		m_tx_en,
//		m_tx_err,

		//--- Local RGMII Interface

		rgm_rx_d,
		//rgm_rx_dv,
		//rgm_rx_err,
		rgm_rx_ctl,

		rgm_tx_d,
		//rgm_tx_en,
		//rgm_tx_err,
		rgm_tx_ctl,

		//--- 

		eth_mode,			//--- Mode select, from MAC configuration, 1 : Gigabit, 0 : 10/100
		ena_10,

		mdio_in,
		mdio_oen,
		mdio_out
	);

//=========================================================
//  PARAMETER declarations
//=========================================================

//=========================================================
//  PORT declarations
//=========================================================
//--- PHY Interface
input			reset_rx_clk_n;
input			phy_rx_clk;
//input			phy_rx_col;
//input			phy_rx_crs;
input	[3:0]	phy_rx_d;
//input			phy_rx_dv;
//input			phy_rx_err;
input			phy_rx_ctl;

input			reset_tx_clk_n;
input			tx_clk_ref125;
input			tx_clk_phy125;
output			tx_clk_mac;
input			tx_clk;
output			phy_gtx_clk;
output	[3:0]	phy_tx_d;
//output			phy_tx_en;
//output			phy_tx_err;
output			phy_tx_ctl;

inout			phy_mdio;

//--- Local MII Interface
//output			m_rx_col;
//output			m_rx_crs;
//output	[3:0]	m_rx_d;
//output			m_rx_dv;
//output			m_rx_err;
//
//input	[3:0]	m_tx_d;
//input			m_tx_en;
//input			m_tx_err;

//--- Local GMII Interface
output	[3:0]	rgm_rx_d;
//output			gm_rx_dv;
//output			gm_rx_err;
output			rgm_rx_ctl;

input	[3:0]	rgm_tx_d;
//input			rgm_tx_en;
//input			gm_tx_err;
input			rgm_tx_ctl;

//---
input			eth_mode;
input			ena_10;
output			mdio_in;
input			mdio_oen;
input			mdio_out;

//=========================================================
//  REG/WIRE declarations
//=========================================================
wire			tx_clk_int;

reg				mode_reg1;
reg				mode_reg2;

reg		[3:0]	rgm_rx_d_r;
//reg				gm_rx_dv_r;
//reg				gm_rx_err_r;
reg				rgm_rx_ctl_r;

reg				gtx_clk;

//=========================================================
//  Structural coding
//=========================================================

// mdio tristate
assign	mdio_in		= phy_mdio;
assign	phy_mdio	= mdio_oen ? 1'bz : mdio_out;

// PHY RX input
always @(negedge reset_rx_clk_n or posedge phy_rx_clk)
begin
	if (reset_rx_clk_n == 1'b0) begin
		rgm_rx_d_r	 <= 4'b0000;
		//rgm_rx_dv_r	 <= 1'b0;
		//rgm_rx_err_r <= 1'b0;
		rgm_rx_ctl_r <= 1'b0;
	end
	else begin
		rgm_rx_d_r	<= phy_rx_d;
		//rgm_rx_dv_r	<= phy_rx_dv;
		//gm_rx_err_r	<= phy_rx_err;
		rgm_rx_ctl_r  <= phy_rx_ctl; //equal to phy_rx_dv
	end
end

  // MII RX local interface
//assign	m_rx_col	= phy_rx_col;
//assign	m_rx_crs	= phy_rx_crs;
//assign	m_rx_d		= gm_rx_d_r[3:0];
//assign	m_rx_dv		= gm_rx_dv_r;
//assign	m_rx_err	= gm_rx_err_r;

  // MII RX local interface
assign	rgm_rx_d	= rgm_rx_d_r;
//assign	rgm_rx_dv	= gm_rx_dv_r;
//assign	rgm_rx_err	= gm_rx_err_r;
assign	rgm_rx_ctl	= rgm_rx_ctl_r;

// TX clock MUX
always @(negedge reset_tx_clk_n or posedge tx_clk_ref125)
begin
	if (reset_tx_clk_n == 1'b0) begin
		mode_reg1	<= 1'b0;
		mode_reg2	<= 1'b0;
	end
	else begin
		mode_reg1	<= eth_mode;
		mode_reg2	<= mode_reg1;
	end
end

//assign	tx_clk_int	= mode_reg2 ? tx_clk_ref125 : tx_clk;
//assign	tx_clk_mac	= tx_clk_int;
//
//assign	phy_tx_d	= mode_reg2 ? gm_tx_d	: {4'b0000,m_tx_d[3:0]};
//assign	phy_tx_en	= mode_reg2 ? gm_tx_en	: m_tx_en;
//assign	phy_tx_err	= mode_reg2 ? gm_tx_err	: m_tx_err;

assign	tx_clk_int	= mode_reg2 ? tx_clk_ref125 : tx_clk;
assign	tx_clk_mac	= tx_clk_int;

assign	phy_tx_d	= rgm_tx_d;
assign	phy_tx_ctl	= rgm_tx_ctl;//equal to TX_EN
//assign	phy_tx_err	= mode_reg2 ? gm_tx_err	: m_tx_err;


// GXT_CLk driver
ddr_o gen_gxt_clk
(
		.datain_h(1'b1),
		.datain_l(1'b0),
		.outclock(tx_clk_phy125),
		.dataout(phy_gtx_clk)
);

endmodule 