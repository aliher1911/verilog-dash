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

   initial begin
      if ($value$plusargs("waveform=%s", vcdfile)) begin
	 $dumpfile(vcdfile);
	 $dumpvars(0, top);
      end
      $monitor("UUT @%t/%d, res %d, en %d, %h", $time, clk, res, en, result);

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

      @(posedge clk);

      $display("Deposit1 %d, %d", res, en, $time);
      $strobe("Deposits %d, %d", res, en, $time);

      $deposit(uut.en, 1);
      $display("Deposit2 %d, %d", res, en, $time);
      res <= 1'bz;
      $display("Deposit3 %d, %d", res, en, $time);      
      repeat (5) @(posedge clk);      
      
      $display("Before finish at %t", $time);
      $finish;
   end

endmodule
