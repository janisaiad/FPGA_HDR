// vpg.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module vpg (
		input  wire       s_write,     //     avalon_slave.write
		input  wire [7:0] s_writedata, //                 .writedata
		input  wire       s_read,      //                 .read
		output wire [7:0] s_readdata,  //                 .readdata
		input  wire       s_cs_n,      //                 .chipselect_n
		input  wire       vga_clk,     //      conduit_end.export
		output wire       vga_hs,      //                 .export
		output wire       vga_vs,      //                 .export
		output wire       vga_de,      //                 .export
		output wire [7:0] vga_r,       //                 .export
		output wire [7:0] vga_g,       //                 .export
		output wire [7:0] vga_b,       //                 .export
		input  wire       clk,         //       clock_sink.clk
		input  wire       reset_n      // clock_sink_reset.reset_n
	);

	TERASIC_VPG #(
		.SYMBOLS_PER_BEAT (1),
		.BITS_PER_SYMBOL  (24),
		.READY_LATENCY    (0),
		.MAX_CHANNEL      (0),
		.H_DISP           (640),
		.H_FPORCH         (16),
		.H_SYNC           (96),
		.H_BPORCH         (48),
		.V_DISP           (480),
		.V_FPORCH         (10),
		.V_SYNC           (2),
		.V_BPORCH         (33)
	) vpg (
		.s_write     (s_write),     //     avalon_slave.write
		.s_writedata (s_writedata), //                 .writedata
		.s_read      (s_read),      //                 .read
		.s_readdata  (s_readdata),  //                 .readdata
		.s_cs_n      (s_cs_n),      //                 .chipselect_n
		.vga_clk     (vga_clk),     //      conduit_end.export
		.vga_hs      (vga_hs),      //                 .export
		.vga_vs      (vga_vs),      //                 .export
		.vga_de      (vga_de),      //                 .export
		.vga_r       (vga_r),       //                 .export
		.vga_g       (vga_g),       //                 .export
		.vga_b       (vga_b),       //                 .export
		.clk         (clk),         //       clock_sink.clk
		.reset_n     (reset_n)      // clock_sink_reset.reset_n
	);

endmodule
