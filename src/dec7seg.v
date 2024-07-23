/*
	dec7seg.v
	Rodrigo pereira - 08/04/2024
	
	Decodificador Display 7 segmentos
	
   DECIMAL | BINARIO
	 0    - 7'b000_0001
    1    - 7'b100_1111
    2    - 7'b001_0010
    3    - 7'b000_0110
    4    - 7'b100_1100
    5    - 7'b010_0100
    6    - 7'b010_0000
    7    - 7'b000_1111
    8    - 7'b000_0000
    9    - 7'b000_0100	
	 
	 
	 https://www.focuslk.com/design-of-bcd-to-7-segment-display-decoder-using-logic-gates/
*/

module dec7seg (
    G_i,
    O_o
);
     
   localparam BCD_SIZE = 4;
	localparam SEG_SIZE = 7;
	 
    input  wire [BCD_SIZE - 1:0] G_i;
    output reg  [SEG_SIZE - 1:0] O_o;
 
    always @(G_i) begin
        case (G_i)
            4'h0 : O_o = ~7'b011_1111;   
				4'h1 : O_o = ~7'b000_0110;   
				4'h2 : O_o = ~7'b101_1011;
				4'h3 : O_o = ~7'b100_1111;
				4'h4 : O_o = ~7'b110_0110;
				4'h5 : O_o = ~7'b110_1101;
				4'h6 : O_o = ~7'b111_1101;
				4'h7 : O_o = ~7'b000_0111;
				4'h8 : O_o = ~7'b111_1111;
				4'h9 : O_o = ~7'b110_1111;
				4'hA : O_o = ~7'b111_0111;
				4'hB : O_o = ~7'b111_1100;
				4'hC : O_o = ~7'b011_1001;
				4'hD : O_o = ~7'b101_1110;
				4'hE : O_o = ~7'b111_1001;
				4'hF : O_o = ~7'b111_0001;
         default: O_o = ~7'b100_0000;
        endcase
    end 
endmodule