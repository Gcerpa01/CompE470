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


module tb_BSA;
    parameter WL = 4;
    reg CLK,RST;
    reg [WL-1:0] a,b;
    wire s_bit;
    bsa #(
        .WL(WL))
        bsa00(
            .clk(CLK),
            .rst(RST),
            .in1(a),
            .in2(b),
            .sbit(s_bit)
        );
  
  
    initial CLK = 1;
    initial RST = 1;
    initial a = 4'b1111; 
    initial b = 4'b1111;
    always #10 CLK = ~CLK;
    
    initial begin
    
//        CLK = 0;
        RST = 1'b0;
        #10 RST = 1'b1;
        #10 RST = 1'b0;
        
//        #10 @(posedge CLK) a <= 4'b0000; b <= 4'b0000;
        #20 a <= 4'b1110; b <= 4'b0111;
        #20 a <= 4'b1011; b <= 4'b0101;
        #20 a <= 4'b1000; b <= 4'b1000;
    end

endmodule
