//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 08:19:48 PM
// Design Name: 
// Module Name: MUX
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


module mux #(parameter WL = 4)
            (input sel,
            input [WL - 1:0] in1,in2,
            output [WL-1:0] mux_out);
    
   assign mux_out = sel ? in1 : in2; 

endmodule
