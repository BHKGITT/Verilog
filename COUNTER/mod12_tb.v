module tb;
  reg clock,reset,load,mode;
  reg [3:0]data_in;
  wire [3:0]count_out;
  
  //Instantiation
 mod12 DUT(clock,reset,load,mode,data_in,count_out);
  
 //Clock generation
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
//Stimulus
task STIMULUS(input [3:0]i,input a,b);
	begin
		@(negedge clock);
		data_in=i;
		load=a;
		#15 load=1'b0;
		mode=b;
	end
endtask
//Task call
initial
	begin
		Reset;
		STIMULUS(4'b0010,1'b1,1'b1);
		#100;
		STIMULUS(4'b0101,1'b1,1'b0);
		#50;
		STIMULUS(4'b1010,1'b1,1'b1);
		#50;
		STIMULUS(4'b1000,1'b1,1'b0);
		#25;
		STIMULUS(4'b0011,1'b1,1'b1);
		#50 $finish;
	 end
//Print values
initial
	$monitor("input clock=%b,reset=%b,load=%b,mode=%b,data_in=%0d,output count_out=%0d",clock,reset,load,mode,data_in,count_out);
//waveform dump
initial
begin
	$fsdbDumpvars(0,tb);
end
endmodule

