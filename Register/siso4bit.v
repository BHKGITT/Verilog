module siso4bit(input clk,reset,sin,output s_out);
  reg[3:0]q;
always@(posedge clk)
  begin
	if(reset)
		begin
			q<=4'b0;
	  	end
	else
		q<={sin,q[3:1]};
	/*	q[3]<=sin;
		q[2]<=q[3];
		q[1]<=q[2];
		q[0]<=q[1]; */
  end
  assign s_out=q[0];
endmodule
