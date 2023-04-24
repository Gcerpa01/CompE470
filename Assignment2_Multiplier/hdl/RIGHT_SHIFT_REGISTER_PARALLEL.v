//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 08:48:56 PM
// Design Name: 
// Module Name: RIGHT_SHIFT_REGISTER_PARALLEL
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


module right_shift_register_parallel #(parameter WL = 4)
                            (input clk,rst,load,
                            input [WL - 1:0] in,
                            output reg out);
    
    reg [WL - 1:0] tmp;

    always @(posedge clk) begin
        if(rst) tmp <= 0;
        else
            if(load) tmp <= in;
            else begin
                tmp <= {tmp,in[WL-1:1]};
                out <= in[0];  
            end
    end
endmodule           