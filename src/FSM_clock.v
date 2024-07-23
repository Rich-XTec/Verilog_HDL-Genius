/*	21/06/2024 
	feito por Richard 	
	FSM_clock entra clk_i de 50MHz e sai clocks de 1Hz, 2Hz, 3Hz, 5Hz
*/
module FSM_clock(
	clk_i, 
	rst_i,
	clk_5, clk_3, clk_2, clk_1
);

input  wire clk_i, rst_i;
output reg clk_5, clk_3, clk_2, clk_1;
reg [27:0] c1, c2, c3, c5;

//tempo de clock para 50MHz sao 50M de pulsos por s, 5Hz sao 5 pulsos por s

always@(posedge clk_i or posedge rst_i) 
begin
if (rst_i == 1'b1)begin
	c1=0;
	c2=0;
	c3=0; 
	c5=0; 
	clk_5=1'b0;
	clk_3=1'b0;
	clk_2=1'b0;
	clk_1=1'b0;  end
else begin
	  c1 = c1 + 1'b1;
	  c2 = c2 + 1'b1;
	  c3 = c3 + 1'b1;
	  c5 = c5 + 1;
	  if(c5 == 10) begin //10000000
			clk_5 = ~clk_5;
			c5 =0; end
		if(c3 == 166) begin //16666667
			clk_3 = ~clk_3;
			c3 =0; end
		if(c2 == 250) begin//25000000
			clk_2 = ~clk_2;
			c2 =0; end
		if(c1 == 500) begin //50000000
			clk_1 = ~clk_1;
			c1 =0; end
	  end
	  
end
endmodule
