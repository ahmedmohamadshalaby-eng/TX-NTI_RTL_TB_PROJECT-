`timescale 1ns/1ps
module FSM_TB;

reg v_input;
reg p_en;
reg serial_done;
reg clk;
reg rst;
wire  busy;
wire ser_en;
wire  [1:0]sel;
wire par_en;

FSM yan(.v_input(v_input),.p_en(p_en),.serial_done(serial_done),.clk(clk),.rst(rst),.busy(busy),.ser_en(ser_en),.sel(sel),.par_en(par_en));

always #5 clk=~clk;
initial begin 
clk=1'b0;
rst=1'b0;
v_input=1'b0;
p_en=1'b0;
serial_done=1'b0;
#10;
rst=1'b1;
#10;

v_input=1'b0;
p_en=1'b0;
serial_done=1'b0;
#10;

v_input=1'b1;
p_en=1'b0;
serial_done=1'b0;
#10;

v_input=1'b0;
p_en=1'b1;
serial_done=1'b0;
#10;

v_input=1'b0;
p_en=1'b0;
serial_done=1'b1;
#10;

v_input=1'b1;
p_en=1'b1;
serial_done=1'b1;
#10;

v_input=1'b0;
p_en=1'b1;
serial_done=1'b1;
#10;

v_input=1'b0;
p_en=1'b1;
rst=1'b0;
serial_done=1'b1;
#10;

v_input=1'b0;
p_en=1'b0;
serial_done=1'b1;
rst=1'b0;
#10;

$stop;
end 
endmodule