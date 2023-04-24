//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 08:49:49 PM
// Design Name: 
// Module Name: LEFT_SHIFT_REGISTER
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


module left_shift_register #(parameter WL = 4)
                            (input clk,rst,load,
                            input [WL - 1:0] in,
                            output reg [WL - 1:0] out);
    
    reg [WL - 1:0] tmp;

    always @(posedge clk) begin
        if(rst) tmp <= 0;
        else
            if(load) tmp <= in;
            else begin
                tmp <= {tmp[WL-2:0],in};
                out <= tmp; //output shifted value
            end
    end
endmodule            
