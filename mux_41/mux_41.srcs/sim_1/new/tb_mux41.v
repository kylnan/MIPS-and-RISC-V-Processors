`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 04:14:14 PM
// Design Name: 
// Module Name: tb_mux41
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


module tb_Mux_4_To_1();

    reg [1:0]S_tb = 2'b00;
    reg D1_tb = 0;
    reg D2_tb = 0;
    reg D3_tb = 0;
    reg D4_tb = 0;
    wire Y_tb;

    Mux_4_To_1 instant
    (
        .S(S_tb),
        .D1(D1_tb),
        .D2(D2_tb),
        .D3(D3_tb),
        .D4(D4_tb),
        .Y(Y_tb)
        
    );

    initial
     begin
        D1_tb = 0;
        D2_tb = 1;
        D3_tb = 0;
        D4_tb = 1;
        S_tb = 2'b00;
        #20;
     
        D1_tb = 0;
        D2_tb = 1;
        D3_tb = 0;
        D4_tb = 1;
        S_tb = 2'b01;
        #20;
     
        D1_tb = 0;
        D2_tb = 1;
        D3_tb = 0;
        D4_tb = 1;
        S_tb = 2'b10;
        #20;
     
        D1_tb = 0;
        D2_tb = 1;
        D3_tb = 0;
        D4_tb = 1;
        S_tb = 2'b11;
        #20;
     end
endmodule
