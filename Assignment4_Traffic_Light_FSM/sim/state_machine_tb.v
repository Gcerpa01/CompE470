`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2022 02:11:47 AM
// Design Name: 
// Module Name: SM_tb
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
    parameter WL=4;
    reg CLK, RST;
    reg [WL - 1:0] DELAY;
    wire [1:0] NS_lights,EW_lights, NW_lights,NE_lights;
    reg [7:0] TRAFFIC;

    state_machine #
        (.WL(WL))
        DUT(
            .CLK(CLK),
            .RST(RST),
            .DELAY(DELAY),
            .NSEW(TRAFFIC),
            .NS(NS_lights),
            .EW(EW_lights),
            .NW(NW_lights),
            .NE(NE_lights)
        );
    
    initial DELAY = 3;
    
    parameter ClkPeriod = 10;
    initial CLK = 0;
    always #(ClkPeriod / 2) CLK = ~CLK;


    initial begin

            RST = 1; @(posedge CLK); TRAFFIC = 8'b00000001; RST = 0;
            repeat(5)@(posedge CLK);
            
            for(integer i = 0; i < 7; i = i + 1) begin
                @(posedge CLK); TRAFFIC = TRAFFIC << 1;
                repeat(10) @(posedge CLK);
            
            end 
            
            
            @(posedge CLK); TRAFFIC = 8'b00000000;
            repeat(5)@(posedge CLK);
            
            @(posedge CLK); TRAFFIC = 8'b10000000;
            repeat(10) @(posedge CLK);
            
            for(integer i = 0; i < 7; i = i + 1) begin
                @(posedge CLK); TRAFFIC = TRAFFIC >> 1;
                repeat(10) @(posedge CLK);
            end 

            $finish;     
        end

endmodule
