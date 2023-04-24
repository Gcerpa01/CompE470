//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 08:23:07 PM
// Design Name: 
// Module Name: RCA_4_BIT
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


module RCA_4_BIT(input [3:0] A,B,
                 input C_IN,
                 output [3:0] SUM,
                 output C_OUT); 
    
    wire [2:0] c; //create 3 bits for carries

    FA_GATE FA0( .A(A[0]), .B(B[0]), .C_IN(C_IN), .SUM(SUM[0]), .C_OUT(c[0]) ); //start with c_in = 0
    FA_GATE FA1( .A(A[1]), .B(B[1]), .C_IN(c[0]), .SUM(SUM[1]), .C_OUT(c[1]) );
    FA_DATA FA2( .A(A[2]), .B(B[2]), .C_IN(c[1]), .SUM(SUM[2]), .C_OUT(c[2]) );
    FA_DATA FA3( .A(A[3]), .B(B[3]), .C_IN(c[2]), .SUM(SUM[3]), .C_OUT(C_OUT) );  //output last carry SUM[4]

endmodule
