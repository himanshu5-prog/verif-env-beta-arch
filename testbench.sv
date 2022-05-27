`include "beta_interface.sv"
`include "clk_generator.sv"
`include "dut_driver.sv"
`include "rst_generator.sv"
`include "random_inst_gen.sv"
`include "coverage_monitor.sv"
module Beta_tb;
  logic CLK;
  logic RST;
  
  inst_t inst;
  string opcode = "";
  
  //Interface
  beta_if stim_if(.CLK(CLK), .RST(RST));
  
  //random instruction generator (to driver)
  random_inst_gen inst_gen(.inst(inst), .CLK(CLK));
  
  //Reset generator
  rst_generator reset_gen (.RST(RST));
  //--------
  //Clock generator
  clk_generator clk_gen(CLK);
  //---------------
  //dut_driver drv(.bus(stim_if.stimulus_mp), .inst(inst) );
  dut_driver drv(.bus(stim_if.stimulus_mp), .inst(inst) );
  
  //Beta processor
  Beta beta(.bus (stim_if.processor_mp));
  
  //coverage monitor
  //coverage_monitor cov_mon (.bus (stim_if.cov_mon_mp));
  coverage_monitor cov_mon (.INST (inst), .CLK(CLK), .RST(RST));
  
endmodule: Beta_tb