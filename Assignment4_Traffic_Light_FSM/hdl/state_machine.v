module state_machine #(parameter WL = 10)(input CLK,RST,
                                         input [WL-1:0] DELAY,
                                         input [7:0] NSEW,
                                         output reg [1:0] NS,EW,NW,NE);
    
parameter s0 = 3'b000; parameter s1 = 3'b001;
parameter s2 = 3'b010; parameter s3 = 3'b011;
parameter s4 = 3'b100; parameter s5 = 3'b101;
parameter s6 = 3'b110; parameter s7 = 3'b111;

reg [2:0] current_state,next_state;
reg [WL-1:0] counter_time;
wire [3:0] prev_input;
reg EN;

//state register with sync
always @(posedge CLK) begin 
        if(RST) current_state <= s0;
        else begin 
            current_state <= next_state;
        end
end

//next state CL
always @(NSEW or current_state or CLK) begin
        case(current_state)
            s0: begin
                if (NSEW == 8'b00000001 || NSEW == 8'b00000010) begin
                    next_state <= s0;
                    EN <= 1'b0;
                end 
                
                else if (NSEW == 8'b00000000) begin
                    next_state <= s0;
                    EN <= 1'b0;
               end 
               
                else begin
                    EN <= 1'b1;
                    if (DELAY  == counter_time) begin
                        next_state <= s1;
                        counter_time <= 0;
                        EN <= 1'b0;
                    end
                end
                end

            s1: //every state needs delay due to switch
                begin
                    EN <= 1'b1;
                    if (NSEW == 8'b00000100 || NSEW == 8'b00001000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s2;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b00100000 || NSEW == 8'b00010000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s3;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b10000000 || NSEW == 8'b01000000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s4;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end
                end
            s2:
                if (NSEW == 8'b00000100 || NSEW == 8'b00001000) begin
                    next_state <= s2;
                    EN <= 1'b0;
                end

                else begin
                    EN <= 1'b1;
                    if (DELAY == counter_time) begin
                        next_state <= s5;
                        counter_time <= 0;
                        EN <= 1'b0;
                    end
                end

            s3:
                if (NSEW == 8'b00100000 || NSEW == 8'b00010000) begin
                    next_state <= s3;
                    EN  <= 1'b0;
                end
                else begin
                    EN <= 1'b1;
                    if (DELAY == counter_time) begin
                        next_state <= s6;
                        counter_time <= 0;
                        EN <= 1'b0;
                    end
                end

            s4: 
                if (NSEW == 8'b10000000 || NSEW == 8'b01000000) begin
                    next_state <= s4;
                    EN  <= 1'b0;
                end

                else begin
                    EN  <= 1'b1;
                    if (DELAY == counter_time) begin
                        next_state <= s7;
                        counter_time <= 0;
                        EN <= 1'b0;
                    end
                end

            s5: 
                begin
                    EN <= 1'b1;
                    if (NSEW == 8'b00000001 || NSEW == 8'b00000010) begin
                        if (DELAY == counter_time) begin
                            next_state <= s0;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b00100000 || NSEW == 8'b00010000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s3;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b10000000 || NSEW == 8'b01000000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s4;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end
                end

            s6: 
                begin
                    EN <= 1'b1;
                    if (NSEW == 8'b00000001 || NSEW == 8'b00000010) begin
                        if (DELAY == counter_time) begin
                            next_state <= s0;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b00000100 || NSEW == 8'b00001000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s2;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b10000000 || NSEW == 8'b01000000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s4;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end
                end

            s7: 
                begin
                    EN <= 1'b1;
                    if (NSEW == 8'b00000001 || NSEW == 8'b00000010) begin
                        if (DELAY == counter_time) begin
                            next_state <= s0;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b00000100 || NSEW == 8'b00001000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s2;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end

                    else if (NSEW == 8'b00100000 || NSEW == 8'b00010000) begin
                        if (DELAY == counter_time) begin
                            next_state <= s3;
                            counter_time <= 0;
                            EN <= 1'b0;
                        end
                    end
                end
            default: //needs delay
                    next_state <= s0;       
        endcase
end

//output combo logic
always @(current_state) begin
    case(current_state)
        s0:
            begin
                NS = 2'b10;
                EW = 2'b00;
                NW = 2'b00;
                NE = 2'b00;
            end
        
        s1:
            begin
                NS = 2'b01;
                EW = 2'b00;
                NW = 2'b00;
                NE = 2'b00;
            end
        
        s2:
            begin
                NS = 2'b00;
                EW = 2'b10;
                NW = 2'b00;
                NE = 2'b00;
            end
        s3:
            begin
                NS = 2'b00;
                EW = 2'b00;
                NW = 2'b10;
                NE = 2'b00;
            end
        s4:
            begin
                NS = 2'b00;
                EW = 2'b00;
                NW = 2'b00;
                NE = 2'b10;
            end
        s5:
            begin
                NS = 2'b00;
                EW = 2'b01;
                NW = 2'b00;
                NE = 2'b00;
            end
        s6:
            begin
                NS = 2'b00;
                EW = 2'b00;
                NW = 2'b01;
                NE = 2'b00;
            end
        s7:
            begin
                NS = 2'b00;
                EW = 2'b00;
                NW = 2'b00;
                NE = 2'b01;
            end
    endcase
end

//counter
always @(posedge CLK or posedge RST) begin
    if(RST) begin
        counter_time <= 0;
    end
    else if (EN) counter_time <= counter_time + 1;
end

endmodule