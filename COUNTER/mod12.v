module mod12(clock,reset,load,mode,data_in,count_out);
	input clock,reset,load,mode;
	input [3:0]data_in;
	output reg[3:0]count_out;
always@(posedge clock)
		begin
			if(reset)
				count_out<=4'b0;
			else if(load)
				count_out<=data_in;
			else if(mode) //UPCOUNT
				begin
					if(count_out==4'b1011)
						count_out<=4'b0;
					else
						count_out<=count_out+1'b1;
 				end	
			else //DOWNCOUNT
				begin
					if(count_out==4'b0)
						count_out<=4'b1011;
				        else
				                count_out<=count_out-1'b1;
				end
		end
endmodule
