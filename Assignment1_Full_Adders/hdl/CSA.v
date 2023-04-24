//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 08:21:29 PM
// Design Name: 
// Module Name: CSA
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


module CSA(input [7:0] A,B,
            input C_IN,
            output [7:0] SUM,
            output C_OUT);

    wire [3:0] rca_one,rca_two;

    wire c_out_one,c_out_two,c_out_select; 

    RCA_4_BIT RCA0( .A(A[3:0]), .B(B[3:0]), .C_IN(C_IN), .SUM(SUM[3:0]), .C_OUT(c_out_select));
    RCA_4_BIT RCA1( .A(A[7:4]), .B(B[7:4]), .C_IN(1'b0), .SUM(rca_one), .C_OUT(c_out_one));
    RCA_4_BIT RCA2( .A(A[7:4]), .B(B[7:4]), .C_IN(1'b1), .SUM(rca_two), .C_OUT(c_out_two));

    MUX MUX0( .SEL(c_out_select), .IN_1(rca_two[0]), .IN_2(rca_one[0]), .MUX_OUT(SUM[4]) );
    MUX MUX1( .SEL(c_out_select), .IN_1(rca_two[1]), .IN_2(rca_one[1]), .MUX_OUT(SUM[5]) );
    MUX MUX2( .SEL(c_out_select), .IN_1(rca_two[2]), .IN_2(rca_one[2]), .MUX_OUT(SUM[6]) );
    MUX MUX3( .SEL(c_out_select), .IN_1(rca_two[3]), .IN_2(rca_one[3]), .MUX_OUT(SUM[7]) );
    MUX MUX4( .SEL(c_out_select), .IN_1(c_out_two), .IN_2(c_out_one), .MUX_OUT(C_OUT) );

endmodule
