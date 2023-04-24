//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2023 12:30:29 PM
// Design Name: 
// Module Name: shift_reg
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

module shift_reg(input [7:0] din,
                input d_valid, clk,
                output reg out, d_ready);
    
    reg [7:0] tmp;
    always @(posedge clk) begin
        if(d_valid) begin
            tmp <= din;
        end
        else begin 
            tmp <= {tmp[6:0],1'b0};
            out <= tmp[7];
            if (!tmp) d_ready <= 1'b1;
            else d_ready <= 1'b0;
        end
    end
    
endmodule 
