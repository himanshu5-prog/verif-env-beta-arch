# verif-env-beta-arch
Verification environment for Beta architecture processor

The environment consist of two parts: Testbench (testbench.sv) and DUT (design.sv).

1) Design: The design is just a dummy file which display instruction on console.

2) Testbench: Testbench consist of following modules:

    a) Random instruction generator (random_inst_gen.sv) generates random instruction with random dest/src/literal as applicable to instruction type.
    
    b) Clock generator (clk_generator.sv): This module generates the clock with time period of 20 ns. Simulation is finished at 800 ns.
    
    c) Reset generator (rst_generator.sv): This module generates the reset signal. It is 0 at t = 0 and set to 1 after 45 ns.
    
    d) Driver (dut_driver.sv): This module takes random instruction from random inst generator and provide it to bus interface (beta_interface.sv) which is connected to design.
    
    e) Coverage monitor (coverage_monitor.sv): This module takes instruction from random inst generator and generate coverpoints.
    
Apart from that, all typedefs and task definition are in my_pkg.sv.

I ran the code in eda playground environment and it was running as expected. Although, I was not able to test coverage since it was not supported by tool I was using in eda playground.
