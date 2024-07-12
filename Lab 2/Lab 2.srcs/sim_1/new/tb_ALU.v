`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2021 12:15:31 PM
// Design Name: 
// Module Name: tb_alu_32
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


module tb_alu_32();
    reg [31:0]A_in_tb = 32'h00000000;
    reg [31:0]B_in_tb = 32'h00000000;
    reg [3:0]ALU_Sel_tb = 4'b0000;    
    wire [31:0]ALU_Out_tb;
    wire Carry_Out_tb;
    wire Zero_tb;
    wire Overflow_tb;

    
    alu_32 instant
    (
    .A_in(A_in_tb),
    .B_in(B_in_tb),
    .ALU_Sel(ALU_Sel_tb),
    .Carry_Out(Carry_Out_tb),
    .Zero(Zero_tb),
    .Overflow(Overflow_tb),
    .ALU_Out(ALU_Out_tb)
    );
    
    //Test Cases
    initial
        begin
            //Test 1
            A_in_tb = 32'h086a0c31;
            B_in_tb = 32'hd785f148;
            ALU_Sel_tb = 4'b0000;
            #20;
            
            //Test2
            A_in_tb = 32'h086a0c31;
            B_in_tb = 32'h10073fd4;
            ALU_Sel_tb = 4'b0001;
            #20;
            
            //Test3
            A_in_tb = 32'ha86a0c31;
            B_in_tb = 32'h90073fd4;
            ALU_Sel_tb = 4'b0010;
            #20;
            
            //Test4
            A_in_tb = 32'ha86a0c31;
            B_in_tb = 32'h90073fd4;
            ALU_Sel_tb = 4'b0110;
            #20;
            
            //Test5
            A_in_tb = 32'ha86a0c31;
            B_in_tb = 32'h90073fd4;
            ALU_Sel_tb = 4'b0111;
            #20;
            
            //Test6
            A_in_tb = 32'ha86a0c31;
            B_in_tb = 32'h90073fd4;
            ALU_Sel_tb = 4'b1100;
            #20;
            
            //Test7
            A_in_tb = 32'ha86a0c31;
            B_in_tb = 32'ha86a0c31;
            ALU_Sel_tb = 4'b1111;
            #20;
            
            //Test8
            A_in_tb = 32'ha86a0c31;
            B_in_tb = 32'h10073fd4;
            ALU_Sel_tb = 4'b1111;
            #20;
            
            //TestAddOverflow
            A_in_tb = 32'h7fffffff;
            B_in_tb = 32'h7fffffff;
            ALU_Sel_tb = 4'b0010;
            #20;
            
            //Test420
            A_in_tb = 32'h0190;
            B_in_tb = 32'h014;
            ALU_Sel_tb = 4'b0010;
            #20;
            
            //TestSubOverflow
            A_in_tb = 32'ha86a0c31;
            B_in_tb = 32'h7ffffff0;
            ALU_Sel_tb = 4'b0110;
            #20;
            
            $finish;
        end
endmodule
