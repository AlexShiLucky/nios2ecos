// megafunction wizard: %ALTDDIO_OUT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altddio_out 

// ============================================================
// File Name: ddr_o.v
// Megafunction Name(s):
// 			altddio_out
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 7.1 Build 156 04/30/2007 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2007 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module ddr_o (
	datain_h,
	datain_l,
	outclock,
	dataout);

	input	  datain_h;
	input	  datain_l;
	input	  outclock;
	output	  dataout;

	wire [0:0] sub_wire0;
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  dataout = sub_wire1;
	wire  sub_wire2 = datain_h;
	wire  sub_wire3 = sub_wire2;
	wire  sub_wire4 = datain_l;
	wire  sub_wire5 = sub_wire4;

	altddio_out	altddio_out_component (
				.outclock (outclock),
				.datain_h (sub_wire3),
				.datain_l (sub_wire5),
				.dataout (sub_wire0),
				.aclr (1'b0),
				.aset (1'b0),
				.oe (1'b1),
				.oe_out (),
				.outclocken (1'b1),
				.sclr (1'b0),
				.sset (1'b0));
	defparam
		altddio_out_component.extend_oe_disable = "UNUSED",
		altddio_out_component.intended_device_family = "Cyclone II",
		altddio_out_component.invert_output = "OFF",
		altddio_out_component.lpm_type = "altddio_out",
		altddio_out_component.oe_reg = "UNUSED",
		altddio_out_component.power_up_high = "OFF",
		altddio_out_component.width = 1;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ARESET_MODE NUMERIC "2"
// Retrieval info: PRIVATE: CLKEN NUMERIC "0"
// Retrieval info: PRIVATE: EXTEND_OE_DISABLE NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: OE NUMERIC "0"
// Retrieval info: PRIVATE: OE_REG NUMERIC "0"
// Retrieval info: PRIVATE: POWER_UP_HIGH NUMERIC "0"
// Retrieval info: PRIVATE: SRESET_MODE NUMERIC "2"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WIDTH NUMERIC "1"
// Retrieval info: CONSTANT: EXTEND_OE_DISABLE STRING "UNUSED"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: INVERT_OUTPUT STRING "OFF"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altddio_out"
// Retrieval info: CONSTANT: OE_REG STRING "UNUSED"
// Retrieval info: CONSTANT: POWER_UP_HIGH STRING "OFF"
// Retrieval info: CONSTANT: WIDTH NUMERIC "1"
// Retrieval info: USED_PORT: datain_h 0 0 0 0 INPUT NODEFVAL datain_h
// Retrieval info: USED_PORT: datain_l 0 0 0 0 INPUT NODEFVAL datain_l
// Retrieval info: USED_PORT: dataout 0 0 0 0 OUTPUT NODEFVAL dataout
// Retrieval info: USED_PORT: outclock 0 0 0 0 INPUT_CLK_EXT NODEFVAL outclock
// Retrieval info: CONNECT: @datain_h 0 0 1 0 datain_h 0 0 0 0
// Retrieval info: CONNECT: @datain_l 0 0 1 0 datain_l 0 0 0 0
// Retrieval info: CONNECT: dataout 0 0 0 0 @dataout 0 0 1 0
// Retrieval info: CONNECT: @outclock 0 0 0 0 outclock 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_o.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_o.ppf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_o.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_o.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_o.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_o_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ddr_o_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
