import my_pkg::inst_t;
module dut_driver 
(
   beta_if.stimulus_mp bus, input inst_t inst
);
  always@(posedge bus.CLK)
    begin: instr_gen
      if (bus.RST) begin
        //$display ("driver :: RESET MODE, %d\n", $time );
        bus.INSTR <= 32'h0000;
      end
      else
        bus.INSTR <= inst;
    end: instr_gen
endmodule