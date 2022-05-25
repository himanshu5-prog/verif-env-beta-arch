interface beta_if (input logic  CLK);
  import my_pkg::instruction_t;
  logic RST;
  instruction_t INSTR;
  
  modport processor_mp (input CLK, RST, INSTR );
  modport stimulus_mp (output INSTR, input CLK, RST );
endinterface