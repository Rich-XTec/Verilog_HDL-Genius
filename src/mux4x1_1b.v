/*
	mux4x1 de 1 bit
	Richard Stolk - 14/06/2024
	
	Somador completo de 1 bit
*/
module mux4x1_1b (
	CL0_i,
	CL1_i,
	CL2_i,
	CL3_i,
	level_i,
	CLKHZ_o
);


	input wire   CL0_i;
	input wire   CL1_i;
	input wire   CL2_i;
	input wire   CL3_i;
	input wire  [1:0] level_i;
	output reg   CLKHZ_o;
	
	always @(CL0_i or CL1_i or CL2_i or CL3_i or level_i)
	begin
		case (level_i)
			2'b00: CLKHZ_o <= CL0_i;
			
			2'b01: CLKHZ_o <= CL1_i;
			
			2'b10: CLKHZ_o <= CL2_i;
			
			2'b11: CLKHZ_o <= CL3_i;
		endcase
	end
	
endmodule
