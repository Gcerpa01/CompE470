//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 09:28:30 PM
// Design Name: 
// Module Name: CLA
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




module CLA(input [3:0] A,B,
                 input C_IN,
                 output [3:0] SUM,
                 output C_OUT); 
    
    wire [2:0] c; //create 3 bits for carries

    PG_SUM PG0( .A(A[0]), .B(B[0]), .C_IN(C_IN), .SUM(SUM[0]), .C_OUT(c[0]) ); //start with c_in = 0
    PG_SUM PG1( .A(A[1]), .B(B[1]), .C_IN(c[0]), .SUM(SUM[1]), .C_OUT(c[1]) );
    PG_SUM PG2( .A(A[2]), .B(B[2]), .C_IN(c[1]), .SUM(SUM[2]), .C_OUT(c[2]) );
    PG_SUM PG3( .A(A[3]), .B(B[3]), .C_IN(c[2]), .SUM(SUM[3]), .C_OUT(C_OUT) );  //output last carry SUM[4]

endmodule
