package my_pkg;
  typedef logic [31:0] instruction_t;	
	string opcodeMap [int];

    /*
    task initialiseOpcodeMap ();
      initial
        begin
      opcodeMap = '{
       0x20: "ADD",
        0x28: "AND"
      };
        end
    endtask
    */
    function void printMyPkg();
      $display ("Here is the package!\n");
    endfunction
	
    typedef struct {
      rand logic [5:0] op;
      rand logic [4:0] src1;
      rand logic [4:0] src2;
      rand logic [4:0] dest;
      rand logic [10:0] unused;
    } inst_reg;
   
    typedef struct {
      rand logic[5:0] op;
      rand logic [4:0] src1;
      rand logic [4:0] dest;
      rand logic [15:0] literal;
    } inst_literal;

    /*
    task getOpcode (input int op);
       string answer;
    
      //always_comb
      	case (op)
        	6'h20: answer = "ADD";
        	6'h28: answer = "AND";
        	default: answer "NA";

      	endcase
    
      return answer;
    endtask
      */  
endpackage