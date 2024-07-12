`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 12:23:19 PM
// Design Name: 
// Module Name: processor
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


module processor
(
input clk , reset ,
output [31:0] Result
);

// Define the input and output signals
wire    [6:0]   Funct7;
wire    [2:0]   Funct3;
wire    [6:0]   Opcode;
wire    [1:0]   ALUOp;
wire    [3:0]   Operation;
wire    RegWrite;
wire    ALUSrc;
wire    MemRead;
wire    MemWrite;
wire    MemtoReg;

// Define the processor modules behavior
data_path datapath(.clk         (   clk         ), 
                   .reset       (   reset       ), 
                   .reg_write   (   RegWrite    ), 
                   .mem2reg     (   MemtoReg    ),  
                   .alu_src     (   ALUSrc      ), 
                   .mem_write   (   MemWrite    ), 
                   .mem_read    (   MemRead     ), 
                   .alu_cc      (   Operation   ), 
                   .opcode      (   Opcode      ), 
                   .funct3      (   Funct3      ), 
                   .funct7      (   Funct7      ),  
                   .alu_result  (   Result      ));
                   
Controller controller(.Opcode   (   Opcode     ), 
                      .ALUOp    (   ALUOp      ), 
                      .RegWrite (   RegWrite   ), 
                      .ALUSrc   (   ALUSrc     ), 
                      .MemRead  (   MemRead    ), 
                      .MemWrite (   MemWrite   ), 
                      .MemtoReg (   MemtoReg   ));     

ALUController aluController(.ALUOp      (   ALUOp       ), 
                            .Funct3     (   Funct3      ), 
                            .Funct7     (   Funct7      ), 
                            .Operation  (   Operation   ));           
                    
                    
endmodule // processor

