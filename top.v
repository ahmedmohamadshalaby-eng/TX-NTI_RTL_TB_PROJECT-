module top(
    input wire [7:0] P_input,
    input wire clk,
     input wire rst,
     input wire v_input,
     input wire p_en,
     input wire P_bit,
     output wire  busy,
     output wire TX_out
);
wire ser_en;
wire ser_done;
wire parity_en;
wire [1:0]selector;
wire paritymux;
wire sermux;


FSM control(.v_input(v_input),.clk(clk),
.rst(rst),.p_en(p_en),
.serial_done(ser_done),
.par_en(parity_en),.sel(selector),
.busy(busy),.ser_en(ser_en));

Serializer piso(.serial_En(ser_en),.mux(sermux),.clk(clk),.rst(rst),
.serial_done(ser_done),.P_in(P_input));

Parity_C instan(.P_En(parity_en),
.P_bit(P_bit),.P_in(P_input),
.Par_out(paritymux));

MUX selection(.S0(1'b0),.S1(1'b1),
.TX_out(TX_out),.serial(sermux),
.parity(paritymux),.sel(selector));
endmodule 
