/*	21/06/2024 
	feito por Richard 	
	FSM_clock entra clk_i de 50MHz e sai clocks de 1Hz, 2Hz, 3Hz, 5Hz
*/
module Counter_time
(
	CLK1,	R, E,
	tempo, end_time
);

input  wire  CLK1, R, E;
output reg [3:0] tempo;				 
output reg end_time;


always @ (posedge CLK1 or posedge R) begin
	if (R == 1'b1) begin
		tempo = 4'b0000;
		end_time = 1'b0;
	end
	else begin
		if (E == 1'b1) begin  
			tempo = tempo + 1'b1;
			end_time = 1'b0;
			if (tempo == 4'b1001)begin
				tempo = 4'b0000; 
				end_time = 1'b1;		
			end
		end
	end
end

endmodule
