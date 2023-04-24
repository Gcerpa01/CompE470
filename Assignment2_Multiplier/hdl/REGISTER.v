//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 04:01:26 PM
// Design Name: 
// Module Name: REGISTER
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


module register(input d, clk, rst, 
                 output reg q);

    always @ (posedge clk) begin
        if(rst) q <= 1'b0; //assign 0 if reset is high
        else q <= d; //let d pass
    end
endmodule
