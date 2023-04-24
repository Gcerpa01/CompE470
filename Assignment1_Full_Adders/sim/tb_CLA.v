`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 09:37:21 PM
// Design Name: 
// Module Name: tb_CLA
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


module tb_CLA;
    reg [3:0] a,b;
    wire [3:0] cla_sum,rca_sum;
    wire cla_c_out,rca_c_out;
    CLA UU0(.A(a), .B(b), .C_IN(1'b0), .SUM(cla_sum),.C_OUT(cla_c_out));
    RCA_4_BIT UU1(.A(a), .B(b), .C_IN(1'b0), .SUM(rca_sum),.C_OUT(rca_c_out));

    initial begin
        a = 0;
        b = 0;
        #10;
        a = 4'b0000;
        b = 4'b0000;
        #10;
        a = 4'b1111;
        b = 4'b1111;
        #10;
        a = 4'b1110;
        b = 4'b0111;
        #10;
        a = 4'b1010;
        b = 4'b0101;
        #10;
        a = 4'b1000;
        b = 4'b1000;
        
        #10;
        $finish;
    end
        
        //initial begin
        //$monitor("value of a=%d,b=%d,sum=%d",a,b,sum);
        //end

endmodule
