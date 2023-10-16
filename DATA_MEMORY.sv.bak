module DATA_MEMORY #(
		parameter DATA_WIDTH = 32,
		parameter MEM_ADD_SIZE = 9
		
	)(
		input logic CLK,
		input logic MEM_R,  //control signal
		input logic MEM_W, //control signal
		input logic [DATA_WIDTH-1:0] MEM_ADDRESS,  //check size //ALU_OUT=memory address
		input logic [DATA_WIDTH-1:0] MEM_DATA_W,
		output logic [DATA_WIDTH-1:0] MEM_DATA_R
		//input logic [1:0] load_store_type, 
		//input logic load_unsigned,
	);
	
	// Memory: NUM_LOCS locations with 4 bytes each
	//logic [3:0][7:0] memory [NUM_LOCS-1:0];
	
	logic [DATA_WIDTH-1:0] MEMORY [(2**MEM_ADD_SIZE)-1:0];
	
	always_comb begin
		MEM_DATA_R = '1; // default value
		if(MEM_R)
			MEM_DATA_R = MEMORY[MEM_ADDRESS];
			//mem_read_data[7:0] = memory[mem_addr >> 2][mem_addr & 'b11];
			
			/**
			case (load_store_type) 
				`LS_BYTE: begin
					if (load_unsigned) mem_read_data[DATA_WIDTH-1:8] = {(DATA_WIDTH-8){1'b0}};
					else mem_read_data[DATA_WIDTH-1:8] = {(DATA_WIDTH-8){mem_read_data[7]}};
				end
				`LS_HALF: begin
					mem_read_data[15:8] = memory[(mem_addr+1) >> 2][(mem_addr+1) & 'b11];
					if (load_unsigned) mem_read_data[DATA_WIDTH-1:16] = {(DATA_WIDTH-16){1'b0}};
					else mem_read_data[DATA_WIDTH-1:16] = {(DATA_WIDTH-16){mem_read_data[15]}};
				end
				`LS_WORD: begin
					mem_read_data[15:8] = memory[(mem_addr+1) >> 2][(mem_addr+1) & 'b11];
					mem_read_data[23:16] = memory[(mem_addr+2) >> 2][(mem_addr+2) & 'b11];
					mem_read_data[31:24] = memory[(mem_addr+3) >> 2][(mem_addr+3) & 'b11];
				end
				default: mem_read_data = 'b0;
			endcase
			**/
			
		end else MEM_DATA_R = 'b0;
		
	end
    
    always @(posedge CLK or negedge RST) begin
		/**
		if (!rstn) begin
			for (int i = 0; i < NUM_LOCS; i = i+1) memory[i] <= 32'b0;
		end else if (mem_write) begin
			for (int b = 0; b <= load_store_type; b = b+1) begin
				memory[(mem_addr+b) >> 2][(mem_addr+b) & 'b11] = mem_write_data[8*b+:8];
			end
		end 
		**/
		if (MEM_W)
			MEMORY[MEM_ADDRESS] = MEM_DATA_W;
		end	
    end
	 
endmodule