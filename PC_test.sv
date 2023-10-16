`timescale 1ns / 1ps

module PC_test;

    // Inputs
    logic CLK;
    logic RST;

    // Outputs
    logic [31:0] PC;
    logic [31:0] PC_OUT;

    // Instantiate the Unit Under Test (UUT)
    PC uut (
        .CLK(CLK), 
        .RST(RST), 
        .PC(PC), 
        .PC_OUT(PC_OUT)
    );
	
	
	  // Clock generation
     always 
			#10 CLK = ~CLK;
	
    initial begin
        // Initialize Inputs
        CLK = 0;
        RST = 0;
			
        // Wait 100 ns for global reset to finish
        #100;
        
        // Deassert reset
        RST = 1;
        
        // Run the simulation for a fixed duration
        #1000;
        
        // Terminate the simulation
        $finish;
    end
endmodule
