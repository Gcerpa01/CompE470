`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2023 04:04:19 PM
// Design Name: 
// Module Name: tb_BSA
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


module CRC_tb;
reg CLK,RST,D_VALID;
reg [7:0] RESIDUE,din;
wire [4:0] ctr;
wire d_ready;

    
    parameter ClkPeriod = 10;
    initial CLK = 0;
    always #(ClkPeriod / 2) CLK = ~CLK;
    initial RESIDUE = 8'hAC;
    
    initial begin
        RST = 1; @(posedge CLK); din =   8'h7B ; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK)  RST = 0;
        repeat(8) @(posedge CLK);
        
        din = 8'h19; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hFA; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h42; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hCE; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hEE; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hF2; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h41; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h9B; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h8F; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hDA; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hC6; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h20; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hAF; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h97; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hAB; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hE9; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h0F; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h3E; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'hF7; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h65; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h32; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h5B; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);
       
        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h32; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hAE; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hF9; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hA1; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hD3; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);


        din = 8'h7C; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h2B; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h4F; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h27; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hA5; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h5F; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h27; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hF9; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hA1; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'hD3; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h7C; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h2B; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h4F; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h27; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

        din = 8'h00; D_VALID = 1;
        @(posedge CLK) D_VALID = 0;
        @(posedge CLK);
        repeat(8) @(posedge CLK);

       $finish;
      end
    
    CRC wl0 (.din(din), .clk(CLK), .residue(RESIDUE), .rst(RST), .d_valid(D_VALID), .d_ready(d_ready),.ctr(ctr));
    
endmodule

