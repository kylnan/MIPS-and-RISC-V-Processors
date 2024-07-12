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


module mux21(
    input S,
    input [31:0]D1,
    input [31:0]D2,
    output [31:0]Y
    );
    
    //Defining module behaviour
    assign Y = S ? D2 : D1;
    
endmodule
