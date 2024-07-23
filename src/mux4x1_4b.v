/*
	mux4x1 de 4 bits
	Richard Stolk - 14/06/2024
	
	Somador completo de 4 bits
*/
module mux4x1_4b (
	ENT0_i,
	ENT1_i,
	ENT2_i,
	ENT3_i,
	SEL_i,
	output_o
);


	localparam WIDTH = 4;
	localparam SEL = 2;

	input wire  [WIDTH - 1:0] ENT0_i;
	input wire  [WIDTH - 1:0] ENT1_i;
	input wire  [WIDTH - 1:0] ENT2_i;
	input wire  [WIDTH - 1:0] ENT3_i;
	input wire  [SEL   - 1:0] SEL_i;
	output reg  [WIDTH - 1:0] output_o;
	
	always @(ENT0_i or ENT1_i or ENT2_i or ENT3_i or SEL)
	begin
		case (SEL)
			2'b00: output_o <= ENT0_i;
			
			2'b01: output_o <= ENT1_i;
			
			2'b10: output_o <= ENT2_i;
			
			2'b11: output_o <= ENT3_i;
		endcase
	end
	
endmodule
