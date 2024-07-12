`timescale 1ns / 1ps

module EX_pipe_stage(
    input [31:0] id_ex_instr,
    input [31:0] reg1, reg2,
    input [31:0] id_ex_imm_value,
    input [31:0] ex_mem_alu_result,
    input [31:0] mem_wb_write_back_result,
    input id_ex_alu_src,
    input [1:0] id_ex_alu_op,
    input [1:0] Forward_A, Forward_B,
    output [31:0] alu_in2_out,
    output [31:0] alu_result
    );
    
    wire [31:0] reg1_mux_output;
    wire [31:0] reg2_mux_output;
    wire [31:0] alu_src_mux_output;
    wire [3:0]  ALU_Control;
    
    assign alu_in2_out = reg2_mux_output;
    
    mux4 #(.mux_width(32)) reg1_mux
    (
        .a(reg1),
        .b(mem_wb_write_back_result),
        .c(ex_mem_alu_result),
        .sel(Forward_A),
        .y(reg1_mux_output));

    mux4 #(.mux_width(32)) reg2_mux
    (
        .a(reg2),
        .b(mem_wb_write_back_result),
        .c(ex_mem_alu_result),
        .sel(Forward_B),
        .y(reg2_mux_output));
        
    mux2 #(.mux_width(32)) alu_src_mux
    (
        .a(reg2_mux_output),
        .b(id_ex_imm_value),
        .sel(id_ex_alu_src),
        .y(alu_src_mux_output));
        
    ALUControl alucontrol
    (
        .ALUOp(id_ex_alu_op),
        .Function(id_ex_instr[5:0]),
        .ALU_Control(ALU_Control));
        
    ALU alu
    (
        .a(reg1_mux_output),
        .b(alu_src_mux_output),
        .alu_control(ALU_Control),
        .alu_result(alu_result));
       
endmodule
