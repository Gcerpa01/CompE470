//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 08:44:36 PM
// Design Name: 
// Module Name: SASM
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


module sasm #(parameter WL = 4)
                            (input clk,rst,load,
                            input [WL - 1:0] in1,in2);
    
    wire [2*WL - 1:0] sum_result,a,mux_out,saved;
    wire b;
    left_shift_register  #(
                     .WL (2*WL))
                l00 (
                    .clk (clk),
                    .rst(rst),
                    .in(in1),
                    .out(a)
                );

    right_shift_register_parallel #(
                             .WL (WL))
                        r00 (
                            .clk (clk),
                            .rst(rst),
                            .in(in2),
                            .out(b)
                        );
    
    mux #(
                 .WL (2*WL))
            m00 (
                .in1(a),
                .in2(0),
                .sel(b),
                .mux_out(mux_out)
            );

    Adder #(
                 .WL (2*WL))
            a00 (
                .in1(mux_out),
                .in2(sum_result),
                .sum(saved)
            ); 

    p_reg #(
                 .WL (2*WL))
            p00 (
                .in1(mux_out),
                .out(saved)
            ); 
endmodule

