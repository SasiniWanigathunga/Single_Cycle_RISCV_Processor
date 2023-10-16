module REG_FILE (
        input logic CLK, RST,
        input logic RegWEN,
        input logic [4:0] WRITE_REG, 
        input logic [4:0] READ_REG_A, 
        input logic [4:0] READ_REG_B,
        input logic [31:0] REG_DATA_W, // data that supposed to be written into the register file  //signed
        output logic [31:0] READ_DATA_A, READ_DATA_B  //signed 
    );
    
    logic [31:0] REGISTER_FILE [31:0];
    
    
    initial begin
        REGISTER_FILE[0]=32'h00000001;
        REGISTER_FILE[1]=32'h00000002;
        REGISTER_FILE[2]=32'h00000003;
        REGISTER_FILE[3]=32'h00000004;
        REGISTER_FILE[4]=32'h00000005;
        REGISTER_FILE[5]=32'h00000006;
        REGISTER_FILE[6]=32'h00000007;
        REGISTER_FILE[7]=32'h00000008;
        REGISTER_FILE[8]=32'h00000009;
        REGISTER_FILE[9]=32'h00000010;
        REGISTER_FILE[10]=32'h00000011;
        REGISTER_FILE[11]=32'h00000012;
        REGISTER_FILE[12]=32'h00000013;
        REGISTER_FILE[13]=32'h00000014;
        REGISTER_FILE[14]=32'h00000015;
        REGISTER_FILE[15]=32'h00000016;
        REGISTER_FILE[16]=32'h00000017;
        REGISTER_FILE[17]=32'h00000018;
        REGISTER_FILE[18]=32'h00000019;
        REGISTER_FILE[19]=32'h00000020;
        REGISTER_FILE[20]=32'h00000021;
        REGISTER_FILE[21]=32'h00000022;
        REGISTER_FILE[22]=32'h00000023;
        REGISTER_FILE[23]=32'h00000024;
        REGISTER_FILE[24]=32'h00000025;
        REGISTER_FILE[25]=32'h00000026;
        REGISTER_FILE[26]=32'h00000027;
        REGISTER_FILE[27]=32'h00000028;
        REGISTER_FILE[28]=32'h00000029;
        REGISTER_FILE[29]=32'h00000030;
        REGISTER_FILE[30]=32'h00000031;
        REGISTER_FILE[31]=32'h00000032;
    
    end
    
    always @(*) begin
      READ_DATA_A = REGISTER_FILE[READ_REG_A];
      READ_DATA_B = REGISTER_FILE[READ_REG_B];
      if (RegWEN == 1'b1) begin
        REGISTER_FILE[WRITE_REG] = REG_DATA_W;
      end
    end

endmodule
