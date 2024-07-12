`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/// data memory
//////////////////////////////////////////////////////////////////////////////////

module DataMem(MemRead, MemWrite, addr, write_data, read_data);
// Define I/O ports
input MemRead, MemWrite;
input       [8:0]  addr;
input       [31:0] write_data;
output reg  [31:0] read_data;
       reg  [31:0] dataMemory [127:0];



// Describe DataMem behavior 
always @(*)
begin
    if (MemRead == 1'b1)
    begin
        read_data = dataMemory[addr[8:2]];
    end
    if (MemWrite == 1'b1)
    begin
        dataMemory[addr[8:2]] = write_data;
    end
end
endmodule
     
