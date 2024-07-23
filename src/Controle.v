//Projeto Final Richard Module Controle

module Controle(
	R1_o, R2_o, E1_o, E2_o, E3_o, E4_o, SEL_o, 
	clock, end_FPGA_i, end_User_i, end_time_i, win_i, match_i, reset_i, enter_i
);

	input wire reset_i, enter_i, clock, end_FPGA_i, end_User_i, end_time_i, win_i, match_i;
   output reg R1_o, R2_o, E1_o, E2_o, E3_o, E4_o, SEL_o;

localparam [2:0]	Init=3'b000, Setup=3'b001, Play_FPGA=2,  Play_User=3'h3, Check=3'b100,  Next_Round=3'b101, Result=3'b110;  
reg [2:0] state, next_state;
reg EA; //sinal interno representando o estado atual do estado de execucao
reg PE; //sinal interno representando o proximo estado
//Processo Sequencial, Armazena Estado Atual
always@(posedge clock)begin
	if(reset_i == 1'b1)
	state<= Init;
	else
	state<= next_state;
end
// Logica combinacional dos estados
always@(enter_i or clock or end_FPGA_i or end_User_i or end_time_i or win_i or match_i or state)
begin
	next_state = state;
	case (state)
		Init: next_state = Setup;
		
		Setup: 
					if(enter_i==1'b1)
						next_state = Play_FPGA;
					else next_state = Setup; 
		Play_FPGA:
					if(end_FPGA_i == 1'b1) 
						next_state = Play_User;
					else next_state = Play_FPGA; 
						
		Play_User:
					if(end_User_i == 1'b1) 
							next_state = Check;
					else 
					if(end_time_i==1'b0) 
							next_state = Result;
					else next_state = Play_User;
		Check: 	
					if(match_i == 1'b1) 
							next_state = Next_Round;
					else next_state = Result;
		Next_Round: 
					if(win_i == 1'b1) 
							next_state = Result;
					else next_state = Play_FPGA;
					
		Result: if(enter_i==1'b1) next_state = Result;
	endcase
end
//Logica Combinacional decodifica a saida
always @ (state) 
begin
		
	case (state)
		Init: begin
					R1_o=1'b1; 
					R2_o=1'b1;			
				end
		Setup: begin
					R1_o=1'b0;
					R2_o=1'b0;
					E1_o=1'b1; 
				end 
		Play_FPGA: begin
					E3_o=1'b1;
					E4_o=1'b1;
				end
		Play_User:	begin
					E2_o=1'b1;			
				end
		Check: begin
					E4_o=1'b1;			
				end
		Next_Round: begin
					R2_o=1'b1;			
				end 
		Result: begin
					SEL_o=1'b1;			
				end
		default: begin R1_o=1'b0; R2_o=1'b0; E1_o=1'b0; E2_o=1'b0; E3_o=1'b0; E4_o=1'b0; SEL_o=1'b0; end
	endcase
end

endmodule


