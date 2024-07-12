`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 11:22:50 AM
// Design Name: 
// Module Name: Controller
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
module Controller (
Opcode ,
ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite ,
ALUOp
);

// Define the input and output signals
input       [6:0] Opcode;
output  reg [1:0] ALUOp;
output  reg       ALUSrc;
output  reg       RegWrite;
output  reg       MemRead;
output  reg       MemWrite;
output  reg       MemtoReg;

// Define the Controller modules behavior
always @ (*)
    begin
        case(Opcode)
            7'b0110011: //AND, OR, ADD, SUB, SLT, NOR
                begin
                ALUOp = 2'b10;
                RegWrite = 1'b1;
                ALUSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                end
            7'b0010011: //ANDI, ORI, ADDI, SLTI, NORI
                begin
                ALUOp = 2'b00;
                RegWrite = 1'b1;
                ALUSrc = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemtoReg = 1'b0;
                end
            7'b0000011: //LW
                begin
                ALUOp = 2'b01;
                RegWrite = 1'b1;
                ALUSrc = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                MemtoReg = 1'b1;
                end
            7'b0100011: //SW
                begin
                ALUOp = 2'b01;
                RegWrite = 1'b0;
                ALUSrc = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                MemtoReg = 1'b0;
                end    
        endcase
    end
endmodule // Controller
