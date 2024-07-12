`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 04:33:30 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
    InstCode ,
    ImmOut
    );
    

// The input and output signals
input [31:0] InstCode ;
output reg [31:0] ImmOut ;
// The ImmGen modules behavior
always @( InstCode )
    begin
        case ( InstCode [6:0])
            // I- type - Load
            7'b0000011 :
                ImmOut = { InstCode [31]? {20{1 'b1 }}:20 'b0 , InstCode [31:20]};
            // I- type - non - Load
            7'b0010011 :
                ImmOut = { InstCode [31]? {20{1 'b1 }}:20 'b0 , InstCode [31:20]};
            // S- type - Store
            7'b0100011 :
                ImmOut = { InstCode [31]? {20{1 'b1 }}:20 'b0 , InstCode [31:25] , InstCode [11:7]};
            // U- type
            7'b0010111 :
                ImmOut = { InstCode [31:12] , 12 'b0 };
            default :
                ImmOut = {32 'b0 };
        endcase
    end
endmodule


