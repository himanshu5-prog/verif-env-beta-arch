module rst_generator (output logic RST);
  initial
    begin
      RST = 1'b1;
      
      #45ns RST = 1'b0;
    end
endmodule