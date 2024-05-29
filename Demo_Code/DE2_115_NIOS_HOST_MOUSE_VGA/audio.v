// audio.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module audio (
		input  wire [2:0]  avs_s1_address,       // avalon_slave.address
		input  wire        avs_s1_read,          //             .read
		output wire [15:0] avs_s1_readdata,      //             .readdata
		input  wire        avs_s1_write,         //             .write
		input  wire [15:0] avs_s1_writedata,     //             .writedata
		input  wire        avs_s1_clk,           //   clock_sink.clk
		input  wire        avs_s1_reset,         //             .reset
		output wire        avs_s1_export_XCK,    //  conduit_end.export
		input  wire        avs_s1_export_ADCDAT, //             .export
		input  wire        avs_s1_export_ADCLRC, //             .export
		output wire        avs_s1_export_DACDAT, //             .export
		input  wire        avs_s1_export_DACLRC, //             .export
		input  wire        avs_s1_export_BCLK    //             .export
	);

	AUDIO_IF audio (
		.avs_s1_address       (avs_s1_address),       // avalon_slave.address
		.avs_s1_read          (avs_s1_read),          //             .read
		.avs_s1_readdata      (avs_s1_readdata),      //             .readdata
		.avs_s1_write         (avs_s1_write),         //             .write
		.avs_s1_writedata     (avs_s1_writedata),     //             .writedata
		.avs_s1_clk           (avs_s1_clk),           //   clock_sink.clk
		.avs_s1_reset         (avs_s1_reset),         //             .reset
		.avs_s1_export_XCK    (avs_s1_export_XCK),    //  conduit_end.export
		.avs_s1_export_ADCDAT (avs_s1_export_ADCDAT), //             .export
		.avs_s1_export_ADCLRC (avs_s1_export_ADCLRC), //             .export
		.avs_s1_export_DACDAT (avs_s1_export_DACDAT), //             .export
		.avs_s1_export_DACLRC (avs_s1_export_DACLRC), //             .export
		.avs_s1_export_BCLK   (avs_s1_export_BCLK)    //             .export
	);

endmodule
