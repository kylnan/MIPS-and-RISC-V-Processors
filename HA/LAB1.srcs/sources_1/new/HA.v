`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 11:17:09 AM
// Design Name: 
// Module Name: HA
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


module HA(
    A,
    B,
    Sum,
    Cout    
);

    // Define the input and output signals
    input [7:0]A;
    input [7:0]B;
    output[7:0]Sum;
    output Cout;
    // Define the modules behaviour
    assign Sum = A ^ B; // bitwise xor
    assign Cout = A & B ; // bitwise and
endmodule
