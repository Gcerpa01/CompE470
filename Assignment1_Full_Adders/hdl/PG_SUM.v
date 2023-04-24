//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 09:40:48 PM
// Design Name: 
// Module Name: PG_SUM
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

module PG_SUM(input A,B,
           input C_IN,
           output SUM,C_OUT);

    wire p,g;
    PG PG0( .A(A), .B(B), .P(p), .G(g));

    assign SUM = p ^ C_IN;
    assign C_OUT = g | (p & C_IN);

endmodule
