/*	21/06/2024 feito por Richard 	
	incrementar o endere¸co que ser´a inserido na ROM
*/

module Counter_fpga(
	clk, 
	R,
	E,
	data,
	SEQFPGA,
	tc
);

input wire 	clk; 
input wire 	R;
input wire 	E;
input wire [3:0] data;
output reg [3:0] SEQFPGA;
output reg tc;
reg [3:0] total;


always@(posedge clk or posedge R or posedge E or posedge data)begin
if(R == 1'b1)begin
	 total = 4'b0000;
	 tc = 1'b0; end
  else begin 
		if (E == 1'b1) begin  
		total = total + 1'b1;
		SEQFPGA = total;
			if(total == data) tc=1'b1; 
			end
		end
end	
endmodule