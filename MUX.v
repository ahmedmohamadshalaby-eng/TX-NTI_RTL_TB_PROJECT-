module MUX(
input wire S0,
input wire S1,
output reg TX_out,
input wire serial,
input wire parity,
input wire [1:0]sel
);
always@(*)begin
 if(sel==2'b00)begin
    TX_out=S0;
 end
 else if(sel==2'b11)begin
 TX_out=S1;
 end
 else if(sel==2'b01)begin
 TX_out=serial;end
 else if(sel==2'b10)begin
 TX_out=parity; end
 else begin 
 TX_out=1'b1;end 
 end
endmodule
