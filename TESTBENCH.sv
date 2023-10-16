module TESTBENCH ();
    logic CLK;
    logic RST;
    logic [31:0] PC;
    logic [31:0] BUS_A;
    logic [31:0] BUS_B;
    logic [31:0] ALU_OUT;
    logic ZERO_FLAG;
    logic NEG_FLAG;
	 logic [3:0] ALUSel;
	 logic RegWEN;
	 logic [31:0] INS;
	 logic [4:0] WRITE_REG; 
	 logic [4:0] READ_REG_A; 
	 logic [4:0] READ_REG_B;
	 logic [31:0] REG_DATA_W;
	 logic [31:0] READ_DATA_A;
	 logic [31:0] READ_DATA_B; 
	 logic [31:0] IMM_OUT;
	 logic ImmSel;
	 logic BSel;
	 logic [31:0] MEM_DATA_R;
	 logic ASel;
	 

    DATAPATH datapath(
        .CLK(CLK),
        .RST(RST),
		  .PC(PC),
		  .BUS_A(BUS_A),
		  .BUS_B(BUS_B), 
		  .ALUSel(ALUSel), 
		  .RegWEN(RegWEN),
		  .ALU_OUT(ALU_OUT), 
		  .ZERO_FLAG(ZERO_FLAG), 
		  .NEG_FLAG(NEG_FLAG),
		  .INS(INS),
		  .WRITE_REG(WRITE_REG),
        .READ_REG_A(READ_REG_A),
        .READ_REG_B(READ_REG_B),
        .REG_DATA_W(REG_DATA_W),
        .READ_DATA_A(READ_DATA_A),
        .READ_DATA_B(READ_DATA_B),
		  .IMM_OUT(IMM_OUT),
		  .ImmSel(ImmSel),
		  .BSel(BSel),
		  .MEMR(MEMR), 
		  .MEMW(MEMW), 
		  .MEM_DATA_R(MEM_DATA_R),
		  .WBSel(WBSel),
		  .Branch(Branch),
		  .ASel(ASel)
		  //.PC_OUT(PC_OUT)
    );

    initial begin
        CLK = 1'b0;
        RST = 1'b1;

        #10 RST = 1'b0;
    end

    always 
        #5 CLK = ~CLK;
		  
	

endmodule
