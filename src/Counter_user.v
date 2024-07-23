/*	23/06/2024 feito por Richard 	
	incrementar uma sequencia de
   numeros conforme o usuario avanca nas rodadas de um jogo
*/

module Counter_user(
	clk, 
	R,
	E,
	data,
	tc	
);

input wire  clk, R, E; 
input wire [3:0] data;
output reg tc;
reg [3:0] total;

always@(posedge clk or posedge R or posedge E or posedge data)begin
if(R == 1'b1)begin
	 total = 4'b0000;
	 tc = 1'b0; end
else if (E == 1'b1) begin  
		total = total + 1'b1;
		if(total == data) tc=1'b1; 
		else tc=1'b0;
		end
		else total = total;
	
	end
endmodule
