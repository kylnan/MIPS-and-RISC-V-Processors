`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2022 09:13:53 PM
// Design Name: 
// Module Name: tb_dff_SR
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


module tb_dff_PC();
reg D;
reg Preset;
reg Clear;
reg Clock;
wire Q;

dff_PC dff_PC_instant(
    .clk(Clock),
    .d(D),
    .preset(Preset),
    .clear(Clear),
    .q(Q));
    
initial
    begin
        D = 1'bx;
        Clock = 0;
    end
    
always
    begin
        Clock = 1'b1;
        #20;
        
        Clock = 1'b0;
        #20;
    end
    
 always
    begin
        #20 D = 1'b1; Preset = 1'b1; Clear = 1'b0;
        #20 D = 1'b1; Preset = 1'b0; Clear = 1'b1;
        #20 D = 1'b0; Preset = 1'b0; Clear = 1'b0;
    end
endmodule
