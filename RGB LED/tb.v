module tb;
	reg clock,reset;
	wire[1:0] state;
	wire[3:0] count;
//DUT Instantiation
	rgb DUT(clock,reset,state,count);
//Clock Generation
initial
	begin
		clock=1'b0;
		forever#5 clock =~ clock;
	end
//Reset task
task RESET;
	begin
	@(negedge clock);
	reset = 1'b1;
	@(negedge clock);
	reset = 1'b0;
	end
endtask
initial
	begin
		RESET;
		#300 $finish;
	end
endmodule
