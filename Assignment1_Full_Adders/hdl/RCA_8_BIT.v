//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 08:42:47 PM
// Design Name: 
// Module Name: RCA_8_BIT
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


module RCA_8_BIT(input [7:0] A,B,
                 input C_IN,
                 output [7:0] SUM,
                 output C_OUT); 
    
    wire c; //create wire for first RCA c_out

    RCA_4_BIT RCA0( .A(A[3:0]), .B(B[3:0]), .C_IN(C_IN), .SUM(SUM[3:0]), .C_OUT(c));
    RCA_4_BIT RCA1( .A(A[7:4]), .B(B[7:4]), .C_IN(c), .SUM(SUM[7:4]), .C_OUT(C_OUT));

endmodule