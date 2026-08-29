~timescale 1ns/1ps
module top_TB;
 reg [7:0] P_input;
    reg clk;
     reg rst;
     reg v_input;
     reg p_en;
     reg P_bit;
     wire  busy;
      wire TX_out;
top B.box(.clk(clk),.rst(rst),.v_input(v_input),.p_en(p_en),.P_bit(P_bit),.busy(busy),.TX_out(TX_out),.P_input(P_input));
always #5 clk=~clk;
initial begin 
clk=1'b0;
rst=1'b0;
v_input=1'b0;
p_en=1'b0;
P_bit=1'b0;
P_input=8'b00000000;
#10
rst=1'b1;
#10;

v_input=1'b1;
P_input=8'b00101010;
p_en=1'b0;
P_bit=1'b0;
rst=1'b0;
#10;

rst=1'b1;
#10;



v_input=1'b1;
P_input=8'b00101010;
p_en=1'b0;
P_bit=1'b0;
#10;


v_input=1'b0;
P_input=8'b00101010;
p_en=1'b0;
P_bit=1'b0;
#10;


v_input=1'b1;
#10;

v_input=1'b0;
P_input=8'b00101010;
p_en=1'b1;
P_bit=1'b0;
#110;

v_input=1'b0;
P_input=8'b00101010;
p_en=1'b1;
P_bit=1'b1;
#110;


v_input=1'b0;
P_input=8'b00101010;
p_en=1'b0;
P_bit=1'b0;
rst=1'b0;
#10;

v_input=1'b1;
P_input=8'b00101010;
p_en=1'b1;
P_bit=1'b0;
#10;


$stop;
end 
endmodule 