/*
	Counter_round contar a quantidade de sequencias
	que o jogador acertou em um jogo
*/
module Counter_round
(
	clk, 
	R,
	data,
	E,
	tc_o,
	ROUND
);

input wire  clk, R, E;
input wire  [3:0] data;
output reg tc_o;
output reg [3:0] ROUND;
reg [3:0] total;

always@(posedge clk or posedge R)begin
	if (R==1'b1)
	begin
		total = 4'b0000;
		tc_o = 1'b0; 
	end
	else if (E==1'b1)
		begin 
			total = total + 1'b1;
			//tc_o = 1'b0;
			if (total == data)
			begin
				tc_o = 1'b1;
				ROUND = total;  
			end
		end
end

endmodule
