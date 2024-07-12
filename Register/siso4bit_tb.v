module siso4bit_tb();
    reg clk,reset;
    reg sin;
    wire s_out;
//Instantiation
siso4bit DUT(clk,reset,sin,s_out);
//Clock generation
initial
	begin
		clk=0;
		forever #5 clk=~clk;
	end
//Reset task
task reset_t;
	begin
		@(negedge clk)
		reset=1'b1;
		@(negedge clk)
		reset=1'b0;
	end
endtask
//Stimulus task to apply input
task stimulus(input i);
	begin
		@(negedge clk)
		sin=i;
	end
endtask
//Calling all task's
initial
	begin
		reset_t;
		stimulus(1'b1);
        	stimulus(1'b1);
        	stimulus(1'b0);
		stimulus(1'b1);
		#40;
            	reset_t;
		stimulus(1'b1);
        	stimulus(1'b0);
        	stimulus(1'b0);
		stimulus(1'b1);
		#40;
            	reset_t;
		stimulus(1'b0);
        	stimulus(1'b1);
        	stimulus(1'b1);
		stimulus(1'b0);
		#60 $finish;
	end
//Sample required signals
initial
	$monitor("reset=%b,sin=%b,s_out=%b",reset,sin,s_out);
endmodule

