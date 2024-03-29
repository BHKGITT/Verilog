//////////////////////////// RED,GREEN,BLUE(RGB) Blinking LED ///////////////////////////////
module rgb(clock,reset,state,count);
	parameter RED=2'b00,
		  GREEN=2'b01,
		  BLUE=2'b10;
	input clock,reset;
	output reg[1:0] state;
	output reg[3:0] count;
  
always@(posedge clock)
	begin
		if(reset)
			begin
				state <= RED;
				count <= 4'b0;
			end
		else if(state == RED)
			begin
				count <= count+1;
				if(count == 4'd5)
					state <= GREEN;
			end
		else if(state == GREEN)
			begin
				count <= count+1;
				if(count == 4'd10)
					state <= BLUE;		
			end
		else if(state == BLUE)
			begin
				count <=count+1;
				if(count == 4'd15)
					state <= RED;
			end		
	end
endmodule
