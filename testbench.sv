`include "my_pkg.svh"
`include "beta_interface.svh"
`include "clk_generator.sv"
`include "dut_driver.sv"
`include "rst_generator.sv"

module Beta_tb;
  logic CLK;
  logic RST;
  
  import my_pkg:: *;
  
  beta_if stim_if(.CLK);
  
  //Reset generator
  rst_generator reset_gen (.RST(RST));
  //--------
  //Clock generator
  clk_generator clk_gen(CLK);
  //---------------
  dut_driver drv(.bus(stim_if.stimulus_mp));
  //DUT - Beta processor  
  Beta beta(.bus (stim_if.processor_mp));

endmodule: Beta_tb