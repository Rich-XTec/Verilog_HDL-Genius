/*
	REG_user registrador de 64 bits que guarda e monta a sequencia
	digitada pelo usuario
*/
module REG_user
#(parameter N = 64)
(
	data,
	CLK,
	R,
	E,
	q_o
);

input wire 	CLK, R, E; 
input wire [N-1:0] data;
output reg [N-1:0] q_o;

always@(posedge CLK or posedge R)
begin
	if (R == 1'b1)
		q_o <= 0;
	else if (E == 1'b1)
			q_o <= data;
		else 
		   q_o <= q_o;
end

endmodule
