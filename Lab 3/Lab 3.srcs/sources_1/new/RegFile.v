`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 11:27:07 AM
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    clk, 
    reset, 
    rg_wrt_en,
    rg_wrt_addr,
    rg_rd_addr1,
    rg_rd_addr2,
    rg_wrt_data,
    rg_rd_data1,
    rg_rd_data2
    );

//I/O ports
parameter N = 4;    
input clk, reset, rg_wrt_en;  
input  [N:0] rg_rd_addr1;
input  [N:0] rg_rd_addr2;
input  [N:0] rg_wrt_addr;
input  [31:0] rg_wrt_data;
output [31:0] rg_rd_data1, rg_rd_data2;
reg    [31:0] register_file [31:0];
    

//Defining behavior
integer i;
//async reset
always @(reset)
 begin
    if (reset == 1)
     begin 
        for (i = 0; i < 32; i = i + 1)
        begin
            register_file[i] = 32'h00000000;
        end
     end 
 end
 
 //read data
assign rg_rd_data1 = register_file[rg_rd_addr1];
assign rg_rd_data2 = register_file[rg_rd_addr2];

always @(posedge clk)
 begin
    if (reset == 0 && rg_wrt_en == 1)
     begin
        register_file[rg_wrt_addr] = rg_wrt_data;
     end
 end  
endmodule
