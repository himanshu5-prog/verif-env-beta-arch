module coverage_monitor (beta_if.cov_mon_mp bus);
  covergroup cg @(posedge bus.CLK iff !bus.RST);
    coverpoint bus.INSTR[31:26] {
    	bins reg_type = {[6'h20:6'h26], [6'h28:6'h2E]};
    	bins literal_type = {[6'h30:6'h36], [6'h38:6'h3E]};
    	bins branch_type = {[6'h1B:6'h1D]};
    	bins load_type = {6'h18, 6'h1F};
    	bins store_type = {6'h19};
    }
  endgroup
  
  cg cov = new;
endmodule