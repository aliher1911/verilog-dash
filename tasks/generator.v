module generator(
                 input        clk,
                 input        res,
                 input        en,
                 output [7:0] count
                 );

   reg [7:0]                  counter;

   initial begin
      // simulation hacks
      $monitor("Gen enabled %d", en);
   end
   
   always @(posedge clk) begin
      if (res) begin
         counter <= 0;
      end else if (en) begin
         counter <= count + 1;
      end
   end
   
   assign count = en ? counter : {8{1'bz}};
          
endmodule // generator
