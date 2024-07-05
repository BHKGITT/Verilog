module fsm_more_tb;
 parameter  S0=3'b000,
	    S1=3'b001,
            S2=3'b010,
	    S3=3'b011,
	    S4=3'b100;
    reg clk,seq,rst;
    wire out;

    fsm_more DUT(rst,clk,seq,out);
//Clock generation
    initial
    begin
	    clk=0;
	    forever #5 clk=~clk;
    end
//Initialize task
task initialize;
	begin
		seq=0;
	end
endtask
//Reset task
    task reset;
	    begin
		    @(negedge clk)
		    rst=1;
		    @(negedge clk)
		    rst=0;
	    end
    endtask
//Stimulus task
    task stimulus(input a);
	    begin
		    @(negedge clk)
		    seq=a;
	    end
    endtask
//Calling all task
    initial
    begin
	    initialize;
	    reset;
	    stimulus(1);
            stimulus(0);
            stimulus(1);
	    reset;
           // stimulus(1);
	    stimulus(1);
	    stimulus(1);
	    stimulus(0);
	    reset;
	    stimulus(1);
	    stimulus(0);
	    stimulus(0);			    
     #200 $finish;
    end
    initial
	    $monitor("seq=%b,out=%b",seq,out);
    endmodule
