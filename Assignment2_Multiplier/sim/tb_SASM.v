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


module tb_SASM;
    parameter WL = 4;
    reg CLK,RST,LOAD;
    reg [WL-1:0] a,b;
    wire adder_out;
    
    sasm #(
        .WL(WL))
        sasm00(
            .clk(CLK),
            .rst(RST),
            .in1(a),
            .in2(b),
            .load(LOAD)
        );

  
    initial CLK = 1;
    initial RST = 1;
    initial LOAD = 0;
    initial a = 4'b1111; 
    initial b = 4'b1111;
    always #10 CLK = ~CLK;
    

    assign adder_out = sasm00.a00.sum;
    
    initial begin
    
        RST = 1'b0;
        #10 RST = 1'b1;
        #10 RST = 1'b0;
        #10 LOAD = 1'b1;
        #10 LOAD = 1'b0;

        #20 a <= 4'b1110; b <= 4'b0111;
        #20 a <= 4'b1011; b <= 4'b0101;
        #20 a <= 4'b1000; b <= 4'b1000;
    end

endmodule
