`timescale 1ns/1ps
module MUX_TB;
reg S0;
reg S1;
wire TX_out;
reg serial;
reg parity;
reg [1:0]sel;

MUX hull(.S0(1'b0),.S1(1'b1),.TX_out(TX_out),.serial(serial),.parity(parity),.sel(sel));
initial begin 
sel=2'b11;
serial=1'b0;
parity=1'b0;
#10;

sel=2'b00;
serial=1'b1;
parity=1'b1;
#10;

sel=2'b00;
serial=1'b0;
parity=1'b0;
#10;

sel=2'b01;
serial=1'b1;
parity=1'b0;
#10;

sel=2'b01;
serial=1'b0;
parity=1'b1;
#10;


sel=2'b10;
serial=1'b1;
parity=1'b0;
#10;


sel=2'b10;
serial=1'b0;
parity=1'b1;
#10


sel=2'b11;
serial=1'b1;
parity=1'b1;
#10;


sel=2'b11;
serial=1'b0;
parity=1'b1;
#10;


sel=2'b11;
serial=1'b0;
parity=1'b0;
#10;

sel=2'b11;
serial=1'b1;
parity=1'b0;
#10;


$stop;
end 
endmodule 