`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2023 08:22:33 PM
// Design Name: 
// Module Name: tb_CSA
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


module tb_CSA;
    reg [7:0] a,b;
    wire [7:0] csa_sum,rca_sum;
    wire csa_c_out,rca_c_out;

    CSA UU0(.A(a), .B(b), .C_IN(1'b0), .SUM(csa_sum), .C_OUT(csa_c_out) );
    RCA_8_BIT UU1(.A(a), .B(b), .C_IN(1'b0), .SUM(rca_sum), .C_OUT(rca_c_out) );

    initial begin
        a = 8'h00;
        b = 8'h00;
        #10;
        a = 8'hff;
        b = 8'hff;
        #10;
        a = 8'hf7;
        b = 8'h7f;
        #10;
        a = 8'haa;
        b = 8'h55;
        #10;
        a = 8'h8f;
        b = 8'hf8;
        
        #10;
        $finish;

    end
        
        //initial begin
        //$monitor("value of a=%d,b=%d,sum=%d",a,b,sum);
        //end

endmodule
