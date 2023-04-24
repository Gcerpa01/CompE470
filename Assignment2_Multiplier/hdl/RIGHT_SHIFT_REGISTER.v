//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 04:00:36 PM
// Design Name: 
// Module Name: RIGHT_SHIFT_REGISTER
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


module right_shift_register #(parameter WL = 4)
                            (input clk,rst,
                            input [WL - 1:0] in,
                            output reg shifted_bit);
    reg [WL - 1:0] tmp;

    always @(posedge clk) begin
        if (rst) tmp <= 0;  //load data into shifted_reg
        
        else begin
            tmp <= {tmp,in[WL-1:1]};
            shifted_bit <= in[0];  
        end
    end
endmodule
