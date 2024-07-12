`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 08:27:24 PM
// Design Name: 
// Module Name: MUX_21_tb
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


module tb_mux21();

    reg S_tb= 0;
    reg D1_tb = 0;
    reg D2_tb = 0;
    wire Y_tb;
    
    MUX_21 instant
    (
        .S(S_tb),
        .D1(D1_tb),
        .D2(D2_tb),
        .Y(Y_tb)
    );
    initial
     begin
        D1_tb = 0;
        D2_tb = 1;
        S_tb = 0;
        #20;
        
        D1_tb = 0;
        D2_tb = 1;
        S_tb = 1;
        #20;
      end
        
endmodule
