module CRC(input [7:0] din,
             input [7:0] residue,
             input clk,rst,d_valid,
             output [4:0] ctr,
             output d_ready);

    wire din_s,crc_valid;

    shift_reg sr0 (.din(din),.d_valid(d_valid),.clk(clk),.out(din_s),.d_ready(d_ready));
    LFSR lfs0 (.din_s(din_s),.residue(residue),.clk(clk),.rst(rst),.crc_valid(crc_valid));
    counter cr0 (.clk(clk),.rst(rst),.crc_valid(crc_valid),.ctr(ctr));
  
endmodule
    

