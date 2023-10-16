module INS_MEMORY #(
		parameter INS_WIDTH = 32,
		parameter INS_ADD_SIZE = 7
	)(
		input logic [INS_ADD_SIZE-1:0] PC,
		output logic [INS_WIDTH-1:0] INS
	);

	logic [INS_WIDTH-1:0] INS_MEM [2**INS_ADD_SIZE-1:0];
	
	// Since PC is byte addressed, we must ignore last 2 bits when indexing
	assign instruction = memory[pc >> 2];
	
	
	
endmodule