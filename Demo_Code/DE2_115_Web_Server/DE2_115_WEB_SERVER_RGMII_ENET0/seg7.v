// seg7.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module seg7 (
		input  wire [2:0]  s_address,   //     avalon_slave.address
		input  wire        s_read,      //                 .read
		output wire [7:0]  s_readdata,  //                 .readdata
		input  wire        s_write,     //                 .write
		input  wire [7:0]  s_writedata, //                 .writedata
		output wire [63:0] SEG7,        //      conduit_end.export
		input  wire        s_clk,       //       clock_sink.clk
		input  wire        s_reset      // clock_sink_reset.reset
	);

	SEG7_IF #(
		.SEG7_NUM       (8),
		.ADDR_WIDTH     (3),
		.DEFAULT_ACTIVE (1),
		.LOW_ACTIVE     (1)
	) seg7_inst (
		.s_address   (s_address),   //     avalon_slave.address
		.s_read      (s_read),      //                 .read
		.s_readdata  (s_readdata),  //                 .readdata
		.s_write     (s_write),     //                 .write
		.s_writedata (s_writedata), //                 .writedata
		.SEG7        (SEG7),        //      conduit_end.export
		.s_clk       (s_clk),       //       clock_sink.clk
		.s_reset     (s_reset)      // clock_sink_reset.reset
	);

endmodule
