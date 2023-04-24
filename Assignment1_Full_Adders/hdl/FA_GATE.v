
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 07:56:05 PM
// Design Name: 
// Module Name: FA_GATE
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


module FA_GATE(input A,B,C_IN,
                output SUM,C_OUT);

    wire x,y,z;
    
    xor U00 (x,A,B); //Instantiate primitive gate
    and U01 (y,A,B);//Instantiate primitive gate
    and U02 (z,C_IN,x); //instantiate second gate
    xor U03 (SUM,x,C_IN);
    or U04 (C_OUT,y,z);
endmodule

