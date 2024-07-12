`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2022 11:21:51 AM
// Design Name: 
// Module Name: alu
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


module alu_fixed (
input [3:0] A ,B , // ALU 4 - bit Inputs
input [3:0] ALU_Sel ,// ALU Selection
output [3:0] ALU_Out , // ALU 4 - bit Output
output CarryOut // Carry Out Flag
);
reg [7:0] ALU_Result ;
assign ALU_Out = ALU_Result ; // ALU out
assign CarryOut = ALU_Result[4]; // Carryout flag
always @ (*)
begin
    case ( ALU_Sel )
    4'b0000 : // Addition
        ALU_Result = A + B ;
    4'b0001 : // Subtraction
        ALU_Result = A - B ;
    4'b0010 : // Multiplication
        ALU_Result = A * B ;
    4'b0011 : // Division
        ALU_Result = A / B ;
    4'b0100 : // Logical shift left
        ALU_Result = A << 1;
    4'b0101 : // Logical shift right
        ALU_Result = A >> 1;
    4'b0110 : // Rotate left
        ALU_Result = { A [2:0] , A [3]};
    4'b0111 : // Rotate right
        ALU_Result = { A [0] , A[3:1]};
    4'b1000 : // Logical and
        ALU_Result = A && B;
    4'b1001 : // Logical or
        ALU_Result = A || B ;
    4'b1010 : // Bitwise xor
        ALU_Result = A ^ B ;
    4'b1011 : // Logical nor
        ALU_Result = ~(A || B);
    4'b1100 : // Logical nand
        ALU_Result = ~(A && B);
    4'b1101 : // Bitwise xnor
        ALU_Result = ~(A ^ B);
    4'b1110 : // Greater comparison
        ALU_Result = (A > B) ? 4'b1 : 4'b0;
    4'b1111 : // Equal comparison
        ALU_Result = ( A == B ) ? 4'b1 : 4'b0;
    default : ALU_Result = A + B;
    endcase
end
endmodule
