module tb;
parameter WIDTH=8,DEPTH=8,ADDR=3;

reg clock,reset,wr_en,rd_en;
reg [WIDTH-1:0]data_in;
wire [WIDTH-1:0]data_out;
wire full,empty;


fifo DUT(clock,reset,wr_en,rd_en,data_in,full,empty,data_out);
//Clock generation
initial
begin
	clock=1'b0;
	forever #5 clock =~ clock;
end
//Reset clock
task RESET;
	begin
	  @(negedge clock);
		reset = 1'b1;
	  @(negedge clock);
		reset = 1'b0;
	end
endtask
//Write task
task WRITE;
	begin
		@(negedge clock);
		wr_en = 1'b1;
		rd_en = 1'b0;
		data_in = $urandom;			
		$display("WRITE:wr_en=%b,rd_en=%b,data_in=%0d",wr_en,rd_en,data_in);
	end
endtask
//Read task
task READ;
	begin
		@(negedge clock);
		wr_en = 1'b0;
		rd_en = 1'b1;
		$display("READ:wr_en=%b,rd_en=%b,data_out=%0d",wr_en,rd_en,data_out);
	end
endtask
//CALLING WRITE & READ task
initial
	begin
		RESET;
    repeat(7)
		WRITE;
		#10;
		 READ;
		#300 $finish;
        end
initial
	begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end
endmodule
