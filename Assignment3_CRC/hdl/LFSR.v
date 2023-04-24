//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2023 12:05:16 AM
// Design Name: 
// Module Name: lfsr2
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


module LFSR(input din_s,
            input [7:0] residue,
            input clk,rst,
            output reg crc_valid);

    reg [7:0] q;

    always  @(posedge clk) begin
        if (rst) q<= 0;
        else  q <= {q[6], q[5] , q[4] ^ (din_s ^ q[7]), q[3] ^ ((din_s ^ q[7])), q[2],q[1],q[0], din_s ^ q[7]};
    end

    always @(posedge clk) begin
        if (q == residue)  begin
            crc_valid <= 1'b1;
            q <= 0;
        end
        else crc_valid <= 1'b0;
    end
endmodule