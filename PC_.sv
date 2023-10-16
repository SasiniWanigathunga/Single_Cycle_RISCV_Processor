
module PC_ (
		input logic CLK, RST,
		input logic [31:0] PC_OFFSET,		// Branch
		//input logic [31:0] PC_JUMP,	// JALR
		input logic Branch,
		
		output logic [31:0] PC	// PC register
		//output logic [31:0] PC_OUT
	);

	logic [31:0] NEXT_PC;
	
	always @(posedge CLK or posedge RST) begin
		if (RST) 
			PC <= 32'b0;
		else 
			PC <= NEXT_PC;
	end
	

	always_comb begin
		if (!Branch)	
			NEXT_PC = PC + 4;
		//else if (branch_type == `JMP_JALR) 
			//next_pc = {target_pc[31:1], 1'b0};	// zero LSB
		else
			NEXT_PC = PC + PC_OFFSET;
	end
						 
	//assign PC_OUT = PC + 4;

endmodule