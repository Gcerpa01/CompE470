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


module counter_tb;
reg CLK,RST,CRC_VALID;
wire [4:0] ctr;

    parameter ClkPeriod = 10;
    initial CLK = 0;
    always #(ClkPeriod / 2) CLK = ~CLK;
    
    initial begin
        RST = 1; @(posedge CLK); CRC_VALID = 1;
        @(posedge CLK)  RST = 0;  CRC_VALID = 0;
        @(posedge CLK)  CRC_VALID = 1;
        @(posedge CLK) CRC_VALID = 0;
        @(posedge CLK) CRC_VALID = 0;
        @(posedge CLK) CRC_VALID = 1;
        @(posedge CLK) CRC_VALID = 1;
        @(posedge CLK) CRC_VALID = 1;
        @(posedge CLK) CRC_VALID = 0;
        @(posedge CLK);
        $finish;
    end

    counter c00 (.clk( CLK), .rst(RST),.crc_valid(CRC_VALID),.ctr(ctr));

endmodule
