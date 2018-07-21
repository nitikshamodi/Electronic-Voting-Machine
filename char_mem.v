`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:16 10/15/2017 
// Design Name: 
// Module Name:    char_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module char_mem(
    input  [4:0] addr,
    output [7:0] bus,
	 input [39:0]p,
	 input [3:0] place
    );
	integer i;
	parameter LINES = 2;
	parameter CHARS_PER_LINE = 16;
	parameter BITS_PER_CHAR = 8;
	parameter STR_SIZE = LINES * CHARS_PER_LINE * BITS_PER_CHAR;
	reg[0:STR_SIZE-1] str;
	always @ (p)
	begin
		if (p == 40'b1111111111111111111111111111111111111111)
		str = "    Welcome!     Enter R. No. : ";
		else
		case (place)
		4'b1111 : str = "  Valid Number                  ";
		4'b0001 : str = " Invalid Number                 ";
		default :		
			begin
			str = "Registration No.   ";
			for (i = 0; i < 10 ; i=i+1)
				begin
					case(p[(4*i)+:4])
						4'b0000 : str = {str,"0"};
						4'b0001 : str = {str,"1"};
						4'b0010 : str = {str,"2"};
						4'b0011 : str = {str,"3"};
						4'b0100 : str = {str,"4"};
						4'b0101 : str = {str,"5"};
						4'b0110 : str = {str,"6"};
						4'b0111 : str = {str,"7"};
						4'b1000 : str = {str,"8"};
						4'b1001 : str = {str,"9"};
						4'b1111 : str = {str,"_"};
					endcase
				end
			str = {str,"   "};
			end
		endcase
	end
	
	
	assign bus = str[{addr[4:0], 3'b000}+:8];
endmodule

