module dualport816(input rst,wrclk,reclk,[15:0]din,
                   input [2:0]readadd,writeadd,
		   output reg [15:0]dout);
reg [15:0]mem[7:0];
integer i;
always@(wrclk or posedge rst)
begin
if(rst)
begin
for(i=0;i<8;i=i+1)
mem[i]=0;
end
else
mem[writeadd]=din;
end

always@(reclk or posedge rst)
begin
if(rst)
dout<=16'h0;
else
dout<=mem[readadd];
end
endmodule
