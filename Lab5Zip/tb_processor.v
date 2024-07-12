`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 03:17:54 PM
// Design Name: 
// Module Name: tb_processor
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


module tb_processor ();
/** Clock & reset **/
reg clk , rst ;
wire [31:0] tb_Result ;
processor processor_inst (
. clk ( clk ),
. reset ( rst ) ,
. Result ( tb_Result )
);
always begin
# 10;
clk = ~ clk ;
end
initial begin
clk = 0;
@( posedge clk );
rst = 1;
@( posedge clk );
rst = 0;
end
integer point =0;
always @ (*)
begin
# 20;
if ( tb_Result == 32 'h00000000 ) // and
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h00000001 ) // addi
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h00000002 ) // addi
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h00000004 ) // addi
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'h00000005 ) // addi
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'h00000007 ) // addi
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h00000008 ) // addi
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h0000000b )// addi
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h00000003 ) // add
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'hfffffffe ) // sub
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'h00000000 ) // and
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'h00000005 ) // or
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'h00000001 )// SLT
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'hfffffff4 ) // NOR
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h000004D2 ) // andi
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'hfffff8d7 ) // ori
begin
point = point + 1;
end
# 20;
if ( tb_Result == 32 'h00000001 ) // SLTI
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'hfffffb2c ) // nori
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'h00000030 ) // sw
begin
point = point + 1;
end ;
# 20;
if ( tb_Result == 32 'h00000030 ) // lw
begin
point = point + 1;
end ;
$display ("% s%d " ," The number of correct test cases is :" , point );
end
initial begin
# 430;
$finish ;
end
endmodule
