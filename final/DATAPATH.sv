module DATAPATH (
		//Control Signals
		input logic CLK, RST, 
		output logic [31:0] PC,
		//output logic [31:0] PC_OUT,
		
		//ALU 
		output logic [31:0] BUS_A,  //register rs1
		output logic [31:0] BUS_B,  //register rs2
		output logic [31:0] ALU_OUT,   //ALU output
		output logic ZERO_FLAG, NEG_FLAG,
		output logic [3:0] ALUSel, //controls
		output logic BSel,
		
		output logic [31:0] INS,
		
		//REG_FILE
		output logic [4:0] WRITE_REG, 
		output logic [4:0] READ_REG_A, 
		output logic [4:0] READ_REG_B,
		output logic [31:0] REG_DATA_W, //signed
		output logic [31:0] READ_DATA_A, READ_DATA_B,
		output logic RegWEN, //controls
		
		//IMM_GEN
		output logic [31:0] IMM_OUT,
		output logic ImmSel, //controls
		
		output logic MEMR,  //controls
		output logic MEMW, //controls
		output logic [31:0] MEM_DATA_R,
		
		output logic WBSel,
		
		//Branch
		output logic Branch,
		output logic ASel
	);
	
	logic [11:0] CON_SIG;
	logic [31:0] MEM_ADDRESS;
	logic [31:0] MEM_DATA_W;
	logic [31:0] MUX_OUT_alu_a;
	logic [31:0] MUX_OUT_alu_b;
	logic [31:0] MUX_OUT_mem;
	logic [31:0] MUX_OUT_PC;
	logic [31:0] NEXT_PC;
	logic [2:0] BRANCH;
	
	//datapath assign
	assign READ_REG_A = INS[19:15];
   assign READ_REG_B = INS[24:20];
   assign WRITE_REG = INS[11:7];
		
	//control signals
	assign ALUSel = CON_SIG[6:3];
	assign RegWEN = CON_SIG[8];
	assign ImmSel = CON_SIG[9];
	assign BSel = CON_SIG[7];
	assign MEMR = CON_SIG[2];
	assign MEMW = CON_SIG[1];
	assign WBSel = CON_SIG[0];
	assign Branch = CON_SIG[10];
	assign ASel = CON_SIG[11];
	
	assign BUS_A = MUX_OUT_alu_a;
	assign BUS_B = MUX_OUT_alu_b;
	assign REG_DATA_W = MUX_OUT_mem;
	assign NEXT_PC = MUX_OUT_PC;
	
	INS_MEMORY ins_mem (
		.PC(PC),
		.INS(INS)
	);	
	
	CONTROLLER controller_inst (
		.INS(INS),
      .CON_SIG(CON_SIG),
		.BRANCH(BRANCH)
   );
	
   ALU ALU_module(
		.BUS_A(BUS_A),
		.BUS_B(BUS_B), 
		.ALUSel(ALUSel), 
		.ALU_OUT(ALU_OUT), 
		.ZERO_FLAG(ZERO_FLAG), 
		.NEG_FLAG(NEG_FLAG)
	);	
	
    PC_ pc (
        .CLK(CLK),
        .RST(RST),
        .PC_OFFSET(ALU_OUT),
		  .PC(PC),
		  .Branch(Branch)
		  //.PC_OUT(PC_OUT)
    );
		
		
    REG_FILE reg_file (
        .CLK(CLK),
        .RST(RST),
        .RegWEN(RegWEN),
        .WRITE_REG(WRITE_REG),
        .READ_REG_A(READ_REG_A),
        .READ_REG_B(READ_REG_B),
        .REG_DATA_W(MUX_OUT_mem),
        .READ_DATA_A(READ_DATA_A),
        .READ_DATA_B(READ_DATA_B)
    );
	 
	 IMM_GEN imm_gen (
		 .IMM_OUT(IMM_OUT),
		 .INS(INS),
		 .ImmSel(ImmSel)
	 );
	 
	 DATA_MEMORY data_memory(
		.CLK(CLK),
		.RST(RST),
		.MEMR(MEMR), 
		.MEMW(MEMW), 
		.MEM_ADDRESS(ALU_OUT), 
		.MEM_DATA_W(MEM_DATA_W),
		.MEM_DATA_R(MEM_DATA_R)
	 );
	 
	 BRANCH_COMP branch_comp(
		 .DATA_A(READ_DATA_A), 
		 .DATA_B(READ_DATA_B), 
		 .INS(INS),
		 .BRANCH(BRANCH)
	);
	
	MUX2 mux_alu_A(
		.D0(READ_DATA_A), 
		.D1(PC),
		.MUX_SEL(ASel),
		.MUX_OUT(MUX_OUT_alu_a)
	);
	
	MUX2 mux_alu_B(
		.D0(READ_DATA_B), 
		.D1(IMM_OUT),
		.MUX_SEL(BSel),
		.MUX_OUT(MUX_OUT_alu_b)
	);
	
	MUX2 mem(
		.D0(MEM_DATA_R), 
		.D1(ALU_OUT),
		.MUX_SEL(WBSel),
		.MUX_OUT(MUX_OUT_mem)
	);
	
endmodule
