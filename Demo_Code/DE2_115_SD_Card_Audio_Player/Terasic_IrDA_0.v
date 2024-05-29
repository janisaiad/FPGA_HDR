// Terasic_IrDA_0.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module Terasic_IrDA_0 (
		input  wire        s_read,      //     avalon_slave.read
		input  wire        s_cs_n,      //                 .chipselect_n
		output wire [31:0] s_readdata,  //                 .readdata
		input  wire        s_write,     //                 .write
		input  wire [31:0] s_writedata, //                 .writedata
		input  wire        clk,         //       clock_sink.clk
		input  wire        reset_n,     // clock_sink_reset.reset_n
		input  wire        ir,          //      conduit_end.export
		output wire        irq          // interrupt_sender.irq
	);

	TERASIC_IRM terasic_irda_0 (
		.s_read      (s_read),      //     avalon_slave.read
		.s_cs_n      (s_cs_n),      //                 .chipselect_n
		.s_readdata  (s_readdata),  //                 .readdata
		.s_write     (s_write),     //                 .write
		.s_writedata (s_writedata), //                 .writedata
		.clk         (clk),         //       clock_sink.clk
		.reset_n     (reset_n),     // clock_sink_reset.reset_n
		.ir          (ir),          //      conduit_end.export
		.irq         (irq)          // interrupt_sender.irq
	);

endmodule
