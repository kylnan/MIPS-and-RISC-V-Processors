`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2022 07:09:33 PM
// Design Name: 
// Module Name: dff_SR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dff_PC(clk, d, preset, clear, q);

input d, clk, preset, clear;
    output q; 
    
    assign q = (preset == 1'b1 && clear == 1'b0) ? 1'b1 : (preset == 1'b0 && clear == 1'b1) ? 0 : d;

endmodule
