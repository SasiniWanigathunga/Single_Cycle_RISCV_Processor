module BRANCH_COMP (
    input logic [31:0] DATA_A, 
    input logic [31:0] DATA_B, 
    input logic [31:0] INS, // Function code for the branch instruction
    output logic [2:0] BRANCH
);

logic BrEq, BrLT, BrGT;
logic BrUn; // Unsigned comparison (0 for signed, 1 for unsigned)
logic [6:0] OPCODE;
logic [2:0] FUNC3;

//Branch instructions
parameter BEQ = 3'b000;
parameter BNE = 3'b001;
parameter BLT = 3'b100;
parameter BGE = 3'b101;
parameter BLTU = 3'b110;
parameter BGEU = 3'b111;

// Opcode parameters
parameter TYPE_R = 7'b0110011;
parameter TYPE_I_COMP = 7'b0010011;
parameter TYPE_I_JALR = 7'b1100111;
parameter TYPE_I_LOAD = 7'b0000011;
parameter TYPE_S = 7'b0100011;
parameter TYPE_SB = 7'b1100011;
parameter TYPE_U_LUI = 7'b0110111;
parameter TYPE_U_AUIPC = 7'b0010111;

assign OPCODE = INS[6:0]; 
assign FUNC3 = INS[14:12];

always_comb begin
    if (OPCODE == TYPE_SB) begin
        BrUn = (FUNC3==BLTU || FUNC3==BGEU);
        // Initialize BrEq, BrLT, and BrGT to 0 by default
        BrEq = 1'b0;
        BrLT = 1'b0;
        BrGT = 1'b0;
        if (BrUn) begin
            BrEq = ($unsigned(DATA_A) == $unsigned(DATA_B));
            BrLT = ($unsigned(DATA_A) < $unsigned(DATA_B));
            BrGT = ($unsigned(DATA_A) > $unsigned(DATA_B));
        end else begin
            BrEq = (DATA_A == DATA_B);
            BrLT = (DATA_A < DATA_B);
            BrGT = (DATA_A > DATA_B);
        end
    end else begin
        // Default values when OPCODE is not TYPE_SB
        BrUn = 1'b0;
        BrEq = 1'b0;
        BrLT = 1'b0;
        BrGT = 1'b0;
    end
end

assign BRANCH = {BrEq, BrLT, BrGT};

endmodule
