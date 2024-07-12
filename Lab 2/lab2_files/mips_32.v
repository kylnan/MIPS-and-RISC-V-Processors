`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2021 12:36:56 PM
// Design Name: 
// Module Name: mips_32
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


module mips_32(
    input clk, reset,  
    output[31:0] result
    );
    
    wire reg_dst, reg_write, alu_src, mem_read, mem_write, mem_to_reg;
    wire [3:0] ALU_Control;
    wire [5:0] inst_31_26, inst_5_0;
    wire [1:0] alu_op;
    wire branch, jump;
    
    datapath datapath_unit(
        .clk(clk), 
        .reset(reset), 
        .reg_dst(reg_dst), 
        .reg_write(reg_write),
        .alu_src(alu_src),  
        .mem_read(mem_read), 
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg), 
        .ALU_Control(ALU_Control), 
        .branch(branch),
        .jump(jump),
        .datapath_result(result),
        .inst_31_26(inst_31_26), 
        .inst_5_0(inst_5_0));
                    
                           
    control control_unit(
        .reset(reset),
        .opcode(inst_31_26),
        .reg_dst(reg_dst), 
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op),
        .mem_read(mem_read),  
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_write(reg_write),
        .branch(branch),
        .jump(jump)); 
        

    ALUControl ALU_Control_unit(
        .ALUOp(alu_op),
        .Function(inst_5_0),
        .ALU_Control(ALU_Control));
          
endmodule
