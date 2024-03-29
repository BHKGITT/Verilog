//////////////////////////////////////////////////// FIFO RTL ////////////////////////////////////////////
module fifo(clock,reset,wr_en,rd_en,data_in,full,empty,data_out);
   parameter WIDTH=8,DEPTH=8,ADDR=3;
   input clock,reset,wr_en,rd_en;
   input[WIDTH-1:0]data_in;
   output reg[WIDTH-1:0]data_out;
   output full,empty;

   reg[WIDTH-1:0]fifo[DEPTH-1:0];
   reg[DEPTH-1:0]rd_ptr,wr_ptr;

//RESET LOGIC  
always@(posedge clock)
   	begin
	   if(reset)
	  	begin
			data_out <= 8'b0;
	       		wr_ptr<=3'b0;
			rd_ptr<=3'b0;
                end
end
//WRITE LOGIC
always@(posedge clock)
	begin
		if(wr_en && !full)
                 	begin
                 		fifo[wr_ptr] <= data_in;
                   		wr_ptr <= wr_ptr+1'b1;
                	 end
end
//READ LOGIC
always@(posedge clock)
	begin
		if(rd_en && !empty)
                 	begin
                 		data_out <= fifo[rd_ptr];
                   		rd_ptr <= rd_ptr+1'b1;
                	 end
	end
  // assign full=((wr_ptr+1) == rd_ptr);
  // assign empty=(wr_ptr==rd_ptr); 
   assign full=((wr_ptr==8)&&(rd_ptr==0))?1'b1:1'b0;
   assign empty=(wr_ptr==rd_ptr)?1'b1:1'b0;
endmodule

   
