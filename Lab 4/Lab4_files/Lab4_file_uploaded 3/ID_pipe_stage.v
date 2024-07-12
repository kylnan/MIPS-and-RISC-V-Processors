`timescale 1ns / 1ps


module ID_pipe_stage(
    input  clk, reset, 
    input  [9:0] pc_plus4, 
    input  [31:0] instr, 
    input  mem_wb_reg_write, 
    input  [4:0] mem_wb_write_reg_addr,
    input  [31:0] mem_wb_write_back_data,
    input  Data_Hazard,
    input  Control_Hazard,
    output [31:0] reg1, reg2,
    output [31:0] imm_value,
    output [9:0] branch_address,
    output [9:0] jump_address,
    output branch_taken,
    output [4:0] destination_reg, 
    output mem_to_reg,
    output [1:0] alu_op,
    output mem_read,  
    output mem_write,
    output alu_src,
    output reg_write,
    output jump
    );
    
    wire branch;
    wire eq_test_output;
    wire control_hazard;
    wire [1:0]  alu_op_in;
    wire reg_dst;
    wire mem_to_reg_in, mem_read_in, mem_write_in, alu_src_in, reg_write_in;
    // write your code here 
    // Remember that we test if the branch is taken or not in the decode stage. 	
        
    assign eq_test_output = ((reg1 ^ reg2) == 32'd0) ? 1'b1: 1'b0;
    assign jump_address = instr[25:0] << 2;
    assign branch_address = pc_plus4 + (imm_value << 2);
    assign branch_taken = branch & eq_test_output;
    assign control_hazard = ~Data_Hazard | Control_Hazard;
    register_file reg_file 
    (
        .clk(clk),  
        .reset(reset),  
        .reg_write_en(mem_wb_reg_write),  
        .reg_write_dest(mem_wb_write_reg_addr),  
        .reg_write_data(mem_wb_write_back_data),  
        .reg_read_addr_1(instr[25:21]), 
        .reg_read_addr_2(instr[20:16]), 
        .reg_read_data_1(reg1),
        .reg_read_data_2(reg2));  
    
    sign_extend sign_ext
    (
        .sign_ex_in(instr[15:0]),
        .sign_ex_out(imm_value));
    
    control ctrl
    (
        .reset(reset),
        .opcode(instr[31:26]),
        .reg_dst(reg_dst),
        .mem_to_reg(mem_to_reg_in),
        .alu_op(alu_op_in),
        .mem_read(mem_read_in),
        .mem_write(mem_write_in),
        .alu_src(alu_src_in),
        .reg_write(reg_write_in),
        .branch(branch),
        .jump(jump));
    
    mux2 #(.mux_width(5)) dest_reg_mux
    (      .a(instr[20:16]),
           .b(instr[15:11]),
           .sel(reg_dst),
           .y(destination_reg));
    
    mux2 #(.mux_width(1)) mem_to_reg_mux
    (      .a(mem_to_reg_in),
           .b(1'b0),
           .sel(control_hazard),
           .y(mem_to_reg));
    
    mux2 #(.mux_width(2)) alu_op_mux
    (      .a(alu_op_in),
           .b(2'b00),
           .sel(control_hazard),
           .y(alu_op));
    
    mux2 #(.mux_width(1)) mem_read_mux
    (      .a(mem_read_in),
           .b(1'b0),
           .sel(control_hazard),
           .y(mem_read));
    
    mux2 #(.mux_width(1)) mem_write_mux
    (      .a(mem_write_in),
           .b(1'b0),
           .sel(control_hazard),
           .y(mem_write));
    
    mux2 #(.mux_width(1)) alu_src_mux
    (      .a(alu_src_in),
           .b(1'b0),
           .sel(control_hazard),
           .y(alu_src));
    
    mux2 #(.mux_width(1)) reg_write_mux
    (      .a(reg_write_in),
           .b(1'b0),
           .sel(control_hazard),
           .y(reg_write));
endmodule
