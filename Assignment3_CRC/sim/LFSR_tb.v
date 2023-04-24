`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 11:35:54 PM
// Design Name: 
// Module Name: LFSR_tb
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


module LFSR_tb;
reg CLK,RST,din_s;
reg [7:0] RESIDUE;
wire [7:0] x;
wire CRC_VALID;

 parameter ClkPeriod = 10;
    initial CLK = 0;
    always #(ClkPeriod / 2) CLK = ~CLK;
    initial RESIDUE = 136;
    
    initial begin
        RST = 1; @(posedge CLK); din_s = 1;
        @(posedge CLK)  RST = 0;  din_s = 0;
        @(posedge CLK)  din_s = 1;
        @(posedge CLK) din_s = 0;
        @(posedge CLK) din_s = 0;
        @(posedge CLK) din_s = 1;
        @(posedge CLK) din_s = 1;
        @(posedge CLK) din_s = 1;
        @(posedge CLK) din_s = 0;
        @(posedge CLK);
        $finish;
    end
    LFSR U00(.din_s(din_s),.clk(CLK),.rst(RST),.residue(RESIDUE),.crc_valid(CRC_VALID));
    assign x = U00.q;
    
endmodule
