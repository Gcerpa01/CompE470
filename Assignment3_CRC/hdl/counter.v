//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2023 11:33:07 PM
// Design Name: 
// Module Name: counter
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


module counter(input clk, rst, crc_valid,
               output [4:0] ctr );
        reg [4:0] tmp;
        always @(posedge clk) begin
            if (rst) tmp <= 0;
            else if (crc_valid) tmp <= tmp + 1;
        end
        assign ctr = tmp;
endmodule

