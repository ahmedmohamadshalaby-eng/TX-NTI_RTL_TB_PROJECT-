`timescale 1ns/1ps
module Serializer_TB;

reg [7:0]P_in;
reg serial_En;
wire mux;
wire serial_done;
reg clk;
reg rst;

serializer sel(.P_in(P_in),.serial_En(serial_En),.mux(mux),.serial_done(serial_done),.clk(clk),.rst(rst));

always #5 clk=~clk;
initial  begin 
clk=1'b0;
rst=1'b0;
P_in=8'b00000000;
serial_En=1'b0;
#10
rst=1'b1;
#10;

P_in=8'b00101000;
serial_En=1'b0;
#10;

P_in=8'b00001111;
serial_En=1'b1;
#80;

P_in=8'b00001111;
serial_En=1'b0;
#10;

P_in=8'b00001111;
serial_En=1'b1;
rst=1'b0;
#10;

$stop;
end 
endmodule
