module serializer(
input wire [7:0]P_in,
input wire serial_En,
output reg mux,
output reg serial_done,
input wire clk,
input wire rst
);
reg [2:0]counter;
always@(posedge clk or negedge rst)begin
if(!rst)begin 
 mux<=1'b0;
 serial_done<=1'b0;
 counter<=3'b000; end
else begin 
 if(serial_En==1'b1)begin
   mux<=P_in[counter];
   serial_done<=1'b0;
   if(counter==3'd7)begin 
     serial_done<=1'b1;
     counter<=3'b000; end
   else begin 
     counter<=counter+1'b1; end  
 end
 else begin 
  mux<=1'b0;
  serial_done<=1'b0;
  counter<=3'b000; end end 
 end 
 endmodule