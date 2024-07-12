`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2021 01:15:54 PM
// Design Name: 
// Module Name: tb_RegFile
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


module tb_RegFile();
parameter lo = 4;
parameter hi = 31;
parameter z = 0;
    reg  tb_clk, tb_reset, tb_rg_wrt_en;
    reg  [lo:z] tb_rg_rd_addr1;
    reg  [lo:z] tb_rg_rd_addr2;
    reg  [lo:z] tb_rg_wrt_addr;
    reg  [hi:z] tb_rg_wrt_data;
    reg [hi:z] tb_register_file [hi:z];
    wire [hi:z] tb_rg_rd_data1, tb_rg_rd_data2; 
    
RegFile instant (
    .clk(tb_clk),
    .reset(tb_reset),
    .rg_wrt_en(tb_rg_wrt_en),
    .rg_rd_addr1(tb_rg_rd_addr1),
    .rg_rd_addr2(tb_rg_rd_addr2),
    .rg_wrt_addr(tb_rg_wrt_addr),
    .rg_wrt_data(tb_rg_wrt_data),
    .rg_rd_data1(tb_rg_rd_data1),
    .register_file(tb_register_file),
    .rg_rd_data2(tb_rg_rd_data2)
    );
    
always #100 tb_clk = ~tb_clk;
initial
 begin
    tb_clk = 1;
    tb_reset = 1;

    tb_rg_wrt_en = 1;
    tb_rg_wrt_addr = 5'b10010;
    tb_rg_wrt_data = 32'h11111000;    
    #100 tb_reset = 0;
    
 end
endmodule
