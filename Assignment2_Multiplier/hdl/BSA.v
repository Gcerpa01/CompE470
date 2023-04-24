//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 03:59:17 PM
// Design Name: 
// Module Name: BSA
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


module bsa #(parameter WL = 4)
            (input [WL - 1:0] in1,in2,
             input clk,rst,
             output sbit);

    wire a,b;
    wire c_out,s;
    
    
    right_shift_register  #(
                         .WL (WL))
                    r00 (
                        .clk (clk),
                        .rst(rst),
                        .in(in1),
                        .shifted_bit(a)
                    );
    right_shift_register  #(
                         .WL (WL))
                    r01 (
                        .clk (clk),
                        .rst(rst),
                        .in(in2),
                        .shifted_bit(b)
                    );
    

    fa_beh fa00 (.a(a),
                .b(b),
                .c_in(c_in),
                .sum(s),
                .c_out(c_out));
    
    register rg00 (.d(c_out),
              .clk(clk),
              .rst(rst),
              .q(c_in));

    right_shift_register  #(
                     .WL (WL))
                r10 (
                    .clk (clk),
                    .rst(rst),
                    .in(s),
                    .shifted_bit(sbit)
                );
    
endmodule
