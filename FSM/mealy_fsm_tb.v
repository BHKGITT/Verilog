//Testbench code
module tb;
	reg clock,reset,seq_in;
	wire out;
//DUT instantiation
mfsm DUT(clock,reset,seq_in,out);
//Clock Generation
initial
	begin
		clock=1'b0;
		forever#5 clock=~clock;
	end
//Reset task
task Reset;
begin
	@(negedge clock);
	reset=1'b1;
	@(negedge clock);
	reset=1'b0;
end
endtask
//Stimulus task
task STIMULUS(input a);
begin
	@(negedge clock);
	seq_in=a;
end
endtask
//Calling all task
initial
	begin
		Reset;
	        STIMULUS(1);
		STIMULUS(0);
		STIMULUS(1);	
		STIMULUS(1);
		#20;
		STIMULUS(0);
		STIMULUS(1);
		STIMULUS(0);
		STIMULUS(1);
		#10;
		Reset;
		#100 $finish;
	end
initial
	$monitor("reset=%b,seq_in=%b,out=%b",reset,seq_in,out);
endmodule
