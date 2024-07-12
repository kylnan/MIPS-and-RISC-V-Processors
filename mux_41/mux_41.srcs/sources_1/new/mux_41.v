`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 03:47:09 PM
// Design Name: 
// Module Name: mux_41
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


// Module definition
module Mux_4_To_1 (
    input [1:0] S,
    input D1,
    input D2,
    input D3,
    input D4,
    output Y);

// Define the MUX4 :1 modules behavior
     assign Y = (S == 2'b00) ? D1: (S == 2'b01) ? D2: (S == 2'b10) ? D3: D4; 
endmodule //MUX4:1

