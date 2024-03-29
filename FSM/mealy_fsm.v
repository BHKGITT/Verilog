//FSM Mealy Overlapping for seq 1011

module mfsm(input clock,reset,seq_in,output reg out);
//States declaration by Parameter
parameter A=2'b00,
	  B=2'b01,
	  C=2'b10,
	  D=2'b11;
//Declaring Present_state & Next_state var
reg[1:0] PS,NS;
//Present State LOgic
always@(posedge clock)
	begin
		if(reset)
			PS<=A;
    else
			PS<=NS;
	end
//Next State Logic
always@(*)
	begin
		NS=A;
		case(PS)
			A:if(seq_in)
				NS=B;
			  else
				NS=A;
			B:if(seq_in)
				NS=B;
			  else
				NS=C;
			C:if(seq_in)
				NS=D;
			  else
				NS=A;
			D:if(seq_in)
				NS=B;
			  else
				NS=C;			
		endcase
	end
//Output Logic
always@(posedge clock)
	begin
		out<=1'b0;
		case(PS)
		A,B,C:out <=1'b0;
		   D:if(seq_in)
			out<=1'b1;
		     else
			out<=1'b0;
		endcase
	end
endmodule
