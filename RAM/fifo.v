module fifo(input clk,rst,wr,re,input [7:0]din,
		output reg [7:0]dout,output  reg full,empty);
reg [15:0]mem[7:0];
reg [3:0]readpointer=4'b0000;
reg [3:0]writepointer=4'b0000;
integer i;
always@(posedge clk)
begin

if(rst)
begin
dout<=8'b0;
for(i=0;i<16;i=i+1)
mem[i]<=0;
end

else if(wr && !full)
begin
mem[writepointer]<=din;
writepointer<=writepointer+1;
end


else if(re && !empty)
begin
dout<=mem[readpointer];
readpointer<=readpointer+1;
end


end
assign full=(writepointer==4'b1111)?1'b1:1'b0;
assign empty=(readpointer==4'b1111)?1'b1:1'b0;
endmodule




