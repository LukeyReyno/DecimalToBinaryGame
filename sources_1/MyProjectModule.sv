`timescale 1ns / 1ps

class Number;
    int data;
    function copy (Number other);
        this.data = other.data;
    endfunction
endclass

module FSM(input [6:0]A, input Submit, input RESET, input clk, output reg [5:0] st_LED, output reg [2:0] bLED, output reg [6:0] Cathode, output reg [3:0] Anode);

    // LEDS (0, 1, 2, 3, 4, 5 represent current state, 6, 7, 8 blink during state 5)
    reg [32:0] counter;
    reg state;
    reg SS_blink;
    reg Answer;
    Number Solution, SUM;
    reg [3:0] DIS;
    reg [3:0] Anode_Activate;
    assign bLED[2] = state;
    assign bLED[1] = state;
    assign bLED[0] = state;
    
    reg [5:0] PS, NS; //Next State and Present State Variables
    parameter [5:0] st_0 = 6'b000001, st_1 = 6'b000011, st_2=6'b000111, st_3=6'b001111, st_4=6'b011111, st_5=6'b111111;
    
    initial begin //initial conditions
    SUM.data = 10;
    st_LED = st_0; end
    
    always @ (posedge Submit, posedge RESET) begin
        Solution.copy(SUM);
        if (RESET == 1) begin
            NS = st_0;
            st_LED = st_0;
            if (counter[6:0] < 100)
                SUM.data = counter[6:0];
            else
                SUM.data = counter[5:0];  end
        else begin
            case(PS)
                st_0: begin
                    if (A == Solution.data) begin
                        NS = st_1;
                        st_LED = st_1; end
                    else
                        NS = st_0; end
                st_1: begin
                    
                    if (A == Solution.data) begin
                        NS = st_2;
                        st_LED = st_2; end
                    else
                        NS = st_1; end
                st_2: begin
                    
                    if (A == Solution.data) begin
                        NS = st_3;
                        st_LED = st_3; end
                    else
                        NS = st_2; end
                st_3: begin
                    
                    if (A == Solution.data) begin
                        NS = st_4;
                        st_LED = st_4; end
                    else
                        NS = st_3; end
                st_4: begin
                    if (A == Solution.data) begin
                        NS = st_5;
                        st_LED = st_5; end
                    else
                        NS = st_4; end
                st_5: NS = st_5;
                default: NS = st_0;
                
            endcase
            if (counter[6:0] < 100)
                SUM.data = counter[6:0];
            else
                SUM.data = counter[5:0]; 
        end
    end
        
    always @ (posedge clk) begin
        PS <= NS;
        counter <= counter + 1;
        
        if (PS == st_5)
            state <= counter[25];
        else
            state <= 0;
            
        SS_blink <= counter[20];
        case(SS_blink)
            1'b0: begin
                Anode_Activate = 4'b0010;
                DIS = ((SUM.data % 1000)%100)/10; end
            1'b1: begin
                Anode_Activate = 4'b0001;
                DIS = ((SUM.data % 1000)%100)%10; end
        endcase
    end
    
    SevenSegment Seg1 (DIS, Anode_Activate, Cathode, Anode);
    
endmodule