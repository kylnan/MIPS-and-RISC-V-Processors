`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 01:56:03 PM
// Design Name: 
// Module Name: FourBFA_tb
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


module tb_FA4();

    reg [3:0]A_tb = 4'b0000;
    reg [3:0]B_tb = 4'b0000;
    reg Cin_tb = 0;
    wire [3:0]Sum_tb;
    wire Cout_tb;
    
    FourBFA instant
    (
        .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_tb),
        .Cout(Cout_tb)
    );
     
    initial
     begin
        A_tb = 4'b0110;
        B_tb = 4'b0100;
        Cin_tb = 1'b0;
        #20;
        
        A_tb = 4'b1000;
        B_tb = 4'b1001;
        Cin_tb = 1'b1;
        #20;
        
        A_tb = 4'b1110;
        B_tb = 4'b0010;
        Cin_tb = 1'b0;
        #20;
        
        A_tb = 4'b1010;
        B_tb = 4'b1011;
        Cin_tb = 1'b0;
        #20;
      end
         
endmodule
