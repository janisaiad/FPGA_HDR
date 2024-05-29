// sram.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module sram (
		input  wire        clk,            //       clock_reset.clk
		input  wire        reset_n,        // clock_reset_reset.reset_n
		input  wire        s_chipselect_n, //      avalon_slave.chipselect_n
		input  wire        s_write_n,      //                  .write_n
		input  wire [19:0] s_address,      //                  .address
		input  wire        s_read_n,       //                  .read_n
		input  wire [15:0] s_writedata,    //                  .writedata
		output wire [15:0] s_readdata,     //                  .readdata
		input  wire [1:0]  s_byteenable_n, //                  .byteenable_n
		inout  wire [15:0] SRAM_DQ,        //       conduit_end.export
		output wire [19:0] SRAM_ADDR,      //                  .export
		output wire        SRAM_UB_n,      //                  .export
		output wire        SRAM_LB_n,      //                  .export
		output wire        SRAM_WE_n,      //                  .export
		output wire        SRAM_CE_n,      //                  .export
		output wire        SRAM_OE_n       //                  .export
	);

	TERASIC_SRAM #(
		.DATA_BITS (16),
		.ADDR_BITS (20)
	) sram (
		.clk            (clk),            //       clock_reset.clk
		.reset_n        (reset_n),        // clock_reset_reset.reset_n
		.s_chipselect_n (s_chipselect_n), //      avalon_slave.chipselect_n
		.s_write_n      (s_write_n),      //                  .write_n
		.s_address      (s_address),      //                  .address
		.s_read_n       (s_read_n),       //                  .read_n
		.s_writedata    (s_writedata),    //                  .writedata
		.s_readdata     (s_readdata),     //                  .readdata
		.s_byteenable_n (s_byteenable_n), //                  .byteenable_n
		.SRAM_DQ        (SRAM_DQ),        //       conduit_end.export
		.SRAM_ADDR      (SRAM_ADDR),      //                  .export
		.SRAM_UB_n      (SRAM_UB_n),      //                  .export
		.SRAM_LB_n      (SRAM_LB_n),      //                  .export
		.SRAM_WE_n      (SRAM_WE_n),      //                  .export
		.SRAM_CE_n      (SRAM_CE_n),      //                  .export
		.SRAM_OE_n      (SRAM_OE_n)       //                  .export
	);

endmodule
