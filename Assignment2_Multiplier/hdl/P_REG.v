//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 08:45:32 PM
// Design Name: 
// Module Name: P_REG
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


module p_reg #(parameter WL = 4)
            (input clk,rst,
            input [WL - 1:0] in1,
            output reg [WL - 1:0] out);
    
    always @(posedge clk) begin
        if(rst) out = 0;
        else out <= in1;
    end
endmodule
