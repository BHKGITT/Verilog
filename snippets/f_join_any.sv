///////////////////////snippet-1////////////////////////////
module test;
  initial
    begin
      #1 $display("#1 executes @t:%0t",$time);
      #2 $display("#2 executes @t:%0t",$time);
      fork
        #6 $display("#6 executes @t:%0t",$time);
        #7 $display("#6-1 executes @t:%0t",$time);
       begin
          #3 $display("#3 executes @t:%0t",$time);
          #3 $display("#3-1 executes @t:%0t",$time);
       end
       begin
          #5 $display("#5 executes @t:%0t",$time);
          #5 $display("#5-1 executes @t:%0t",$time);
       end
        begin
          #4 $display("#4 executes @t:%0t",$time);
          #3 $display("#4-1 executes @t:%0t",$time);
        end
      join_any
      #2 $display("#2 exits @t:%0t",$time);
      #2 $display("#2-1 exits @t:%0t",$time);
    end
endmodule
//Output
/*
#1 executes @t:1
#2 executes @t:3
#3 executes @t:6
#4 executes @t:7
#5 executes @t:8
#6 executes @t:9
#3-1 executes @t:9
#6-1 executes @t:10
#4-1 executes @t:10
#2 exits @t:11
#5-1 executes @t:13
#2-1 exits @t:13

*/

//////////////////////////snippet-2//////////////////////
module test;
  initial
    begin
      #1 $display("#1 executes @t:%0t",$time);
      #2 $display("#2 executes @t:%0t",$time);
      fork
        #1 $display("#1-1 executes @t:%0t",$time);
   //     #7 $display("#6-1 executes @t:%0t",$time);
       begin
          #3 $display("#3 executes @t:%0t",$time);
          #3 $display("#3-1 executes @t:%0t",$time);
       end
       begin
          #5 $display("#5 executes @t:%0t",$time);
          #5 $display("#5-1 executes @t:%0t",$time);
       end

        begin
          #4 $display("#4 executes @t:%0t",$time);
          #3 $display("#4-1 executes @t:%0t",$time);
        end
      join_any
      #2 $display("#2 exits @t:%0t",$time);
      #2 $display("#2-1 exits @t:%0t",$time);
    end
endmodule
//Output
/*
#1 executes @t:1
#2 executes @t:3
#1-1 executes @t:4
#3 executes @t:6
#2 exits @t:6
#4 executes @t:7
#5 executes @t:8
#2-1 exits @t:8
#3-1 executes @t:9
#4-1 executes @t:10
#5-1 executes @t:13

*/
