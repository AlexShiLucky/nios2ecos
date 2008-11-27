//------------------------------------------------------------------------------
// This confidential and proprietary software may be used only as authorized by
// a licensing agreement from Altera Corporation.
//
// (c) COPYRIGHT 2007 ALTERA CORPORATION
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies and any
// such reproduction must be pursuant to a licensing agreement from Altera.
//
// Title        : Example top level testbench for ddr_sdram DDR/2/3 SDRAM High Performance Controller
// Project      : DDR/2/3 SDRAM High Performance Controller
//
// File         : ddr_sdram_example_top_tb.v
//
// Revision     : V8.0
//
// Abstract:
// Automatically generated testbench for the example top level design to allow
// functional and timing simulation.
//
//------------------------------------------------------------------------------
//
// *************** This is a MegaWizard generated file ****************
//
// If you need to edit this file make sure the edits are not inside any 'MEGAWIZARD'
// text insertion areas.
// (between "<< START MEGAWIZARD INSERT" and "<< END MEGAWIZARD INSERT" comments)
//
// Any edits inside these delimiters will be overwritten by the megawizard if you
// re-run it.
//
// If you really need to make changes inside these delimiters then delete
// both 'START' and 'END' delimiters.  This will stop the megawizard updating this
// section again.
//
//----------------------------------------------------------------------------------
// << START MEGAWIZARD INSERT PARAMETER_LIST
// Parameters:
//
// Device Family                      : cyclone iii
// local Interface Data Width         : 64
// MEM_CHIPSELS                       : 1
// MEM_BANK_BITS                      : 2
// MEM_ROW_BITS                       : 13
// MEM_COL_BITS                       : 9
// LOCAL_DATA_BITS                    : 64
// NUM_CLOCK_PAIRS                    : 1
// CLOCK_TICK_IN_PS                   : 7518
// REGISTERED_DIMM                    : false
// TINIT_CLOCKS                       : 13300
// Data_Width_Ratio		      : 4
// << END MEGAWIZARD INSERT PARAMETER_LIST
//----------------------------------------------------------------------------------
// << MEGAWIZARD PARSE FILE DDR8.0


`timescale 1 ps/1 ps



// << START MEGAWIZARD INSERT MODULE
module ddr_sdram_example_top_tb ();
// << END MEGAWIZARD INSERT MODULE

    // << START MEGAWIZARD INSERT PARAMS
    parameter gMEM_CHIPSELS     = 1;
    parameter gMEM_BANK_BITS    = 2;
    parameter gMEM_ROW_BITS     = 13;
    parameter gMEM_COL_BITS     = 9;
    parameter gMEM_DQ_PER_DQS   = 8;
    parameter DM_DQS_WIDTH	= 2;
    parameter gLOCAL_DATA_BITS  = 64;
    parameter gLOCAL_IF_DWIDTH_AFTER_ECC  = 64;
    parameter gNUM_CLOCK_PAIRS  = 1;
    parameter RTL_ROUNDTRIP_CLOCKS  = 0.0;
    parameter CLOCK_TICK_IN_PS  = 7518;
    parameter REGISTERED_DIMM   = 1'b0;
    parameter BOARD_DQS_DELAY   = 0;
    parameter BOARD_CLK_DELAY   = 0;
    parameter DWIDTH_RATIO      = 4;
    parameter TINIT_CLOCKS  = 13300;
    parameter REF_CLOCK_TICK_IN_PS  = 20000; 
    // << END MEGAWIZARD INSERT PARAMS

    // set to zero for Gatelevel
    parameter RTL_DELAYS = 1;
    parameter USE_GENERIC_MEMORY_MODEL  = 1'b0;

    // The round trip delay is now modeled inside the datapath (<your core name>_auk_ddr_dqs_group.v/vhd) for RTL simulation.
    parameter D90_DEG_DELAY = 0; //RTL only

    parameter GATE_BOARD_DQS_DELAY = BOARD_DQS_DELAY * (RTL_DELAYS ? 0 : 1); // Gate level timing only
    parameter GATE_BOARD_CLK_DELAY = BOARD_CLK_DELAY * (RTL_DELAYS ? 0 : 1); // Gate level timing only
    
    wire cmd_bus_watcher_enabled;
    reg clk;
    reg clk_n;
    reg reset_n;
    wire mem_reset_n;
    wire[gMEM_ROW_BITS - 1:0] a;
    wire[gMEM_BANK_BITS - 1:0] ba;
    wire[gMEM_CHIPSELS - 1:0] cs_n;
    wire[gMEM_CHIPSELS - 1:0] cke;
    wire[gMEM_CHIPSELS - 1:0] odt;       //DDR2 only
    wire ras_n;
    wire cas_n;
    wire we_n;
    wire[gLOCAL_DATA_BITS / DWIDTH_RATIO / gMEM_DQ_PER_DQS - 1:0] dm;
    //wire[gLOCAL_DATA_BITS / DWIDTH_RATIO / gMEM_DQ_PER_DQS - 1:0] dqs;
    //wire[gLOCAL_DATA_BITS / DWIDTH_RATIO / gMEM_DQ_PER_DQS - 1:0] dqs_n;

    //wire stratix_dqs_ref_clk;   // only used on stratix to provide external dll reference clock
    wire[gNUM_CLOCK_PAIRS - 1:0] clk_to_sdram;
    wire[gNUM_CLOCK_PAIRS - 1:0] clk_to_sdram_n;
    wire #(GATE_BOARD_CLK_DELAY * 1) clk_to_ram;
    wire clk_to_ram_n;
    wire[gMEM_ROW_BITS - 1:0] #(GATE_BOARD_CLK_DELAY * 1 + 1) a_delayed;
    wire[gMEM_BANK_BITS - 1:0] #(GATE_BOARD_CLK_DELAY * 1 + 1) ba_delayed;
    wire[gMEM_CHIPSELS - 1:0] #(GATE_BOARD_CLK_DELAY * 1 + 1) cke_delayed;
    wire[gMEM_CHIPSELS - 1:0] #(GATE_BOARD_CLK_DELAY * 1 + 1) odt_delayed;  //DDR2 only
    wire[gMEM_CHIPSELS - 1:0] #(GATE_BOARD_CLK_DELAY * 1 + 1) cs_n_delayed;
    wire #(GATE_BOARD_CLK_DELAY * 1 + 1) ras_n_delayed;
    wire #(GATE_BOARD_CLK_DELAY * 1 + 1) cas_n_delayed;
    wire #(GATE_BOARD_CLK_DELAY * 1 + 1) we_n_delayed;
    wire[gLOCAL_DATA_BITS / DWIDTH_RATIO / gMEM_DQ_PER_DQS - 1:0] #(GATE_BOARD_CLK_DELAY * 1 + 1) dm_delayed;

    // pulldown (dm);
    assign (weak1, weak0) dm = 0;

    tri [gLOCAL_DATA_BITS / DWIDTH_RATIO - 1:0] mem_dq = 100'bz;
    tri [gLOCAL_DATA_BITS / DWIDTH_RATIO / gMEM_DQ_PER_DQS - 1:0] mem_dqs = 100'bz;
    tri [gLOCAL_DATA_BITS / DWIDTH_RATIO / gMEM_DQ_PER_DQS - 1:0] mem_dqs_n = 100'bz;
	assign (weak1, weak0) mem_dq = 0;
	assign (weak1, weak0) mem_dqs = 0;
	assign (weak1, weak0) mem_dqs_n = 1;

    wire [gMEM_BANK_BITS - 1:0] zero_one; //"01";
    assign zero_one = 1;
    
    wire test_complete;
    // counter to count the number of sucessful read and write loops
    integer test_complete_count;
    wire pnf;
    wire [gLOCAL_IF_DWIDTH_AFTER_ECC / 8 - 1:0] pnf_per_byte;


    assign cmd_bus_watcher_enabled = 1'b0;

   	// ddr sdram interface

    // << START MEGAWIZARD INSERT ENTITY
    ddr_sdram_example_top dut (
    // << END MEGAWIZARD INSERT ENTITY
        .clock_source(clk),
        .global_reset_n(reset_n),

        // << START MEGAWIZARD INSERT PORT_MAP
        .mem_clk(clk_to_sdram),
        .mem_clk_n(clk_to_sdram_n),

        .mem_cke(cke),
        .mem_cs_n(cs_n),
        .mem_ras_n(ras_n),
        .mem_cas_n(cas_n),
        .mem_we_n(we_n),
        .mem_ba(ba),
        .mem_addr(a),
        .mem_dq(mem_dq),
        .mem_dqs(mem_dqs),
        .mem_dm(dm),

        // << END MEGAWIZARD INSERT PORT_MAP

        .test_complete(test_complete),
        .pnf_per_byte(pnf_per_byte),
        .pnf(pnf)
    );


    // << START MEGAWIZARD INSERT MEMORY_ARRAY
    // This will need updating to match the memory models you are using.

    // Instantiate a generated DDR memory model to match the datawidth & chipselect requirements

    ddr_sdram_mem_model mem (
        .mem_dq    (mem_dq),
        .mem_dqs   (mem_dqs),
        .mem_addr  (a_delayed),
        .mem_ba    (ba_delayed),
        .mem_clk   (clk_to_ram),
        .mem_clk_n (clk_to_ram_n),
        .mem_cke   (cke_delayed),
        .mem_cs_n  (cs_n_delayed),
        .mem_ras_n (ras_n_delayed),
        .mem_cas_n (cas_n_delayed),
        .mem_we_n  (we_n_delayed),
        .mem_dm    (dm_delayed),
	.global_reset_n ()
    );

    // << END MEGAWIZARD INSERT MEMORY_ARRAY


    always
    begin
        clk <= 1'b0 ;
        clk_n <= 1'b1 ;
        while (1'b1)
        begin
            #((REF_CLOCK_TICK_IN_PS / 2) * 1);
            clk <= ~clk ;
            clk_n <= ~clk_n ;
        end
    end

    assign clk_to_ram = clk_to_sdram[0] ;
    assign clk_to_ram_n = ~clk_to_ram ; // mem model ignores clk_n ?

    initial
    begin
        reset_n <= 1'b1 ;
        @(clk);
        @(clk);
        @(clk);
        @(clk);
        @(clk);
        @(clk);
        reset_n <= 1'b0 ;
        @(clk);
        @(clk);
        @(clk);
        @(clk);
        @(clk);
        @(clk);
        reset_n <= 1'b1 ;
    end

    // control and data lines = 3 inches
    assign a_delayed = a ;
    assign ba_delayed = ba ;
    assign cke_delayed = cke ;
    assign odt_delayed = odt ;
    assign cs_n_delayed = cs_n ;
    assign ras_n_delayed = ras_n ;
    assign cas_n_delayed = cas_n ;
    assign we_n_delayed = we_n ;
    assign dm_delayed = dm ;

    // ---------------------------------------------------------------
    initial
    begin : endit
        integer count;
        reg ln;
        count = 0;

        // Stop simulation after test_complete or TINIT + 400000 clocks
        while ((count < (TINIT_CLOCKS + 400000)) & (test_complete !== 1))
        begin
            count = count + 1;
            @(negedge clk_to_sdram[0]);
        end
        if (test_complete === 1)
        begin
            if (pnf)
            begin
                $write($time);
                $write("          --- SIMULATION PASSED --- ");
                $stop;
            end
            else
            begin
                $write($time);
                $write("          --- SIMULATION FAILED --- ");
                $stop;
            end
        end
        else
        begin
            $write($time);
            $write("          --- SIMULATION FAILED, DID NOT COMPLETE --- ");
            $stop;
        end
    end

    always @(clk_to_sdram[0] or reset_n)
    begin
        if (!reset_n)
        begin
            test_complete_count <= 0 ;
        end
        else if ((clk_to_sdram[0]))
        begin
            if (test_complete)
            begin
                test_complete_count <= test_complete_count + 1 ;
            end
        end
    end



    reg[2:0] cmd_bus;


    //***********************************************************
    // Watch the SDRAM command bus
    always @(clk_to_ram)
    begin
        if (clk_to_ram)
        begin
            if (1'b1)
            begin
                cmd_bus = {ras_n_delayed, cas_n_delayed, we_n_delayed};
                case (cmd_bus)
                    3'b000 :
                        begin
                            // LMR command
                            $write($time);
                            if (ba_delayed == zero_one)
                            begin
                                $write("          ELMR     settings = ");
                                if (!(a_delayed[0]))
                                begin
                                    $write("DLL enable");
                                end
                            end
                            else
                            begin
       							$write("          LMR      settings = ");
       			
            			    	case (a_delayed[1:0])
                			   		3'b01 : $write("BL = 2,");
            			       		3'b10 : $write("BL = 4,");
            			       		3'b11 : $write("BL = 8,");
             			      		default : $write("BL = ??,");
                 			   	endcase
                   
                				case (a_delayed[6:4])
                   					3'b010 : $write(" CL = 2.0,");
                  			 		3'b011 : $write(" CL = 3.0,");
           			        		3'b101 : $write(" CL = 1.5,");
              			     		3'b110 : $write(" CL = 2.5,");
           			        		default : $write(" CL = ??,");
          				      	endcase
                
              				  	if ((a_delayed[8])) $write(" DLL reset");
                               
                            end
                            $write("\n");
                        end
                    3'b001 :
                        begin
                            // ARF command
                            $write($time);
                            $write("          ARF\n");
                        end
                    3'b010 :
                        begin
                            // PCH command
                            $write($time);
                            $write("          PCH");
                            if ((a_delayed[10]))
                            begin
                                $write(" all banks \n");
                            end
                            else
                            begin
                                $write(" bank ");
                                $write("%H\n", ba_delayed);
                            end
                        end
                    3'b011 :
                        begin
                            // ACT command
                            $write($time);
                            $write("          ACT     row address ");
                            $write("%H", a_delayed);
                            $write(" bank ");
                            $write("%H\n", ba_delayed);
                        end
                   3'b100 :
                        begin
                            // WR command
                            $write($time);
                            $write("          WR to   col address ");
                            $write("%H", a_delayed);
                            $write(" bank ");
                            $write("%H\n", ba_delayed);
                        end
                   3'b101 :
                        begin
                            // RD command
                            $write($time);
                            $write("          RD from col address ");
                            $write("%H", a_delayed);
                            $write(" bank ");
                            $write("%H\n", ba_delayed);
                        end
                   3'b110 :
                        begin
                            // BT command
                            $write($time);
                            $write("          BT ");
                        end
                   3'b111 :
                        begin
                            // NOP command
                        end
                endcase
            end
            else
            begin
            end // if enabled
        end
    end

endmodule

