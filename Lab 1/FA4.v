`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 01:00:12 PM
// Design Name: 
// Module Name: FourBFA
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


module FA4(
    A,
    B,
    Sum,
    Cin,
    Cout
    );
    
    //Define input and outputs
    input [3:0]A;
    input [3:0]B;
    input Cin;
    output [3:0] Sum;
    wire [2:0] Carry;
    output Cout;
    
    //Define module behaviour
    assign Sum[0] = A[0]^B[0]^Cin;
    assign Carry[0] = A[0]&B[0] | A[0]&Cin | B[0]&Cin;
    assign Sum[1] = A[1]^B[1]^Carry[0];
    assign Carry[1] = A[1]&B[1] | A[1]&Carry[0] | B[1]&Carry[0];
    assign Sum[2] = A[2]^B[2]^Carry[1];
    assign Carry[2] = A[2]&B[2] | A[2]&Carry[1] | B[2]&Carry[1];
    assign Sum[3] = A[3]^B[3]^Carry[2];
    assign Cout = A[3]&B[3] | A[3]&Carry[2] | B[3]&Carry[2];
    
endmodule
