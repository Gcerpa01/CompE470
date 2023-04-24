//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 07:54:48 PM
// Design Name: 
// Module Name: FA_DATA
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


module FA_DATA(input A,B,C_IN,
                output SUM,C_OUT);

    assign SUM = A ^ B ^ C_IN ; //top primitive gates
    assign C_OUT = (A & B) | ((A ^ B ) & C_IN);

endmodule

