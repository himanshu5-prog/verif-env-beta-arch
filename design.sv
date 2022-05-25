module Beta (beta_if.processor_mp bus);
  timeunit 1ns;
  timeunit 1ns;
  
  always @(posedge bus.CLK) begin
    if (bus.RST)
      begin
        $display ("Reset mode\n");
      end
    else
      begin
        $display ("Instr: %0b\n", bus.INSTR);
      end
  end
endmodule;