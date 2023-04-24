`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 08:21:50 PM
// Design Name: 
// Module Name: tb_RCA
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


module tb_RCA;
    reg [3:0] a,b;
    wire [3:0] sum;
    wire c_out;
    RCA_4_BIT UUF(.A(a), .B(b), .C_IN(1'b0), .SUM(sum),.C_OUT(c_out));

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
