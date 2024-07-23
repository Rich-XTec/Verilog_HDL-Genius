/*
	REG_fpga de 64 bits que guarda e monta uma
	sequencia correta na rodada
*/

module REG_fpga 
#(parameter N = 64)
(
	data,
	CLK,
	R,
	E,
	q_o
	
);

input wire [N-1:0] data;
input wire 	CLK, R, E; 

output reg [N-1:0] q_o;
reg [3:0] q3_o;

always@(posedge CLK or posedge R)
begin
	if (R == 1'b1) begin
		q_o <= 0;
	end
	else begin
		if (E == 1'b1) begin
			q_o <= data;
			q3_o <= data[63:60];
		end
		else begin
		   q_o <= q_o;
			q3_o <= q_o[63:60];
		end
	end
end

endmodule
