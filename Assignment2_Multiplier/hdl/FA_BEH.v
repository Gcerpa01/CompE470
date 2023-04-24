//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 04:02:28 PM
// Design Name: 
// Module Name: FA_BEH
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


module fa_beh(input a,b,c_in,
              output reg sum,c_out);

    always @ (a or b or c_in) begin
        sum = a ^ b ^ c_in;
        c_out = (a & b) | ((a^b) & c_in);
    end
endmodule
              
