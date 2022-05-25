module dut_driver 
(
   beta_if.stimulus_mp bus
);
  import my_pkg::*;
  inst_reg inst;
  initial
    begin
      inst.op = 6'h20;
      inst.src1 = 5'h1;
      inst.src2 = 5'h2;
      inst.dest = 5'h3;
      inst.unused = 11'h1;
    end
  always@(posedge bus.CLK)
    begin: instr_gen
      if (bus.RST)
        bus.INSTR <= 16'h0000;
      else
        bus.INSTR <= {inst.op, inst.src1, inst.src2, inst.dest, inst.unused};
    end: instr_gen
endmodule