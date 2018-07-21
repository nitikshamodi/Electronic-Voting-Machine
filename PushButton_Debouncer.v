`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:17:50 10/20/2017 
// Design Name: 
// Module Name:    PushButton_Debouncer 
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
module PushButton_Debouncer(
    input clk,
    input pb,
    output down
);

reg state;
reg sync_0;  always @(posedge clk) sync_0 <= pb;  
reg sync_1;  always @(posedge clk) sync_1 <= sync_0;

reg [15:0] count;

wire idle = (state==sync_1);
wire count_max = &count;	

always @(posedge clk)
if(idle)
    count <= 0;  
else
begin
    count <= count + 16'd1;  
    if(count_max) state <= ~state;
end
assign down = ~idle & count_max & state;
endmodule 