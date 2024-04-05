module tb;
  integer a,b,c,d;
  initial
    	begin
          	#8 a <= #8 1; //16
          		 c = #2 2; //10
            #12	b = #4 0;//26
           	#5 d = #3 3;//34
        end
  initial
    begin
      $monitor("@t:%0t,a:%0d,b:%0d.c:%0d,d=%0d",$time,a,b,c,d);
    end
endmodule
//Output
@t:0,a:x,b:x.c:x,d=x
@t:10,a:x,b:x.c:2,d=x
@t:16,a:1,b:x.c:2,d=x
@t:26,a:1,b:0.c:2,d=x
@t:34,a:1,b:0.c:2,d=3
