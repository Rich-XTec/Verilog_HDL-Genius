/*	24/06/2024 feito por Richard 	
	COMP =
*/
module COMP(
	out_fpga,out_user,andCin
);

input wire [63:0] out_fpga,out_user;
output reg andCin;
	
always@(out_fpga or out_user)begin
if(out_fpga == out_user) andCin= 1'b1;
else andCin = 1'b0;

end
endmodule
