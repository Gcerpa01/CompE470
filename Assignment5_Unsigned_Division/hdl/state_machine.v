module state_machine #(parameter WL = 4)
                       (input CLK,RST,valid,
                       input [WL - 1:0] divisor,dividend,
                       output reg [WL-1:0] quotient, remainder,
                       output reg ready);
    localparam idle = 2'b00; localparam op = 2'b01;
    localparam last = 2'b10; localparam done = 2'b11;;

    reg[WL - 1:0] d,rl,rh,rh_temp,counter_time;
    reg [1:0] state;
    reg q,EN;
    
    always @(posedge CLK) begin
        if(RST) begin
            state <= idle;
            EN <= 1'b0;
            rl<= 0;
            rh <= 0;
            d <= 0;
            quotient <= 0;
            remainder <= 0;
            ready <= 1'b1;
        end
        else begin
            case(state)
                idle: begin
                    if(valid) begin
                        d <= divisor;
                        rl <= dividend;
                        rh <= 0;
                        ready <= 1'b0;
                        state <= op;
                        counter_time <= 0;
                     end
                     else state <= idle;
                    end 

                op: begin
                    EN <= 1'b1;
                    if (counter_time != WL - 1) begin
                        if (rh >= d) begin
                            assign rh_temp = rh - d;
                            assign q = 1;
                            end

                        else begin
                            assign rh_temp = rh;
                            assign q = 0;
                            end

                        rl <= {rl[WL - 2:0],q};
                        rh <= {rh_temp[WL- 2:0],rl[WL-1]};
                        state <= op;
                        end

                    else begin
                        state <= last;
                        EN <= 1'b0;
                        counter_time <= 0;
                        end
                    end

                last: begin
                
                      if (rh >= d) begin
                            assign rh_temp = rh - d;
                            assign q = 1;
                            end

                        else begin
                            assign rh_temp = rh;
                            assign q = 0;
                            end

                        rl <= {rl[WL - 2:0],q};
                        state <= done;
                        end


                
                done: begin
                    quotient <= rl;
                    remainder <= rh;
                    ready <= 1'b1;
                    state <= idle;
                end


            endcase


        end
    end
    
    
    always @(posedge CLK) begin
        if(RST) begin
            counter_time <= 0;
        end
        else if (EN) counter_time <= counter_time + 1;
    end
    
endmodule
