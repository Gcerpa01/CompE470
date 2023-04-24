module LIFO #(parameter WL = 10, DEPTH = 4)
             (input CLK,RST,wReq,rReq,
             input [WL - 1:0] din,
             output reg [WL - 1:0] dout,
            output reg full,empty,error);

    reg [WL - 1:0] MEM [0:DEPTH - 1]; //Depth x WL 
    reg [WL - 1:0] sp;
    
    always @(posedge CLK) begin
        if(RST) begin
            full <= 1'b0;
            empty <= 1'b1;
            error <= 1'b0;
            sp <= 0;
            dout <= 0;
        end
        else begin
            if(rReq && wReq) begin
                if(empty) begin
                    error <= 1'b1;
                    dout <= 0;
                end
                else begin
                    if(full) begin
                        dout <= MEM[sp - 1];
                        MEM[sp - 1] <= din;
                    end
                    else begin
                        error <= 1'b0;
                        dout <= MEM[sp - 1];
                        MEM[sp - 1] <= din;
                    end 
                end
            end 

            else begin
                if (rReq) begin
                    if (empty) begin
                        error <= 1'b1;
                        dout <= 0;
                    end
                    else begin
                        error <= 1'b0;
                        if (sp == 0) empty <= 1'b1; //on last element
                        else begin
                            dout <= MEM[sp - 1]; //read data of previous(current holds no data)
                            MEM[sp - 1] <= 0; //clear data to simulate pop
                            empty <= 1'b0; //not in last, not empty
                            sp <= sp - 1; //move pointer down
                        end
                        full <= 1'b0; //not full whenever popped
                    end
                end

                if(wReq) begin
                    if(full) error <= 1'b1; 
                    else begin
                        error <= 1'b0;
                        empty <= 1'b0; //not empty when pushed
                        MEM[sp] <= din; //write to memory
                        sp <= sp + 1;
                        if(sp == DEPTH - 1) full <= 1'b1; //last element written flag full
                        else full <= 1'b0; //not full while increment
                    end
                end
            end
        end 
    end
endmodule