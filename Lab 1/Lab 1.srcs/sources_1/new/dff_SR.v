`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2022 07:09:33 PM
// Design Name: 
// Module Name: dff_SR
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


module dff_SR(clk, d, set, reset, q);

    //IO Ports
    input d, clk, set, reset;
    output q; 
    reg q;
    
    always @(posedge clk)
        begin
            if (set == 1'b1 && reset == 1'b0)
                q <= 1;
            if (reset == 1'b1 && set == 1'b0)
                q <= 1'b0;
            if (set == 1'b0 && reset == 1'b0)
                q <= d;
        end
endmodule
