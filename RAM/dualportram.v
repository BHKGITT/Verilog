module dualportram(input clk,rst,re,wr,input[7:0]din,
                   input[3:0]readadd,input[3:0]writeadd,
		   output reg [7:0]dout);
reg [7:0]mem[15:0];
integer i;
always@(posedge clk)
begin
if(rst)
  begin
  dout=8'b00000000;
   for(i=0;i<16;i=i+1)
     begin
       mem[i]=0;
     end
   end
else if(re==1)
   dout=mem[readadd];
else if(wr==1)
   mem[writeadd]=din;
else
   dout=8'bzzzzzzzz;
end
endmodule
