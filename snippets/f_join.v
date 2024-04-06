module test;
  initial
    begin
      #5 $display("#5 executes @t:%0t",$time);
      #2 $display("#5-1 executes @t:%0t",$time);
      fork
        #1 $display("#1 executes @t:%0t",$time);
        #1 $display("#1-1 executes @t:%0t",$time);
        #1 $display("#1-2 executes @t:%0t",$time);
        begin
          #2 $display("#2 executes @t:%0t",$time);
          #2 $display("#2-1 executes @t:%0t",$time);
        end
        begin
          #3 $display("#3 executes @t:%0t",$time);
          #3 $display("#3-1 executes @t:%0t",$time);
        end
      join
      #4 $display("#4 executes @t:%0t",$time);
      #6 $display("#6 executes @t:%0t",$time);
    end
endmodule
//Output
#5 executes @t:5
#5-1 executes @t:7
#1-2 executes @t:8
#1-1 executes @t:8
#1 executes @t:8
#2 executes @t:9
#3 executes @t:10
#2-1 executes @t:11
#3-1 executes @t:13
#4 executes @t:17
#6 executes @t:23
