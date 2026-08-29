module Parity_C(
input wire P_En,
input wire P_bit,
input wire [7:0]P_in,
output reg Par_out
);
always@(*)begin
if(P_En==1'b1)begin
if(P_bit==1'b0)begin
Par_out=^P_in;
end 
else begin 
Par_out=~^P_in;
 end 
end 
else begin
Par_out=1'b0;
end end 
endmodule 