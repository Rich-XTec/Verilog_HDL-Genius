/*	24/06/2024 feito por Richard 	
	calcula a pontuacao final do jogador de acordo com j × R, onde j nivel de jogo (1, 2, 3, 4) 
	e R numero de sequencias acertadas pelo jogador.
*/
module Logica(
	REG_SetupLEVEL, round, REG_SetupMAPA, points
);

input wire [1:0] REG_SetupLEVEL, REG_SetupMAPA;
input wire [3:0] round;
output wire[7:0] points;

assign points = {REG_SetupLEVEL, round, REG_SetupMAPA};

endmodule
