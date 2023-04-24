`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 08:57:52 PM
// Design Name: 
// Module Name: state_machine_tb
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


module state_machine_tb;
    parameter WL = 5;
    reg CLK,RST, valid;
    reg [WL - 1:0] divisor,dividend;
    wire ready;
    wire [WL - 1:0] quotient,remainder;

    
    state_machine #
    (.WL(WL))
    DUT(
        .CLK(CLK),
        .RST(RST),
        .valid(valid),
        .divisor(divisor),
        .dividend(dividend),
        .quotient(quotient),
        .remainder(remainder),
        .ready(ready)
    );

    
    parameter ClkPeriod = 10;
    initial CLK =  1;
    always #(ClkPeriod / 2) CLK = ~CLK;

    initial begin
        RST = 1; valid = 0; divisor = 0; dividend = 0;
        @(posedge CLK) dividend = 14; divisor = 3; RST = 0; valid = 1;
        @(posedge CLK) valid = 0;
        repeat(2*WL) @(posedge CLK);
        
        
        @(posedge CLK) dividend = 17; divisor = 2; valid = 1;
        @(posedge CLK) valid = 0;
        repeat(2*WL) @(posedge CLK);
        
        
        @(posedge CLK) dividend = 11; divisor = 4; valid = 1;
        @(posedge CLK) valid = 0;
        repeat(2*WL) @(posedge CLK);
        
        $finish;
    end
endmodule
