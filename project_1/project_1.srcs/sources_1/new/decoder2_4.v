`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2021 04:00:14 PM
// Design Name: 
// Module Name: decoder2_4
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


module decoder2_4(
    input [1:0] dec_in,
    output [3:0] dec_out
    );
    reg [3:0] dec_r;
    assign dec_out = dec_r;
    always @ (dec_in) begin
       case (dec_in)
        2'b00 : dec_r = 4'b0001;
        2'b01 : dec_r = 4'b0010;
        2'b10 : dec_r = 4'b0100;
        2'b11 : dec_r = 4'b1000;
        default : dec_r =4'b0000;
       endcase
 end
endmodule
