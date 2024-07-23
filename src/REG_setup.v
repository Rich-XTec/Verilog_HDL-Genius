/*
	REG_setup de 2bits para guardar o nivel de jogo
*/

module REG_setup 
(
	SW,
	CLK,
	R,
	E,
	setup
);

input wire 	CLK, R, E; 
input wire [7:0] SW;
output reg [7:0] setup;

always@(posedge CLK or posedge R)
begin
	if (R == 1'b1)
		setup <= 4'b0000;
	else
		if (E == 1'b1)
			setup <= SW;
		else 
		   setup <= setup;
end

endmodule
