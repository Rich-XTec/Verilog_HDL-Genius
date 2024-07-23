//Projeto Final Richard Modulo Datapath

module Datapath(
	clock, KEY_i, SW_i, R1_i, R2_i, E1_i, E2_i, E3_i, E4_i, SEL_i, 
	LEDR_o, end_FPGA_o, end_User_o, end_time_o, win_o, match_o,
	HEX0_o, HEX1_o, HEX2_o, HEX3_o, HEX4_o, HEX5_o
);
 input wire clock, R1_i, R2_i, E1_i, E2_i, E3_i, E4_i, SEL_i;
 input wire [3:0] KEY_i;
 input wire [7:0] SW_i;
 output wire [9:0] LEDR_o; //LEDR 1 [3:0], LEDR 2 [9:6] configurar no Pin Planner
 output wire  end_FPGA_o, end_User_o, end_time_o, win_o, match_o;
 output wire [6:0] HEX0_o, HEX1_o, HEX2_o, HEX3_o, HEX4_o, HEX5_o;
 
 wire w_match_o, w_win, w_end_FPGA_o, w_end_time_o, w_end_User_o;
 assign win_o = w_win;
 assign end_FPGA_o = w_end_FPGA_o;
 assign end_time_o = w_end_time_o;
 assign end_User_o = w_end_User_o;
 assign match_o = w_match_o;
 wire w_clk5,w_clk3,w_clk2,w_clk1,CLKHZ;
 wire [3:0] TIME, ROUND, SEQ_FPGA, BTN, NBTN;
 wire [7:0] POINTS, SETUP;
 wire [63:0] OUT_FPGA, OUT_user;
 
 
Logica U_L(
	.REG_SetupLEVEL(SETUP[7:6]), .round(ROUND), .REG_SetupMAPA(SETUP[5:4]), .points(POINTS)
);
 
Counter_time U0_CT(
	.CLK1(w_clk1),	.R(R2_i), .E(E2_i),
	.tempo(TIME), .end_time(w_end_time_o)
);

Counter_round U1_CR(
	.clk(clock), 
	.R(R1_i),
	.data(SETUP[3:0]),
	.E(E4_i),
	.tc_o(w_win),
	.ROUND(ROUND)
);

wire [3:0] sq_fpga;
Counter_fpga U2_CF(
	.clk(CLKHZ), 
	.R(R2_i),
	.E(E3_i),
	.data(ROUND),
	.SEQFPGA(sq_fpga),
	.tc(w_end_FPGA_o)
);
wire w_seq1_mux, w_seq2_mux, w_seq3_mux, w_seq4_mux;
SEQ1 U21_CF(
    .address(sq_fpga),
    .output_reg(w_seq1_mux)
);
SEQ2 U22_CF(
    .address(sq_fpga),
    .output_reg(w_seq2_mux)
);
SEQ3 U23_CF(
    .address(sq_fpga),
    .output_reg(w_seq3_mux)
);
SEQ4 U24_CF(
    .address(sq_fpga),
    .output_reg(w_seq4_mux)
);

mux4x1_4b U25_CF(
	.ENT0_i(w_seq1_mux),
	.ENT1_i(w_seq2_mux),
	.ENT2_i(w_seq3_mux),
	.ENT3_i(w_seq4_mux),
	.SEL_i(SETUP[5:4]),
	.output_o(SEQ_FPGA)
);


wire EU3,andin1;
or U31_CU(andin1,NBTN[0],NBTN[1],NBTN[2],NBTN[3]);
and U32_CU(EU3, andin1, E2_i);
Counter_user U3_CU(
	.clk(clock), 
	.R(R2_i),
	.E(EU3),
	.data(ROUND),
	.tc(w_end_User_o)	
);


FSM_clock U4_FSM(
	.clk_i(clock), 
	.rst_i(R1_i),
	.clk_5(w_clk5), .clk_3(w_clk3), .clk_2(w_clk2), .clk_1(w_clk1)
);
mux4x1_1b U41_FSM_MUX(
	.CL0_i(w_clk5),
	.CL1_i(w_clk1),
	.CL2_i(w_clk2),
	.CL3_i(w_clk3),
	.level_i(SETUP[7:6]),
	.CLKHZ_o(CLKHZ)
);


REG_setup U5_REGS(
	.SW(SW_i),
	.CLK(clock),
	.R(R1_i),
	.E(E1_i),
	.setup(SETUP)
);


REG_fpga U6_REGF(
	.data({SEQ_FPGA,OUT_FPGA[63:4]}),
	.CLK(CLKHZ),
	.R(R2_i),
	.E(E3_i),
	.q_o(OUT_FPGA)
);


wire carry1,w_and1;
or U71(carry1,NBTN[0],NBTN[1],NBTN[2],NBTN[3]);
and U72(w_and1,carry1,E2_i);
REG_user U7_REGU(
	.data({NBTN[3:0],OUT_user[63:4]}),
	.CLK(clock),
	.R(R2_i),
	.E(w_and1),
	.q_o(OUT_user)
);

/*
ButtonSync U8_BTS(
		.KEY0(KEY_i[0]), .KEY1(KEY_i[1]), .KEY2(KEY_i[2]), .KEY3(KEY_i[3]), .CLK(clock),
		.BTN0(BTN[0]), .BTN1(BTN[1]), .BTN2(BTN[2]), .BTN3(BTN[3])
	);
not U80(NBTN[0],BTN[0]);//BTN e NBTN tem 4 canais, possivel ligar as 4 assim    ,BTN[1],BTN[2],BTN[3]
not U81(NBTN[1],BTN[1]);
not U82(NBTN[2],BTN[2]);
not U83(NBTN[3],BTN[3]);
*/

assign w_match_o = (OUT_FPGA == OUT_user) & w_end_User_o ? 1'b1:1'b0;

/* 
wire andCin;
COMP U9_COMP(
	.out_fpga(OUT_FPGA), .out_user(OUT_user),.andCin(andCin)
);	
and U90(match_o, andCin, w_end_User_o);  
*/
	
/*	
// F ~7'b111_0001
// U ~7'b011_1110
// L ~7'b011_1000
// S ~7'b110_1101
// P ~7'b111_0001
// t ~7'b1111_000
// E ~7'b1111_001
// g ~7'b1101_111
// r ~7'b1010_000
// A ~7'b1110_111
// r ~7'b1010_000
	
*/	
	
wire [6:0] w_mux0_mux1;
mux2x1 MUX0(
	.ENT0_i(7'b111_0001), //0 - F
	.ENT1_i(7'b011_1110), //1 - U
	.SEL_i(w_win),
	.output_o(w_mux0_mux1)
);
mux2x1 MUX1(
	.ENT0_i(7'b011_1000), //0 - L
	.ENT1_i(w_mux0_mux1), //1 
	.SEL_i(SEL_i),
	.output_o(HEX5_o)
);


wire [6:0] w_mux2_mux3, w_dec0_mux3;
dec7seg DEC0(
    .G_i({2'b00, SETUP[7:6]}),
    .O_o(w_dec0_mux3)
);
mux2x1 MUX2(
	.ENT0_i(7'b111_0001), //0 - P
	.ENT1_i(7'b110_1101), //1 - S
	.SEL_i(w_win),
	.output_o(w_mux2_mux3)
);
mux2x1 MUX3(
	.ENT0_i(w_dec0_mux3), //0 
	.ENT1_i(w_mux2_mux3), //1 
	.SEL_i(SEL_i),
	.output_o(HEX4_o)
);


wire [6:0] w_mux4_mux5;
mux2x1 MUX4(
	.ENT0_i(7'b1101_111), //0 - g
	.ENT1_i(7'b1111_001), //1 - E
	.SEL_i(w_win),
	.output_o(w_mux4_mux5)
);
mux2x1 MUX5(
	.ENT0_i(7'b1111_000), //0 - t
	.ENT1_i(w_mux4_mux5), //1 
	.SEL_i(SEL_i),
	.output_o(HEX3_o)
);


wire [6:0] w_mux6_mux7,w_dec1_mux7;
dec7seg DEC1(
    .G_i(TIME),
    .O_o(w_dec1_mux7)
);
mux2x1 MUX6(
	.ENT0_i(7'b1110_111), //0 - A
	.ENT1_i(7'b1010_000), //1 - r
	.SEL_i(w_win),
	.output_o(w_mux6_mux7)
);
mux2x1 MUX7(
	.ENT0_i(w_dec1_mux7), //0 
	.ENT1_i(w_mux6_mux7), //1 
	.SEL_i(SEL_i),
	.output_o(HEX2_o)
);

wire [6:0] w_dec2_mux8;
dec7seg DEC2(
    .G_i(POINTS[7:4]),
    .O_o(w_dec2_mux8)
);
mux2x1 MUX8(
	.ENT0_i(7'b1010_000), //0 - r
	.ENT1_i(w_dec2_mux8), //1 
	.SEL_i(SEL_i),
	.output_o(HEX1_o)
);


wire [6:0] w_dec3_mux9,w_dec4_mux9;
dec7seg DEC3(
    .G_i(ROUND),
    .O_o(w_dec3_mux9)
);
dec7seg DEC4(
    .G_i(POINTS[3:0]),
    .O_o(w_dec4_mux9)
);
mux2x1 MUX9(
	.ENT0_i(w_dec3_mux9), //0 
	.ENT1_i(w_dec4_mux9), //1 
	.SEL_i(SEL_i),
	.output_o(HEX0_o)
);

endmodule