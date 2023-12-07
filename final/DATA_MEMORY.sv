module DATA_MEMORY (
		input logic CLK, RST,
		input logic MEMR,  //control signal
		input logic MEMW, //control signal
		input logic [31:0] MEM_ADDRESS, //ALU_OUT=memory address
		input logic [31:0] MEM_DATA_W,
		output logic [31:0] MEM_DATA_R
		
	);
	
	logic [31:0] MEMORY [63:0];
	
	always_comb begin
		MEM_DATA_R = '1; // default value
		if(MEMR) begin
			MEM_DATA_R = MEMORY[MEM_ADDRESS];
		end else begin
			MEM_DATA_R = 'b0;
		end
	end
    
	 
    always @(posedge CLK or posedge RST) begin
		if (RST) begin
			for (int i = 0; i < 64; i = i+1) 
				MEMORY[i] <= 32'b0;
		end 
		else if (MEMW) begin
				MEMORY[MEM_ADDRESS] = MEM_DATA_W;
		end 
			
    end
	 
endmodule
