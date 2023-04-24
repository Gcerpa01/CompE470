`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 12:33:18 PM
// Design Name: 
// Module Name: LIFO_tb
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

module FIFO_tb; 

    parameter WL = 3;
    parameter DEPTH = 4;

    reg CLK,RST, wReq,rReq;
    reg [WL - 1:0] din;
    wire [WL -1 :0] dout;
    wire empty,full,error;
    FIFO #(.WL(WL),
           .DEPTH(DEPTH))
        DUT(.CLK(CLK),
            .RST(RST),
            .wReq(wReq),
            .rReq(rReq),
            .din(din),
            .dout(dout),
            .empty(empty),
            .full(full),
            .error(error));
            
    wire [WL - 1:0] wPtr,rPtr;
    
    assign wPtr = DUT.wPtr;
    assign rPtr = DUT.rPtr;
    parameter ClkPeriod = 10;
    initial CLK =  1;
    always #(ClkPeriod / 2) CLK = ~CLK;

    initial begin
        RST = 1'b1;
        wReq = 0;
        rReq = 0;
        din = 1;
        
        @(posedge CLK) RST = 0; 
        
        @(posedge CLK) wReq  = 1;
        
        @(posedge CLK) din = 2; 

        @(posedge CLK) din = 5; 

        @(posedge CLK) din = 7; 

        @(posedge CLK) din = 4; 

        @(posedge CLK) wReq = 0; rReq = 1; 
        
        @(posedge CLK) din = 3; wReq = 1; rReq = 1; 
        
        @(posedge CLK) din = 1; rReq = 0;
        
        @(posedge CLK) wReq = 0; rReq = 1; 
        
        repeat(4)@(posedge CLK);
        
        @(posedge CLK) din = 2; wReq = 1; rReq = 0;
        
        @(posedge CLK);
        
        $finish;
    end
endmodule
