`timescale 1ns / 1ps

module SevenSegment( 
    input [3:0]A, input [3:0] B, output reg [6:0] Cathode, output reg [3:0] Anode);

always @ (A, B) begin
    case (A)
        4'b0000 : Cathode = 7'b0000001; 
        4'b0001 : Cathode = 7'b1001111;
        4'b0010 : Cathode = 7'b0010010;
        4'b0011 : Cathode = 7'b0000110;
        4'b0100 : Cathode = 7'b1001100;
        4'b0101 : Cathode = 7'b0100100;
        4'b0110 : Cathode = 7'b0100000;
        4'b0111 : Cathode = 7'b0001111;
        4'b1000 : Cathode = 7'b0000000;
        4'b1001 : Cathode = 7'b0001100;
        4'b1010 : Cathode = 7'b0001000; // A = 10
        4'b1011 : Cathode = 7'b1100000; // b = 11
        4'b1100 : Cathode = 7'b0110001; // C = 12
        4'b1101 : Cathode = 7'b1000010; // d = 13
        4'b1110 : Cathode = 7'b0110000; // E = 14
        4'b1111 : Cathode = 7'b0111000; // F = 15
    endcase
  
        Anode[3] = !B[3];
        Anode[2] = !B[2];
        Anode[1] = !B[1];
        Anode[0] = !B[0];

end
    
endmodule