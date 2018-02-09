module top;
   reg clk;
   always #5 clk = (clk === 1'b0);
   
   reg res;
   reg en;
   
   wire [7:0] result;

   wire [127:0] rnd;
   
   generator uut(
                 .clk(clk),
                 .res(res),
                 .en(en),
                 .count(result)
                 );

   reg [4095:0] vcdfile;

   assign rnd = $random;
   
   initial begin
      if ($value$plusargs("waveform=%s", vcdfile)) begin
	 $dumpfile(vcdfile);
	 $dumpvars(0, top);
      end
      $monitor("Random @%t/%d = %d", $time, clk, rnd);

      @(posedge clk);
      res <= 1;
      en <= 0;
      @(posedge clk);
      $display("Display %d, %d @%d", res, en, $time);
      $strobe("Strobe  %d, %d @%d", res, en, $time);
      res <= 0;
      en <= 1;
      repeat (5) @(posedge clk);
      en <= 0;
      repeat (5) @(posedge clk);      
      
      $display("Before finish at %t", $time);
      $finish;
   end

endmodule
