module CONTROLLER (
		input logic [31:0] INS,
		input logic [2:0] BRANCH,
		output logic [11:0] CON_SIG
	);
	
	//logic [W_C-1:0] CONTROL_STORE;
	
	logic [3:0] ALUSel;
	logic Branch;
	
	//logic [8:0] ctrl_addr;
	logic [6:0] OPCODE;
	logic [2:0] FUNC3;
	logic [6:0] FUNC7;
	
	assign OPCODE = INS[6:0];
	assign FUNC3 = INS[14:12];
	assign FUNC7 = INS[31:25];
	
	// Opcode types
	parameter TYPE_R 	     = 7'b0110011;
	parameter TYPE_I_COMP  = 7'b0010011;
	parameter TYPE_I_LOAD  = 7'b0000011;
	parameter TYPE_I_JALR  = 7'b1100111;
	parameter TYPE_S	     = 7'b0100011;
	parameter TYPE_SB      = 7'b1100011;
	parameter TYPE_U_LUI   = 7'b0110111;
	parameter TYPE_U_AUIPC = 7'b0010111;
	//TYPE_UJ	  7'b1101111
	
	//Control Signals for ALU
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
	
	//Control signals for branch instructions
	parameter BEQ = 3'b100;
	parameter BNE = 3'b011;
	parameter BLT = 3'b010;
	parameter BGE = 3'b101;
	parameter BLTU = 3'b010;
	parameter BGEU = 3'b101; 
	
	//ALU Controller
	always_comb begin
        case (FUNC3)
            3'b000: 
					case (FUNC7[6:5])
						2'b00: ALUSel = ADD;
						2'b01: ALUSel = SUB;
						default: ALUSel = 4'b0000;
					endcase
				3'b001: ALUSel = SLL;
				3'b010: ALUSel = SLT;
				3'b011: ALUSel = SLTU;
				3'b100: ALUSel = XOR;
				3'b101:
					case (FUNC7[6:5])
						2'b00: ALUSel = SRL;
						2'b01: ALUSel = SRA;
						default: ALUSel = 4'b0000;
					endcase
				default: ALUSel = 4'b0000;	
        endcase
    end
	 
	 // Branch Controller
	always_comb begin
		 if (BRANCH == BEQ || BRANCH == BNE || BRANCH == BLT || BRANCH == BGE || BRANCH == BLTU || BRANCH == BGEU)
			  Branch = 1'b1;
		 else 
			  Branch = 1'b0;
	end

	 
	 
	 //Control Store
	 always_comb begin
        case (OPCODE)
				//TYPE:
					//CON_SIG = {ImmSel[9], RegWEn[8], BSel[7], ALUSel[6:3], MEMR[2], MEMW[1], WBSel[0]}
					//CON_SIG = {ASel[11], PCSel[10], ImmSel[9], RegWEn[8], BSel[7], ALUSel[6:3], MEMR[2], MEMW[1], WBSel[0]}
            TYPE_R:  //R-type instructions
					CON_SIG = {1'b0, Branch, 1'b0, 1'b1, 1'b0, ALUSel, 1'b0, 1'b0, 1'b1};
				TYPE_I_COMP:
					CON_SIG = {1'b0, Branch, 1'b1, 1'b1, 1'b1, ALUSel, 1'b0, 1'b0, 1'b1};
				TYPE_I_LOAD:
					CON_SIG = {1'b0, Branch, 1'b1, 1'b1, 1'b1, ALUSel, 1'b0, 1'b0, 1'b1};
				TYPE_SB:
					CON_SIG = {1'b1, Branch, 1'b1, 1'b1, 1'b1, ALUSel, 1'b0, 1'b0, 1'b1};
				
            default:
                CON_SIG = {1'b0, 1'b0, 1'b0, 4'b0000, 1'b0, 1'b0};
        endcase
    end
	
	
endmodule