interface beta_if (input logic  CLK, input logic RST);
  import my_pkg::inst_t;
  logic RST;
  //instruction_t INSTR;
  inst_t INSTR;
  
  modport processor_mp (input CLK, RST, INSTR );
  modport cov_mon_mp (input CLK, RST, INSTR );
  modport stimulus_mp (output INSTR, input CLK, RST );
endinterface