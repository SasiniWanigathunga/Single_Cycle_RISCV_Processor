module DATAPATH #(
		parameter DATA_WIDTH = 32,
		parameter INS_WIDTH = 32,
		parameter MEM_ADD_WIDTH = 9,
		parameter REG_ADD_WIDTH = 5,
		parameter ALUSel_WIDTH = 4,
		parameter PC_WIDTH = 9
	)(
		//Control Signals
		input logic CLK, RST, //global clock & RST sets PC to 0
		input logic RegWEN,
		input logic [ALUSel_WIDTH-1:0] ALUSel,
		input logic ASel, BSel,
		input logic MEM_R, MEM_W,
		//input logic [1:0] load_store_type,
		//input logic load_unsigned,
		input logic WBSel,
		//input logic [2:0] branch_type,
		
		//Instruction
		input logic [31:0] INS
		
	);
	
	//REG_FILE
	logic [REG_ADD_WIDTH-1:0] WRITE_REG, READ_REG_A, READ_REG_B,
	logic [DATA_WIDTH-1:0] READ_DATA_A, 
	logic [DATA_WIDTH-1:0] READ_DATA_A, READ_DATA_B,  //signed 
	
	//ALU 
	logic [DATA_WIDTH-1:0] BUS_A,  //register rs1
	logic [DATA_WIDTH-1:0] BUS_B,  //register rs2
	logic [DATA_WIDTH-1:0] ALU_OUT,   //ALU output
	logic ZERO_FLAG, NEG_FLAG, 
	
	//DATA_MEMORY
	logic [DATA_WIDTH-1:0] MEM_DATA_W,
	logic [DATA_WIDTH-1:0] MEM_DATA_R,
	input logic [DATA_WIDTH-1:0] MEM_ADDRESS,  //check whether size is correct
	
	//IMM_GEN
	logic [INS_WIDTH-1:0] IMM_OUT,
	
	//PC
	//logic [31:0] pc, target_pc, return_pc, pc_offset;
	
	//Instruction memory
   //instructionmemory instr_mem (PC, Instr);
	assign READ_REG_A = INS[19:15];
	assign READ_REG_B = INS[24:20];
	assign WRITE_REG = INS[11:7];
	
	assign MEM_ADDRESS = ALU_OUT;
	assign MEM_DATA_W = READ_DATA_B;
	
	assign BUS_A = ASel? pc : READ_DATA_A;		// 1 --> PC & 0 --> Read Data A in Reg File
	assign BUS_B = BSel? IMM_OUT : READ_DATA_B;	// 1 --> Immediate Out & 0 --> Read Data B in Reg File
	
	//assign target_pc = alu_out;
	//assign pc_offset = imm_data;
	
endmodule