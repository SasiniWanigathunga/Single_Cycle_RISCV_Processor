module INS_MEMORY (
		input logic [31:0] PC,
		output logic [31:0] INS
	);
	
	logic [31:0] INS_MEM [31:0];
	
	/**
	assign INS_MEM[0]   = 32'h00007033;//      and  r0,r0,r0           ALUResult = h0 = r0          
	assign INS_MEM[1]   = 32'h00100093;//      addi r1,r0, 1           ALUResult = h1 = r1
	assign INS_MEM[2]   = 32'h00200113;//      addi r2,r0, 2           ALUResult = h2 = r2
	assign INS_MEM[3]   = 32'h00308193;//      addi r3,r1, 3           ALUResult = h4 = r3
	assign INS_MEM[4]   = 32'h00408213;//      addi r4,r1, 4           ALUResult = h5 = r4
	assign INS_MEM[5]   = 32'h00510293;//      addi r5,r2, 5           ALUResult = h7 = r5
	assign INS_MEM[6]   = 32'h00610313;//      addi r6,r2, 6           ALUResult = h8 = r6
	assign INS_MEM[7]   = 32'h00718393;//      addi r7,r3, 7           ALUResult = hB = r7
	assign INS_MEM[8]   = 32'h00208433;//      add  r8,r1,r2           ALUResult = h3 = r8
	assign INS_MEM[9]   = 32'h404404b3;//      sub  r9,r8,r4           ALUResult = hfffffffe = -2 = r9
	assign INS_MEM[10]  = 32'h00317533;//      and r10 = r2 & r3       ALUResult = h0 = r10
	assign INS_MEM[11]  = 32'h0041e5b3;//      or  r11 = r3 | r4       ALUResult = h5 = r11
	
	 //testing branches
	assign INS_MEM[12]  = 32'h02b20263;//      beq r4,r11,36           ALUResult = 00000000       branch taken to inst_mem[21]  



	assign INS_MEM[13]  = 32'h00108413;//      addi r8,r1,1            ALUResult = h2 = r8
	assign INS_MEM[14]  = 32'h00419a63;//      bne r3,r4,20            ALUReuslt = ffffffff       branch taken to inst_mem[19] 
	assign INS_MEM[15]  = 32'h00308413;//      addi  r8,r1,3           ALUReuslt = h4 = r8
	assign INS_MEM[16]  = 32'h0014c263;//      blt r9,r1,4             ALUResult = 00000001       branch taken to inst_mem[17]   
	assign INS_MEM[17]  = 32'h00408413;//      addi  r8,r1,4           ALUReuslt = h5 = r8
	assign INS_MEM[18]  = 32'h00b3da63;//      bgt r7,r11,20           ALUResult = 00000001       branch taken to inst_mem[23]   
	assign INS_MEM[19]  = 32'h00208413;//      addi  r8,r1,2           ALUResult = h3 = r8
	assign INS_MEM[20]  = 32'hfe5166e3;//      btlu r2, r5, -24        ALUResult = 00000001       branch taken to inst_mem[15]   
	
	assign INS_MEM[21]  = 32'h00008413;//      add  r8,r1,0            ALUResult = 1 = r8
	assign INS_MEM[22]  = 32'hfc74fee3;//      bgeu  r9,r7,-36         ALUResult = 00000001       branch taken to inst_mem[13] 
	assign INS_MEM[23]  = 32'h0083e6b3;//      or  r13 = r7 | r8       ALUResult = hf = r13

	//jal
	assign INS_MEM[24]  = 32'h018005ef;//      jal x11, 24(Decimal)    ALResult = h64       jump to inst[30] 
	//return
	assign INS_MEM[25]  = 32'h02a02823;//      sw  48(r0)<- r10        ALUResult = h30 
	assign INS_MEM[26]  = 32'h16802023;//      sw  352(r0)<- r8        ALUResult =h160
	assign INS_MEM[27]  = 32'h03002603;//      lw r12 <- 48(r0)        ALUResult = h30

	assign INS_MEM[28]  = 32'h00311733;//     sll r14, r2, r3          ALUResult = h20 = r14
	//branch
	assign INS_MEM[29]  = 32'h00c50a63;//     beq x12, x10, 20         ALUResult = 00000000        branch taken to inst_mem[34] 

	assign INS_MEM[30]  = 32'h0072c7b3;//     xor r15, r5, r7          ALUResult = hc = r15
	assign INS_MEM[31]  = 32'h00235833;//     srl r16, r6, r2          ALUResult = h2 = r16
	**/

  /**
	assign INS_MEM[0]   = 32'b00000000000000000111000000110011; // and  r0,r0,r0           ALUResult = h0 = r0          
	assign INS_MEM[1]   = 32'b00000000000100000000000010010011; // addi r1,r0, 1           ALUResult = h1 = r1
	assign INS_MEM[2]   = 32'b00000000001000000000000100010011; // addi r2,r0, 2           ALUResult = h2 = r2
	assign INS_MEM[3]   = 32'b00000000001100001000000110010011; // addi r3,r1, 3           ALUResult = h4 = r3
	assign INS_MEM[4]   = 32'b00000000010000001000000100100011; // addi r4,r1, 4           ALUResult = h5 = r4
	assign INS_MEM[5]   = 32'b00000000010100010000001010010011; // addi r5,r2, 5           ALUResult = h7 = r5
	assign INS_MEM[6]   = 32'b00000000011000010000001110010011; // addi r6,r2, 6           ALUResult = h8 = r6
	assign INS_MEM[7]   = 32'b00000000011100011000010010010011; // addi r7,r3, 7           ALUResult = hB = r7
	assign INS_MEM[8]   = 32'b00000000001000001000010000110011; // add  r8,r1,r2           ALUResult = h3 = r8
	assign INS_MEM[9]   = 32'b01000000010001000000010010110011; // sub  r9,r8,r4           ALUResult = hfffffffe = -2 = r9
	assign INS_MEM[10]  = 32'b00000000001100010111010000110011; // and r10 = r2 & r3       ALUResult = h0 = r10
	assign INS_MEM[11]  = 32'b00000000010000011101010010110011; // or  r11 = r3 | r4       ALUResult = h5 = r11
	assign INS_MEM[12]  = 32'b00000010110100100000001001100011; // beq r4,r11,36           ALUResult = 00000000       branch taken to inst_mem[21]
	assign INS_MEM[13]  = 32'b00000000000100001000010000010011; // addi r8,r1,1            ALUResult = h2 = r8
	assign INS_MEM[14]  = 32'b00000000010000011001101001100011; // bne r3,r4,20            ALUReuslt = ffffffff       branch taken to inst_mem[19]
	assign INS_MEM[15]  = 32'b00000000001100001000010000010011; // addi  r8,r1,3           ALUReuslt = h4 = r8
	assign INS_MEM[16]  = 32'b00000000000101001100000110000011; // blt r9,r1,4             ALUResult = 00000001       branch taken to inst_mem[17]
	assign INS_MEM[17]  = 32'b00000000010000001000010000010011; // addi  r8,r1,4           ALUReuslt = h5 = r8
	assign INS_MEM[18]  = 32'b00001011011000111101101001100011; // bgt r7,r11,20           ALUResult = 00000001       branch taken to inst_mem[23]
	assign INS_MEM[19]  = 32'b00000000001000001000010000010011; // addi  r8,r1,2           ALUResult = h3 = r8
	**/
	assign INS_MEM[0]   = 32'b0000000_00000_00010_000_11111_0110011; // reg0,reg4,reg31,add        
	assign INS_MEM[1]   = 32'b0100000_00111_00011_000_11110_0110011; // reg7,reg3,reg30,sub
	assign INS_MEM[2]   = 32'b0000000_00111_00000_001_11101_0110011; // reg7,reg0,reg29, SLL
	assign INS_MEM[3]   = 32'b0000000_00000_00100_010_11100_0110011; // or $s0,reg28, SLT
	assign INS_MEM[4]   = 32'b0000000_00001_00000_011_11011_0110011; // sw $s0,reg27,SLTU
	assign INS_MEM[5]   = 32'b0000000_10100_11001_100_11010_0110011; // sw $t0,reg26 ,XOR
	assign INS_MEM[6]   = 32'b0000000_00011_00000_101_11001_0110011; // add $s1,reg25, SRL
	assign INS_MEM[7]   = 32'b0100000_00111_00000_101_11000_0110011; // sub $s2,reg24, SRA
	assign INS_MEM[8]   = 32'b0000000_10100_10000_110_10111_0110011; // beq $s1,reg23, OR
	assign INS_MEM[9]   = 32'b0000000_10100_00001_111_10110_0110011; // lw $s1,reg22,AND
	assign INS_MEM[10]  = 32'b000000000101_00001_000_00000_1100111; // ,JALR
	assign INS_MEM[11]  = 32'b000000000001_00010_000_00000_0010011; // ,addi
	assign INS_MEM[12]  = 32'b000000000001_00100_010_00000_0010011; // ,SLTi
	assign INS_MEM[13]  = 32'b000000000001_00100_011_00000_0010011; // ,SLTiu
	assign INS_MEM[14]  = 32'b000000000001_00100_100_00000_0010011; // ,XORi
	assign INS_MEM[15]  = 32'b000000000001_00100_110_00000_0010011; // ,ORi
	assign INS_MEM[16]  = 32'b000000000011_00010_111_00000_0010011; // ,ANDi
	assign INS_MEM[17]  = 32'b0000000_00011_00010_001_00000_0010011; // ,SLLi
	assign INS_MEM[18]  = 32'b0000000_00011_00010_101_00000_0010011; // ,SRLi
	assign INS_MEM[19]  = 32'b0000000_00011_00010_101_00000_0010011; // ,SRAi
	assign INS_MEM[20] = 32'b0000000_00000_00010_000_00010_1100011; // BEQ: if (reg0 == reg4) branch
    assign INS_MEM[21] = 32'b0000000_00001_00011_000_00010_1100011; // BNE: if (reg7 != reg3) branch
    assign INS_MEM[22] = 32'b0000000_00001_00000_001_00010_1100011; // BLT: if (reg7 < reg0) branch
    assign INS_MEM[23] = 32'b0000000_00000_00100_010_00100_1100011; // BGE: if (reg0 >= reg4) branch
    assign INS_MEM[24] = 32'b0000000_00001_00000_011_00010_1100011; // BLTU: if (reg1 <u reg0) branch
    assign INS_MEM[25] = 32'b0000000_00010_11001_100_00010_1100011; // BGEU: if (reg20 >=u reg25) branch
    /**
	assign INS_MEM[20]  = 32'b11111110010100010110011011100011; // btlu r2, r5, -24        ALUResult = 00000001       branch taken to inst_mem[15]
	assign INS_MEM[21]  = 32'b00000000000000001000010000010011; // add  r8,r1,0            ALUResult = 1 = r8
	assign INS_MEM[22]  = 32'b11111100011101001111011111100011; // bgeu  r9,r7,-36         ALUResult = 00000001       branch taken to inst_mem[13]
	assign INS_MEM[23]  = 32'b00001000000000111110011010110011; // or  r13 = r7 | r8       ALUResult = hf = r13
	assign INS_MEM[24]  = 32'b00011000000000000000010111101111; // jal x11, 24(Decimal)    ALResult = h64       jump to inst[30]
	assign INS_MEM[25]  = 32'b00101010000000000010001000100011; // sw  48(r0)<- r10        ALUResult = h30
	**/
	assign INS_MEM[26]  = 32'b00010110000000000010000000100011; // sw  352(r0)<- r8        ALUResult = h160
	assign INS_MEM[27]  = 32'b00000011000000000001001100000011; // lw r12 <- 48(r0)        ALUResult = h30
	assign INS_MEM[28]  = 32'b00000000001100010001011100110011; // sll r14, r2, r3          ALUResult = h20 = r14
	assign INS_MEM[29]  = 32'b00001100010101010000101001100011; // beq x12, x10, 20         ALUResult = 00000000        branch taken to inst_mem[34]
	assign INS_MEM[30]  = 32'b00000111011100101100011110110011; // xor r15, r5, r7          ALUResult = hc = r15
	assign INS_MEM[31]  = 32'b00000010010000110101100000110011; // srl r16, r6, r2          ALUResult = h2 = r16
    assign INS_MEM[32] = 32'b000000000000_00001_000_01100_0000011; // ,LB
    assign INS_MEM[33] = 32'b000000000000_00010_001_01011_0000011; // ,LH
    assign INS_MEM[34] = 32'b000000000000_00001_010_01010_0000011; // ,LW
    assign INS_MEM[35] = 32'b000000000000_00000_100_01001_0000011; // ,LBU
    assign INS_MEM[36] = 32'b000000000000_00001_101_01000_0000011; // ,LHU
    assign INS_MEM[37] = 32'b0000000_00000_00100_000_00001_0100011; //SB
    assign INS_MEM[38] = 32'b0000000_00001_00101_001_00010_0100011; //SH
    assign INS_MEM[39] = 32'b0000000_00010_00110_010_00011_0100011; //SW
	
	
	assign INS =  INS_MEM [PC >> 2];  

	
endmodule
