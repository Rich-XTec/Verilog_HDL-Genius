//Projeto Final Richard Top_tb.v para simular
// CLOCK 50Mhz

`timescale 1ns/100ps

module top_tb;

reg clk;
reg [9:0] SW_t;
reg [3:0] key_t;
wire [6:0] HEX0_t, HEX1_t, HEX2_t, HEX3_t, HEX4_t, HEX5_t;
wire [9:0] LEDR;


top U0_top(
	.clock(clk), .KEY(key_t),
	.SW(SW_t), .LEDR_o(LEDR),
	.HEX0_o(HEX0_t), .HEX1_o(HEX1_t), .HEX2_o(HEX2_t), .HEX3_o(HEX3_t), .HEX4_o(HEX4_t), .HEX5_o(HEX5_t)
);

initial clk = 0;
always #10 clk = ~clk;

wire w_btn0;



initial begin
SW_t[1] = 1'b1;//reset
#50;
SW_t[1] = 1'b0;
#50;

SW_t[9:8] = 2'b01;
SW_t[7:6] = 2'b00;
SW_t[5:2] = 4'b0101;
#50;
SW_t[0] = 1;//enter
#100;
//SW_t[0] = 0;
key_t[3:0] = 4'b1001;
#100;

end

/*
always@(LEDR) begin
$display("LEDR0=%b -",LEDR[3:0], "LEDR1=%b -",LEDR[9:6]);
end

always@(HEX0_t or HEX1_t or HEX2_t or HEX3_t or HEX4_t or HEX5_t) begin
$display("HEX0=%b -",HEX0_t,"HEX1=%b -", HEX1_t,"HEX2=%b -", HEX2_t,"HEX3=%b", HEX3_t, "HEX4=%b -", HEX4_t,"HEX5=%b", HEX5_t);
end

*/
endmodule
