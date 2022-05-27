`ifndef _PKG_
`define _PKG_
package my_pkg;
	
	typedef logic [31:0] instruction_t;
	string opcodeMap [int];

	function void printMyPkg();
  		$display ("Here is the package!\n");
	endfunction
	
	typedef struct packed {
  		logic [5:0] op;
  		logic [4:0] src1;
  		logic [4:0] src2;
  		logic [4:0] dest;
  		logic [10:0] unused;
	} inst_reg_t;
   
	typedef struct packed {
  		logic[5:0] op;
  		logic [4:0] src1;
  		logic [4:0] dest;
  		logic [15:0] literal;
	} inst_literal_t;

	typedef struct packed {
  		logic [5:0] op;
  		logic [4:0] dest;
  		logic [4:0] src1;
  		logic [15:0] literal;
	} inst_branch_t;

	typedef struct packed {
  		logic [5:0] op;
  		logic [4:0] dest;
  		logic [4:0] src1;
  		logic [15:0] literal;
	} inst_load_t;

	typedef struct packed {
  		logic [5:0] op;
  		logic [4:0] src1;
  		logic [4:0] dest;
  		logic [15:0] literal;
	} inst_store_t;

	typedef union packed {
  		inst_reg_t REG;
  		inst_literal_t LITERAL;
  		inst_load_t LOAD;
  		inst_store_t STORE;
  		inst_branch_t BRANCH;
	} inst_t;

	task getOpcode (input inst_t inst, output string answer);
   //string answer;
  
  //always_comb
  		case (inst[31:26])
    		6'h20: answer = "ADD";
        	6'h30: answer = "ADDC";
        	6'h28  : answer = "AND";
        	6'h38  : answer = "ANDC";
        	6'h24  : answer = "CMPEQ";
        	6'h34  : answer = "CMPEQC";
        	6'h26  : answer = "CMPLE";
        	6'h36  : answer = "CMPLEC";
        	6'h25  : answer = "CMPLT";
        	6'h35  : answer = "CMPLTC";
        	6'h23  : answer = "DIV";
        	6'h33  : answer = "DIVC";
        	6'h1C  : answer = "BEQ";
        	6'h1D  : answer = "BNE";
        	6'h1B  : answer = "JMP";
        	6'h18  : answer = "LD";
        	6'h1F  : answer = "LDR";
        	6'h22  : answer = "MUL";
        	6'h32  : answer = "MULC";
        	6'h29  : answer = "OR";
        	6'h39  : answer = "ORC";
        	6'h2C  : answer = "SHL";
        	6'h3C  : answer = "SHLC";
        	6'h2D  : answer = "SHR";
        	6'h3D  : answer = "SHRC";
        	6'h2E  : answer = "SRA";
        	6'h3E  : answer = "SRAC";
        	6'h21  : answer = "SUB";
        	6'h31  : answer = "SUBC";
        	6'h19  : answer = "ST";
        	6'h2A  : answer = "XOR";
        	6'h3A  : answer = "XORC";
    		6'h2B: answer = "XNOR";
    		6'h3B: answer = "XNORC";
    		default: answer = "NA";
  		endcase
	endtask
    
endpackage
`endif