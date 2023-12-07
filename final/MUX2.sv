module MUX2 (
		input logic [31:0] D0, D1,
		input logic MUX_SEL,
		output logic [31:0] MUX_OUT
	);
	
	assign MUX_OUT = MUX_SEL? D1 : D0;
	
endmodule