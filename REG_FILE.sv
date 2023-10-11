module REG_FILE #(
      parameter DATA_WIDTH   = 32,  
      parameter REG_ADD_WIDTH = 5, 
      parameter NUM_REGS = 2**REG_ADD_WIDTH
   )(
		input  CLK, RST,
		input  RegWEN,
		input  [REG_ADD_WIDTH-1:0] WRITE_REG, READ_REG_A, READ_REG_B,
		input  [DATA_WIDTH-1:0] REG_DATA_W, // data that supposed to be written into the register file  //signed
		output logic [DATA_WIDTH-1:0] READ_DATA_A, READ_DATA_B  //signed 
   );

	logic [DATA_WIDTH-1:0] REGISTER_FILE [NUM_REGS-1:0];  //32, 32 bit arrays  //unpacked array


	always @(posedge CLK or negedge RST) begin
		if(RST==1'b1) 
			for (int i = 0; i < NUM_REGS; i++)
				 REGISTER_FILE[i] <= 'b0;   //32 bit
		else if(RegWEN==1'b1 && WRITE_REG==1'b1)
			REGISTER_FILE[WRITE_REG] <=REG_DATA_W;
		
	end

	assign READ_DATA_A = REGISTER_FILE[READ_REG_A];
	assign READ_DATA_B = REGISTER_FILE[READ_REG_B];


endmodule
