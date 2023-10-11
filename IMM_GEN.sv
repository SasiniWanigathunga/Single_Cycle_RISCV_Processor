module IMM_GEN #(
		 parameter INS_WIDTH = 32
	)(
		 input logic [INS_WIDTH-1:0] INS,
		 output logic [INS_WIDTH-1:0] IMM_OUT
	);
	
	logic [6:0] OPCODE;
	logic [14:12] FUNC3;
	assign OPCODE = INS[6:0];
	
	// Opcode parameters
	//parameter TYPE_R = 7'b0110011;
   parameter TYPE_I_COMP = 7'b0010011;
   parameter TYPE_I_JALR = 7'b1100111;
	parameter TYPE_I_LOAD = 7'b0000011;
   parameter TYPE_S = 7'b0100011;
   parameter TYPE_SB = 7'b1100011;
   parameter TYPE_U_LUI = 7'b0110111;
   parameter TYPE_U_AUIPC = 7'b0010111;
   //parameter TYPE_UJ = 7'b1101111;
	
	always_comb begin
		case(OPCODE)
			TYPE_I_COMP:
				IMM_OUT = {(INS[31]) ? 20'b1 : 20'b0, INS[31:20]};
			TYPE_I_JALR:
				IMM_OUT = {(INS[31]) ? 20'b1 : 20'b0, INS[31:20]};
			TYPE_I_LOAD:
				IMM_OUT = {(INS[31]) ? 20'b1 : 20'b0, INS[31:20]};
			TYPE_S:
				IMM_OUT = {(INS[31]) ? 20'b1 : 20'b0, INS[31:25], INS[11:7]};
			TYPE_SB:
				IMM_OUT = {(INS[31]) ? 20'b1 : 20'b0, INS[7], INS[30:25], INS[11:8], 1'b0};
			TYPE_U_LUI:
				IMM_OUT = {INS[31:12], 12'b0};
			TYPE_U_AUIPC:
				IMM_OUT = {INS[31:12], 12'b0};
			
			default: IMM_OUT = {INS_WIDTH{1'b0}};  // Default to zero if an unsupported opcode is specified
		endcase
	end
endmodule
	
	