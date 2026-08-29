module FSM(
input wire v_input,
input wire p_en,
input wire serial_done,
input wire clk,
input wire rst,
output reg busy,
output reg ser_en,
output reg [1:0]sel,
output reg par_en
);
reg [2:0]current ;
reg [2:0]next ;
localparam s0=3'b000;
localparam s1=3'b001;
localparam s2=3'b010;
localparam s3=3'b011;
localparam s4=3'b100;


always@(posedge clk or negedge rst )begin 
if(!rst)begin 
current<=s0;
end
else begin 
current<=next;
end
end 


always@(*)begin
case(current)
s0:if(v_input==1'b1)begin
next=s1;
end
else begin 
next=s0; end
s1:next=s2;
s2:if(serial_done&&p_en)begin 
next=s3;end
else if(serial_done&&p_en==1'b0) begin 
next=s4;end
else begin 
next=s2;end
s3:
next=s4;
s4:next=s0;
default:next=s0;
endcase
end 


always@(*)begin 
case(current)
s0:begin busy=1'b0;
ser_en=1'b0;
par_en=1'b0;
sel=2'b11;
end
s1:begin sel=2'b00;
ser_en=1'b1;
busy=1'b1;
par_en=1'b1; end
s2:begin sel=2'b01;
par_en=1'b0;
busy=1'b1;
ser_en=1'b1; end
s3: begin sel=2'b10;
busy=1'b1; 
ser_en=1'b0;
par_en=1'b0;
end 
s4: begin sel=2'b11;
busy=1'b1;
ser_en=1'b0;
par_en=1'b0; end
default: begin sel=2'b11;
ser_en=1'b0;
par_en=1'b0;
busy=1'b0; end 
endcase 
end


endmodule 
