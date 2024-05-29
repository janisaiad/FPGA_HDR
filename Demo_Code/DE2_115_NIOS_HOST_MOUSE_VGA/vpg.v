// vpg.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module vpg (
		input  wire        avs_s1_clk_iCLK,         //              s1_clock.clk
		input  wire        avs_s1_reset_n_iRST_N,   //        s1_clock_reset.reset_n
		output wire [9:0]  avs_s1_export_VGA_R,     // global_signals_export.export
		output wire [9:0]  avs_s1_export_VGA_G,     //                      .export
		output wire [9:0]  avs_s1_export_VGA_B,     //                      .export
		output wire        avs_s1_export_VGA_HS,    //                      .export
		output wire        avs_s1_export_VGA_VS,    //                      .export
		output wire        avs_s1_export_VGA_SYNC,  //                      .export
		output wire        avs_s1_export_VGA_BLANK, //                      .export
		output wire        avs_s1_export_VGA_CLK,   //                      .export
		input  wire        avs_s1_export_iCLK_25,   //                      .export
		input  wire [15:0] avs_s1_writedata_iDATA,  //                    s1.writedata
		output wire [15:0] avs_s1_readdata_oDATA,   //                      .readdata
		input  wire [18:0] avs_s1_address_iADDR,    //                      .address
		input  wire        avs_s1_write_iWR,        //                      .write
		input  wire        avs_s1_read_iRD,         //                      .read
		input  wire        avs_s1_chipselect_iCS    //                      .chipselect
	);

	VGA_NIOS_CTRL #(
		.RAM_SIZE (307200)
	) vpg (
		.avs_s1_clk_iCLK         (avs_s1_clk_iCLK),         //              s1_clock.clk
		.avs_s1_reset_n_iRST_N   (avs_s1_reset_n_iRST_N),   //        s1_clock_reset.reset_n
		.avs_s1_export_VGA_R     (avs_s1_export_VGA_R),     // global_signals_export.export
		.avs_s1_export_VGA_G     (avs_s1_export_VGA_G),     //                      .export
		.avs_s1_export_VGA_B     (avs_s1_export_VGA_B),     //                      .export
		.avs_s1_export_VGA_HS    (avs_s1_export_VGA_HS),    //                      .export
		.avs_s1_export_VGA_VS    (avs_s1_export_VGA_VS),    //                      .export
		.avs_s1_export_VGA_SYNC  (avs_s1_export_VGA_SYNC),  //                      .export
		.avs_s1_export_VGA_BLANK (avs_s1_export_VGA_BLANK), //                      .export
		.avs_s1_export_VGA_CLK   (avs_s1_export_VGA_CLK),   //                      .export
		.avs_s1_export_iCLK_25   (avs_s1_export_iCLK_25),   //                      .export
		.avs_s1_writedata_iDATA  (avs_s1_writedata_iDATA),  //                    s1.writedata
		.avs_s1_readdata_oDATA   (avs_s1_readdata_oDATA),   //                      .readdata
		.avs_s1_address_iADDR    (avs_s1_address_iADDR),    //                      .address
		.avs_s1_write_iWR        (avs_s1_write_iWR),        //                      .write
		.avs_s1_read_iRD         (avs_s1_read_iRD),         //                      .read
		.avs_s1_chipselect_iCS   (avs_s1_chipselect_iCS)    //                      .chipselect
	);

endmodule
