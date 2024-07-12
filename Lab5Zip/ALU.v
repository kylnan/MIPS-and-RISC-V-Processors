`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UC Irvine
// Engineer: Kyle Cayanan
// 
// Create Date: 01/19/2021 11:44:26 AM
// Design Name: 32 Bit Arithmetic Logic Unit
// Module Name: alu_32
// Project Name: 32 Bit Arithmetic Logic Unit
// Target Devices: 
// Tool Versions: 
// Description: 32 Bit ALU that does several operations including
// ADD, SUBTRACT, AND, OR, NOR, LESS THEN, EQUAL TO
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Module Definition
module alu_32(A_in, B_in, ALU_Sel, ALU_Out, Carry_Out, Zero, Overflow);
//Defining I/O Ports
    input       [31:0] A_in, B_in;
    input       [3:0]  ALU_Sel;
    output reg  [31:0] ALU_Out;
    output reg  Carry_Out;
    output      Zero;
    output reg  Overflow;
//Describe ALU Behaviour
    assign Zero = (ALU_Out == 32'b0) ? 1'b1: 1'b0;
    always @(*)
     begin
     Carry_Out = 0;
     Overflow = 0;
        case(ALU_Sel)
            //AND
            4'b0000: 
                begin
                ALU_Out = A_in & B_in;
                end
            //OR
            4'b0001: 
                begin
                ALU_Out = A_in | B_in;
                end
            //ADD
            4'b0010: 
                begin 
                {Carry_Out, ALU_Out} = $signed(A_in) + $signed(B_in);
                {Overflow} = (( A_in [31] & B_in [31] & ALU_Out [31]) | A_in [31] & B_in [31] & ALU_Out [31]) ? 1'b1 : 1'b0;
                end
            //SUB
            4'b0110: 
                begin
                {ALU_Out} = $signed(A_in) - $signed(B_in);
                {Overflow} = (A_in[31] == ~B_in[31]) && (ALU_Out[31] != (A_in[31])) ? 1'b1 : 1'b0; 
                end
            //Set less than
            4'b0111: 
                begin
                ALU_Out = ($signed(A_in) < $signed(B_in)) ? 32'd1: 32'd0;
                end
            //NOR
            4'b1100:
                begin 
                ALU_Out = ~(A_in | B_in);
                end
            //Equal Comparison
            4'b1111: 
                begin
                ALU_Out = A_in == B_in ? 32'd1: 32'd0;
                end 
            default: ALU_Out = A_in + B_in ;
         endcase
     end
endmodule
