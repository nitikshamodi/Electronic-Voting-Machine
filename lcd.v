`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:51 10/15/2017 
// Design Name: 
// Module Name:    lcd 
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
module lcd (
	input            clk,
	output reg       lcd_rs,
	output reg       lcd_rw,
	output reg       lcd_e,
	output reg [7:4] lcd_d,
	output     [4:0] mem_addr,
	input      [7:0] mem_bus
	);
	
	reg        [24:0] count = 0;
	reg        [5:0] lcd_state = 6'b010000;
	reg              init = 1;        
	reg              row = 0;          
	
	assign mem_addr = {row, count[17:14]};
	
	initial count[24:19] = 11;

	always @ (posedge clk) begin
		count <= count + 1;
		if (init) begin                    
			case (count[24:19])
				1: lcd_state <= 6'b000010;    
				2: lcd_state <= 6'b000010;
				3: lcd_state <= 6'b001000;
				4: lcd_state <= 6'b000000;    
				5: lcd_state <= 6'b001100;
				6: lcd_state <= 6'b000000;    
				7: lcd_state <= 6'b000001;
				8: lcd_state <= 6'b000000;    
				9: lcd_state <= 6'b000110;
				10: begin init <= ~init; count <= 0; end
			endcase
			{lcd_e,lcd_rs,lcd_rw,lcd_d[7:4]} <= {^count[18:17] & ~lcd_rw,lcd_state}; 
		end else begin                                                              
			case (count[18:13]) 
				32: lcd_state <= {3'b001,~row,2'b00};                                 
				33: lcd_state <= 6'b000000;
				34: begin count <= 0; row <= ~row; end                                
				default: lcd_state <= {2'b10, ~count[13] ? mem_bus[7:4] : mem_bus[3:0]}; 
			endcase
			{lcd_e,lcd_rs,lcd_rw,lcd_d[7:4]} <= {^count[12:11] & ~lcd_rw,lcd_state};
		end
	end
endmodule
