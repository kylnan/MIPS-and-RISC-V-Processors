`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 12:23:31 PM
// Design Name: 
// Module Name: FA
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


module FA(
    A,
    B,
    Cin,
    Sum,
    Cout
);
   
   //Define input and output variables
   input A;
   input B;
   input Cin;
   output Sum;
   output Cout;
   
   //Define the full adder modules behaviour
   assign Sum = A^B^Cin;
   assign Cout =(A&B)|(A&Cin)|(B&Cin);

endmodule //FA