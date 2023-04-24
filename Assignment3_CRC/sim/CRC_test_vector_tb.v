`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 04:04:19 PM
// Design Name: 
// Module Name: tb_BSA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CRC_test_vector_tb;
reg CLK,RST,D_VALID;
reg [7:0] RESIDUE,din;
wire [4:0] ctr;
wire d_ready;

//    wire out,ready;
    wire [7:0]crc8,shift;
    
    parameter ClkPeriod = 10;
    initial CLK = 0;
    always #(ClkPeriod / 2) CLK = ~CLK;
    initial RESIDUE = 8'hAC;
    
    initial begin
        RST = 1; @(posedge CLK); din =   8'h12 ; D_VALID = 1;
        @(posedge CLK) D_VALID = 0; 
        @(posedge CLK)  RST = 0;
        repeat(8) @(posedge CLK);
        
        
        @(posedge CLK);
        din = 8'hDE; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK); RST = 0;
        repeat(8) @(posedge CLK);
       

       $finish;
      end
    
    CRC wl0 (.din(din), .clk(CLK), .residue(RESIDUE), .rst(RST), .d_valid(D_VALID), .d_ready(d_ready),.ctr(ctr));

    assign crc8 = wl0.lfs0.q;
    assign shift = wl0.sr0.out;
    
endmodule

