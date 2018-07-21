`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:      Nitiksha
// 
// Create Date:    22:12:16 10/20/2017 
// Design Name: 
// Module Name:    test_evm 
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
module test_code(

// for lcd
input clk,
output lcd_rs,lcd_rw,lcd_e,
output [11:8] sf_d,
//for lcd---------------------------------

// for registration
input reset, submit,
input a,b,c, d, e, f, g, h, j, k, back_space,
// registration---------------------------

//for pushbutton
//pushbutton------------------------------

//for verification1
//verification1---------------------------

//for verification2
output reg true_val
//verification2---------------------------

//Block Memory
//
);
wire [39:0] douta;
wire wea;
reg web;
wire dinb;
wire [39:0]dina;
wire doutb;

//

reg [43:0]p= 44'b11111111111111111111111111111111111111111111; 
reg [9:0]jc = 10'b0000000000;
reg [3:0]place;
reg [9:0]addra;
reg [9:0]addrb;

wire [7:0] char_mem_bus;
wire [4:0] char_mem_addr;

wire a_down;
wire b_down;
wire c_down;
wire d_down;
wire e_down;
wire f_down;
wire g_down;
wire h_down;
wire j_down;
wire k_down;
wire bs_down;
	 
assign wea = 0;
assign dinb = 1;

// Block Memory

block_ram stage0 (
  .clka(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [9 : 0] addra
  .dina(dina), // input [39 : 0] dina
  .douta(douta) // output [39 : 0] douta
);


verify stage_1 (
  .clka(clk), // input clka
  .wea(web), // input [0 : 0] wea
  .addra(addrb), // input [9 : 0] addra
  .dina(dinb), // input [0 : 0] dina
  .douta(doutb) // output [0 : 0] douta
);



PushButton_Debouncer pb8(clk,c, c_down);
PushButton_Debouncer pb7(clk,d, d_down);
PushButton_Debouncer pb6(clk,e, e_down);
PushButton_Debouncer pb5(clk,f, f_down);
PushButton_Debouncer pb4(clk,g, g_down);
PushButton_Debouncer pb3(clk,h, h_down);
PushButton_Debouncer pb2(clk,j, j_down);
PushButton_Debouncer pb1(clk,b, b_down);
PushButton_Debouncer pb9(clk,a, a_down);
PushButton_Debouncer pb0(clk,k, k_down);
PushButton_Debouncer pbbs(clk,back_space, bs_down);

always @(posedge clk) 
begin
	web = 0;
	if(reset)
	begin
	web = 1;
	p = 44'b11111111111111111111111111111111111111111111;
	end
	else if(submit)
	begin
	p[43:40] = 4'b1110;
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0000;
								if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0000;
								if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0000;
								if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0000;
								if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0000;
								if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0000;
								if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0000;
								if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0000;
								if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0000;
								if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0000;
	end
	else if(bs_down)
	begin
								if(p[7:4] == 4'b1111)
									p[3:0] = 4'b1111;
								else if(p[11:8] == 4'b1111)
									p[7:4] = 4'b1111;
								else if(p[15:12] == 4'b1111)
									p[11:8] = 4'b1111;
								else if(p[19:16] == 4'b1111)
									p[15:12] = 4'b1111;
								else if(p[23:20] == 4'b1111)
									p[19:16] = 4'b1111;
								else if(p[27:24] == 4'b1111)
									p[23:20] = 4'b1111;
								else if(p[31:28] == 4'b1111)
									p[27:24] = 4'b1111;
								else if(p[35:32] == 4'b1111)
									p[31:28] = 4'b1111;
								else if(p[39:36] == 4'b1111)
									p[35:32] = 4'b1111;
	end
	
	else if(a_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b1001;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b1001;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b1001;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b1001;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b1001;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b1001;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b1001;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b1001;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b1001;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b1001;
	end
	
	else if(b_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0001;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0001;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0001;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0001;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0001;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0001;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0001;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0001;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0001;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0001;
	end
	
	else if(c_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b1000;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b1000;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b1000;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b1000;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b1000;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b1000;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b1000;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b1000;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b1000;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b1000;
	end
	else if(d_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0111;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0111;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0111;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0111;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0111;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0111;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0111;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0111;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0111;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0111;
	end
	else if(e_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0110;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0110;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0110;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0110;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0110;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0110;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0110;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0110;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0110;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0110;
	end
	else if(f_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0101;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0101;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0101;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0101;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0101;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0101;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0101;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0101;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0101;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0101;
	end
	else if(g_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0100;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0100;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0100;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0100;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0100;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0100;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0100;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0100;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0100;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0100;
	end
	else if(h_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0011;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0011;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0011;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0011;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0011;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0011;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0011;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0011;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0011;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0011;
	end
	else if(j_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0010;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0010;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0010;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0010;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0010;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0010;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0010;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0010;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0010;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0010;
	end
	else if(k_down)
	begin
								if(p[3:0] == 4'b1111)
									p[3:0] = 4'b0000;
								else if(p[7:4] == 4'b1111)
									p[7:4] = 4'b0000;
								else if(p[11:8] == 4'b1111)
									p[11:8] = 4'b0000;
								else if(p[15:12] == 4'b1111)
									p[15:12] = 4'b0000;
								else if(p[19:16] == 4'b1111)
									p[19:16] = 4'b0000;
								else if(p[23:20] == 4'b1111)
									p[23:20] = 4'b0000;
								else if(p[27:24] == 4'b1111)
									p[27:24] = 4'b0000;
								else if(p[31:28] == 4'b1111)
									p[31:28] = 4'b0000;
								else if(p[35:32] == 4'b1111)
									p[35:32] = 4'b0000;
								else if(p[39:36] == 4'b1111)
									p[39:36] = 4'b0000;
	end
end 

//verification
reg flag = 0;
always@(posedge clk)
begin
	addrb = jc;
	if(p [43:40] == 4'b1111)
	begin
			flag = 0;
			place = 4'b0000;
			true_val = 0;
			addra = 10'b0000000000;
	end
	else if(doutb == 1)
	begin
		place = 4'b0001;
		true_val = 0;
	end
	else 
	begin 
		place = 4'b1111;
		true_val = 1;
	end
	
	
	if(p [43:40] == 4'b1111)
	begin
			flag = 0;
			place = 4'b0000;
			true_val = 0;
			addra = 10'b0000000000;
	end
	else
	begin
		if(douta == p[39:0])
		begin
			if(flag == 0)
			begin
				addra = addra-1;
				jc = addra;
			end
			else
			begin
				addra = jc;
			end
			flag = 1;			
		end
		else
		begin
		addra = addra + 1;
		end
		
		if(addra == 1023)
		begin
			place = 4'b0001;
		end
	end
end

//display
char_mem char_mem (char_mem_addr, char_mem_bus, p[39:0], place);
lcd lcd (clk, lcd_rs, lcd_rw, lcd_e, sf_d, char_mem_addr, char_mem_bus);

endmodule
