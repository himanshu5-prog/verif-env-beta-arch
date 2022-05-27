`include "my_pkg.svh"
module Beta (beta_if.processor_mp bus);
  timeunit 1ns;
  timeunit 1ns;
  string opcode;
  import my_pkg::*;
  always @(posedge bus.CLK) begin
    //$display ("design :: reset value: %0b\n", bus.RST);
    if (bus.RST)
      begin
        $display ("Reset mode: instr: %d, %d\n",bus.INSTR, $time);
      end
    else
      begin
        getOpcode (bus.INSTR, opcode);
        $display ("Design :: Instr:  %16b (%0h), %d %s :: ", bus.INSTR, bus.INSTR, $time, opcode);
        
        if (bus.INSTR[31:26] == 6'h19) // store
          begin
            $display ("src1: %d | dest: %d\n", bus.INSTR[25:21], bus.INSTR[20:16]);
          end
        else if (bus.INSTR[31:30] == 2'b01) // branch/load
          begin
            $display ("dest: %d | src1: %d\n", bus.INSTR[25:21], bus.INSTR[20:16]);
          end
        else if (bus.INSTR[31:30] == 2'b10) // reg instr
          begin
            $display ("src1: %d | src2: %d | dest: %d\n", bus.INSTR[25:21], bus.INSTR[20:16], bus.INSTR[15:11]);
          end
        else if (bus.INSTR[31:30] == 2'b11) // literal instruction
          begin
            $display ("src1: %d | dest: %d | literal: %b\n", bus.INSTR[25:21], bus.INSTR[20:16], bus.INSTR[15:0]);
          end
         
      end
  end
endmodule;