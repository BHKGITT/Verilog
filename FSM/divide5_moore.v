module fsm_more(rst,clk,seq,out);
  parameter S0=3'b000,
	    S1=3'b001,
            S2=3'b010,
	    S3=3'b011,
	    S4=3'b100;
  input seq,rst,clk;
  output out;
  reg[2:0]present_state,next_state;

//Input logic
  always@(posedge clk)
    begin
	    if(rst)
		    present_state=S0;
	    else
		    present_state=next_state;
    end
//Next state logic
  always@(*)
	    begin
		    case(present_state)
			    S0:if(seq==1)
			    		next_state=S1;
		            	else
				    	next_state=S0;
			    S1:if(seq==1)
			    		next_state=S3;
		            else
				    	next_state=S2;
			    S2:if(seq==1)
			    		next_state=S0;
		            else
				 	next_state=S4;
			    S3:if(seq==1)
			    		next_state=S2;
		            else
				    	next_state=S1;
			    S4:if(seq==1)
			    		next_state=S4;
		            else
				    	next_state=S3;
			    default:
					next_state=S0;
		    endcase
	  end
//Output logic
assign out=(present_state==S0)?1'b1:1'b0;
endmodule
