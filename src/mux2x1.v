/*
	mux2x1 7bits
	Richard - 24/05/2024
	
*/
module mux2x1 (
	ENT0_i,
	ENT1_i,
	SEL_i,
	output_o
);


	localparam WIDTH = 7;
	localparam SEL = 1;

	input wire  [WIDTH - 1:0] ENT0_i;
	input wire  [WIDTH - 1:0] ENT1_i;
	input wire  [SEL   - 1:0] SEL_i;
	output reg  [WIDTH - 1:0] output_o;
	
	always @(ENT0_i or ENT1_i or SEL_i)
	begin
		if (SEL_i==1'b1)
			output_o <= ENT1_i;
		else output_o <= ENT0_i;
	end
	
endmodule
