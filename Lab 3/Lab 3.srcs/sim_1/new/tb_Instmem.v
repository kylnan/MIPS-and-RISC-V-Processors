`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 08:28:48 PM
// Design Name: 
// Module Name: tb_Instmem
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


module tb_Instmem();
reg [7:0]addr_tb;
wire [31:0]instruction_tb;

Instmem instant(
    .addr(addr_tb),
    .instruction(instruction_tb)
    );
    
initial
 begin
    addr_tb[7:2] = 'd16;
    #20 
    addr_tb[7:2] = 'd3;
    #20
    addr_tb[7:2] = 'd15;
    #20
    addr_tb[7:2] = 'd9;
    #20
    $finish;
  end   
endmodule
