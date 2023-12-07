module ALU #(
		 parameter DATA_WIDTH = 32,
		 parameter ALUSel_WIDTH = 4
	)(
		 input logic [DATA_WIDTH-1:0] BUS_A,  //register rs1
		 input logic [DATA_WIDTH-1:0] BUS_B,  //register rs2
		 input logic [ALUSel_WIDTH-1:0] ALUSel,   //ALUSel control signal
		 output logic [DATA_WIDTH-1:0] ALU_OUT,   //ALU output
		 output logic ZERO_FLAG, NEG_FLAG   //zero and negative flags
	);
	
	// ALU operation control signals
	parameter ADD = 4'b0000;
	parameter SUB = 4'b0001;
	parameter SLL = 4'b0010;
	parameter SLT = 4'b0011;
	parameter SLTU = 4'b0100;
	parameter XOR = 4'b0101;
	parameter SRL = 4'b0110;
	parameter SRA = 4'b0111;
	parameter OR =  4'b1000;
	parameter AND = 4'b1001;

	
	always_comb begin
		case(ALUSel)
			ADD: 
				ALU_OUT = BUS_A + BUS_B;
			SUB: 
				ALU_OUT = BUS_A - BUS_B;
			SLL: //shift left logical
				ALU_OUT = BUS_A << $unsigned(BUS_B);
			SLT: //set if less than, 2's complement 
				ALU_OUT = BUS_A < BUS_B;
			SLTU: //set if less than, unsigned
				ALU_OUT = $unsigned(BUS_A) << $unsigned(BUS_B);
			XOR: 
				ALU_OUT = BUS_A ^ BUS_B;
			SRL: //shif right logical
				ALU_OUT = BUS_A >> $unsigned(BUS_B);
			SRA: //shift right arithmetic
				ALU_OUT = BUS_A >>> $unsigned(BUS_B);
			OR:  
				ALU_OUT = BUS_A | BUS_B;
			AND: 
				ALU_OUT = BUS_A & BUS_B;
		
			default: ALU_OUT = {DATA_WIDTH{1'b0}};  // Default to zero if an unsupported operation is specified
		endcase
		
				
		assign ZERO_FLAG = (ALU_OUT == 0) ? 1'b1 : 1'b0;
		assign NEG_FLAG = (ALU_OUT < 0) ? 1'b1 : 1'b0;
		
	end
endmodule
	