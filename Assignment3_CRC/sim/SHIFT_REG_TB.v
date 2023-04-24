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


module shift_reg_tb;
    reg CLK,D_VALID;
    wire out,ready;
    reg [7:0] a;
    
//    wire out,ready;
    wire[7:0] tmp;
  
    initial a = 8'b11011010; 
    
    parameter ClkPeriod = 10;
    initial CLK = 0;
    always #(ClkPeriod / 2) CLK = ~CLK;

    
    initial begin
        D_VALID = 0;
        @(posedge CLK) D_VALID = 1;
         @(posedge CLK) D_VALID = 0; 
         repeat(10) @(posedge CLK);
       $finish;
      end
    shift_reg UUF(.din(a), .clk(CLK), .d_valid(D_VALID), .out(out), .d_ready(ready));
    assign tmp = UUF.tmp;



endmodule

