module random_inst_gen (output inst_t inst, input logic CLK );
  // For reg type instruction
  logic [5:0] op;
  logic [4:0] src1;
  logic [4:0] src2;
  logic [10:0] unused;
  
  logic [15:0] literal;
  logic [4:0] dest;
  import my_pkg::*;  
  bit ok_op, ok_src1, ok_src2, ok_unused, ok_literal, ok_dest;
  string opcode;
  always@(posedge CLK)
    begin
      randcase
      30:
      	begin
      	  ok_op = std::randomize(op) with { op inside {[6'h20:6'h26], [6'h28:6'h2E] }; };
          assert (ok_op);
          ok_src1 = std :: randomize(src1);
          assert (ok_src1);
      	  ok_src2 = std::randomize(src2);
      	  assert (ok_src2);
          ok_dest = std::randomize (dest) with {dest < 5'b11111;} ;
      	  assert (ok_dest);
      	  ok_unused = std :: randomize(unused);
          assert (ok_unused);
      	  inst.REG.op = op;
          inst.REG.src1 = src1;
      	  inst.REG.src2 = src2;
      	  inst.REG.dest = dest;
          inst.REG.unused = unused;
      
      	  //getOpcode (inst, opcode);
          //$display ("random_inst_gen :: opcode: %s, instr: %0b (%0h), %d\n", opcode, inst, inst, $time);
        end
      
      25:
      	begin
          ok_op = std::randomize (op) with { op inside {[6'h30:6'h36], [6'h38:6'h3E]};};
          assert (ok_op);
          ok_src1 = std :: randomize(src1);
          assert (ok_src1);
          ok_dest = std::randomize (dest) with {dest < 5'b11111;} ;
      	  assert (ok_dest);
          ok_literal = std :: randomize (literal);
          assert (ok_literal);
          inst.LITERAL.op = op;
          inst.LITERAL.src1 = src1;
          inst.LITERAL.dest = dest;
          inst.LITERAL.literal = literal;
        end
      15:
        begin
          ok_op = std :: randomize (op) with {op inside { [6'h1B:6'h1D]};};
          assert (ok_op);
          ok_src1 = std :: randomize(src1);
          assert (ok_src1);
          ok_dest = std::randomize (dest) with {dest < 5'b11111;} ;
      	  assert (ok_dest);
          ok_literal = std :: randomize (literal);
          assert (ok_literal);
          
          inst.BRANCH.op = op;
          inst.BRANCH.src1 = src1;
          inst.BRANCH.dest = dest;
          inst.BRANCH.literal = literal;
        end
      15: 
      	begin
          ok_op = std:: randomize (op) with {op inside {6'h18, 6'h1F};};
          $display ("random_inst_gen :: load is selected: %0H ", op );
          assert (ok_op);
          ok_src1 = std :: randomize(src1);
          assert (ok_src1);
          ok_dest = std::randomize (dest) with {dest < 5'b11111;} ;
      	  assert (ok_dest);
          ok_literal = std :: randomize (literal);
          assert (ok_literal);
          
          inst.LOAD.op = op;
          inst.LOAD.src1 = src1;
          inst.LOAD.dest = dest;
          inst.LOAD.literal = literal;
          $display ("   inst: %0h\n", inst);
        end
      15:
      	begin
          ok_op = 6'h19;
          assert (ok_op);
          ok_src1 = std :: randomize(src1);
          assert (ok_src1);
          ok_dest = std::randomize (dest) with {dest < 5'b11111;} ;
      	  assert (ok_dest);
          ok_literal = std :: randomize (literal);
          assert (ok_literal);
          
          inst.STORE.op = op;
          inst.STORE.src1 = src1;
          inst.STORE.dest = dest;
          inst.STORE.literal = literal;
        end
      endcase
      
    end
  
endmodule