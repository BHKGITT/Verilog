module ram(input we_in,enable_in,
	   input [3:0]addr_in,
	   inout [7:0]data);
					
					 
   //Step1 : Declare a 8 bit wide memory having 16 locations.

   //Understand the logic for writing data into a memory location 
   always@(data,we_in,enable_in,addr_in)
      if(we_in && !enable_in)
	 mem[addr_in]=data;

   //Understand the logic of reading data from a memory location 
   assign data= (enable_in && !we_in) ? mem[addr_in] : 8'hzz;

endmodule 

