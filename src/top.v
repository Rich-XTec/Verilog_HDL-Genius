//Projeto Final Richard Top.v para visualizar todo o projeto
// CLOCK  50Mhz

module top(
	clock, KEY,
	SW, LEDR_o,
	HEX0_o, HEX1_o, HEX2_o, HEX3_o, HEX4_o, HEX5_o
);

	input wire clock; 
	input wire [3:0]KEY;
	input wire [9:0] SW;
	output wire [9:0]LEDR_o;
	output wire [6:0] HEX0_o, HEX1_o, HEX2_o, HEX3_o, HEX4_o, HEX5_o;
	
	wire w_R1, w_R2, w_E1, w_E2, w_E3, w_E4, w_SEL, w_end_time, w_end_FPGA, w_end_User, w_win, w_match;

Datapath U0_DP(
	.clock(clock), .KEY_i(KEY), .SW_i(SW[9:2]), .R1_i(w_R1), .R2_i(w_R2), .E1_i(w_E1), .E2_i(w_E2), .E3_i(w_E3), .E4_i(w_E4), .SEL_i(w_SEL), 
	.LEDR_o(LEDR_o), .end_FPGA_o(w_end_FPGA), .end_User_o(w_end_User), .end_time_o(w_end_time), .win_o(w_win), .match_o(w_match),
	.HEX0_o(HEX0_o), .HEX1_o(HEX1_o), .HEX2_o(HEX2_o), .HEX3_o(HEX3_o), .HEX4_o(HEX4_o), .HEX5_o(HEX5_o)
);
	
Controle U1_CT(
	.R1_o(w_R1), .R2_o(w_R2), .E1_o(w_E1), .E2_o(w_E2), .E3_o(w_E3), .E4_o(w_E4), .SEL_o(w_SEL), 
	.clock(clock), .enter_i(SW[0]), .reset_i(SW[1]),  
	.end_FPGA_i(w_end_FPGA), .end_User_i(w_end_User), .end_time_i(w_end_time), .win_i(w_win), .match_i(w_match)
);
	


endmodule
