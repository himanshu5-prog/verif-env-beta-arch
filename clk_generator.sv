module clk_generator(output logic CLK);
  initial
    begin
      CLK = 1'b0;
      
      forever
        begin
        	#10 CLK = !CLK;
          if ($time == 800ns) $finish;
        end
    end
endmodule