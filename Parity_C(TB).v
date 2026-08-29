`timescale 1ns/1ps
module Parity_C_TB;

 reg P_En;
 reg P_bit;
 reg [7:0]P_in;
 wire Par_out;

Parity_C instant(.P_En(P_En),.P_bit(P_bit),.P_in(P_in),.Par_out(Par_out));
initial begin 
P_En=1'b0;
P_bit=1'b0;
P_in=8'b00000000;
#10;

P_in=8'b00101010;
P_bit=1'b0;
P_En=1'b1;
#10;


P_in=8'b01010101;
P_bit=1'b0;
P_En=1'b1;
#10;


P_in=8'b00101000;
P_bit=1'b1;
P_En=1'b1;
#10;


P_in=8'b01011000;
P_bit=1'b1;
P_En=1'b1;
#10;


P_En=1'b0;
P_bit=1'b1;
P_in=8'b00001111;
#10;


$stop;
end 
endmodule 