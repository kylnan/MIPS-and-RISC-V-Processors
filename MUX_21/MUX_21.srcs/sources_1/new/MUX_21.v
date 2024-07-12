`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 07:48:08 PM
// Design Name: 
// Module Name: MUX_21
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


module Mux_2_To_1(
    input S,
    input D1,
    input D2,
    output Y
    );
    
    //Defining module behaviour
    assign Y = S ? D2 : D1;
    
endmodule
