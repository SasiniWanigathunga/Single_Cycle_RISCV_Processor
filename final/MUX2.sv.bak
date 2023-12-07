module MUX2 #(
		parameter DATA_WIDTH = 32
	)(
		input logic [DATA_WIDTH-1:0] D0, D1,
		input logic MUX_SEL,
		output logic [DATA_WIDTH-1:0] MUX_OUT
	);
	
	assign MUX_OUT = MUX_SEL? D0 : D1;
	
endmodule