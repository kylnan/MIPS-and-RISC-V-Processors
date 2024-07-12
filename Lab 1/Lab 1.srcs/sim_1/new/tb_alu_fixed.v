`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2022 11:28:28 AM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu_fixed;

    integer i = 0;
    integer j = 0;
    reg [3:0]r_A = 4'b0000;
    reg [3:0]r_B = 4'b0000;
    reg [3:0]r_ALU_Sel;
    wire [3:0]w_ALU_Out;
    wire w_CarryOut;
     
     alu_fixed alu_fixed_inst
     (
        .A(r_A),
        .B(r_B),
        .ALU_Sel(r_ALU_Sel),
        .ALU_Out(w_ALU_Out),
        .CarryOut(w_CarryOut)
      );
    
    initial
        begin
        // Test Addition operation
        r_ALU_Sel = 4'b0000;
        for (i = 4'b0 ; i <= 4'b1111 ; i=i+1)
            begin
                for(j = 4'b0; j <= 4'b1111; j=j+1)
                begin
                    r_A = i;
                    r_B = j;
                    #10;
                end
            end
            
        // Multiplication
        r_ALU_Sel = 4'b0010;
        for (i = 4'b0 ; i <= 4'b1111 ; i=i+1)
            begin
                for(j = 4'b0; j <= 4'b1111; j=j+1)
                begin
                    r_A = i;
                    r_B = j;
                    #10;
                end
            end
            
        // Logical Shift left
        r_ALU_Sel = 4'b0100;
        for (i = 4'b0 ; i <= 4'b1111 ; i=i+1)
            begin
                    r_A = i;
                    #10;
            end
            
        // Rotate Right
        r_ALU_Sel = 4'b0111;
        for (i = 4'b0 ;  i <= 4'b1111 ; i=i+1)
            begin
                    r_A = i;
                    #10;
            end
            
        // Logical AND
        r_ALU_Sel = 4'b1000;
        for (i = 4'b0 ; i <= 4'b1111 ; i=i+1)
            begin
                for(j = 4'b0; j <= 4'b1111; j=j+1)
                begin
                    r_A = i;
                    r_B = j;
                    #10;
                end
            end
            
        // Greater Comparison
        r_ALU_Sel = 4'b1110;
        for (i = 4'b0 ; i <= 4'b1111 ; i=i+1)
            begin
                for(j = 4'b0; j <= 4'b1111; j=j+1)
                begin
                    r_A = i;
                    r_B = j;
                    #10;
                end
            end        
        end 
endmodule
