`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2021 11:25:15 AM
// Design Name: 
// Module Name: FA32
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


module FA32(Sum, Cout, A, B);
   // Define I/O signals
   output reg [31:0] Sum;
   output reg Cout ;
   input [31:0] A;
   input [31:0] B;
   // Describe FA behaviour
   always @(A, B)
        {Cout , Sum} = A + B;
endmodule
