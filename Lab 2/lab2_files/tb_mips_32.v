`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2021 10:40:29 AM
// Design Name: 
// Module Name: tb_mips_32
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


module tb_mips_32;
      reg clk;  
      reg reset;  
      // Outputs  
      wire [31:0] result;
       
      // Instantiate the Unit Under Test (UUT)  
      mips_32 uut (  
           .clk(clk),   
           .reset(reset),     
           .result(result)    
      );  
      
      real points = 0;
      
      initial begin  
           clk = 0;  
           forever #10 clk = ~clk;  
      end
        
      initial begin  
           // Initialize Inputs  
 
           reset = 1;  
           // Wait 100 ns for global reset to finish  
           #100;  
           reset = 0;  
           // store some data in data memory
           uut.datapath_unit.data_mem.ram[0]= 32'b00000000000000000000000000000101;// 00000005
           uut.datapath_unit.data_mem.ram[1]= 32'b00001111110111110110111010010001;// 0fdf6e91 
           uut.datapath_unit.data_mem.ram[2]= 32'b01101010001100010100001110011011;// 6a31439b 
           uut.datapath_unit.data_mem.ram[3]= 32'b01010110001101000011111111111101;// 56343ffd 
           uut.datapath_unit.data_mem.ram[4]= 32'b01000010100111101110110111011011;// 429eeddb 
           uut.datapath_unit.data_mem.ram[5]= 32'b10010000000000000000000000000000;// 90000000 
           uut.datapath_unit.data_mem.ram[6]= 32'b10010001001101001111110101110101;// 9134fd75
           uut.datapath_unit.data_mem.ram[7]= 32'b10111100110100010001001001000111;// bcd11247
           uut.datapath_unit.data_mem.ram[8]= 32'b10110101010110111101100000110001;// b55bd831
           uut.datapath_unit.data_mem.ram[9]= 32'b11010001100011111010011000000000;// d18fa600
          
          #2670;
          /*
          if(uut.datapath_unit.data_mem.ram[11]==32'h6a314303) begin $display("ANDI 1		success!\n"); points =points + 1; end else $display("ANDI 1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[12]==32'hf020916a) begin $display("NOR  1		success!\n"); points =points + 1; end else $display("NOR  1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[13]==32'h00000001) begin $display("SLT  1		success!\n"); points =points + 1; end else $display("SLT  1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[14]==32'h7efb7488) begin $display("SLL  1		success!\n"); points =points + 1; end else $display("SLL  1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[15]==32'h00000000) begin $display("SRL  1		success!\n"); points =points + 1; end else $display("SRL  1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[16]==32'hfe400000) begin $display("SRA  1		success!\n"); points =points + 1; end else $display("SRA  1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[17]==32'h65ee2d0a) begin $display("XOR  1		success!\n"); points =points + 1; end else $display("XOR  1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[18]==32'h4f5d28d5) begin $display("MULT 1		success!\n"); points =points + 1; end else $display("MULT 1	 	failed!\n");
          if(uut.datapath_unit.data_mem.ram[19]==32'h032cafb6) begin $display("DIV  1		success!\n"); points =points + 1; end else $display("DIV  1	 	failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[20]==32'h00000d61) begin $display("ANDI 2		success!\n"); points =points + 1; end else $display("ANDI 2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[21]==32'h6000000a) begin $display("NOR  2		success!\n"); points =points + 1; end else $display("NOR  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[22]==32'h00000001) begin $display("SLT  2		success!\n"); points =points + 1; end else $display("SLT  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[23]==32'h9faea000) begin $display("SLL  2		success!\n"); points =points + 1; end else $display("SLL  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[24]==32'h0179a224) begin $display("SRL  2		success!\n"); points =points + 1; end else $display("SRL  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[25]==32'hed56f60c) begin $display("SRA  2		success!\n"); points =points + 1; end else $display("SRA  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[26]==32'h9eeb93e4) begin $display("XOR  2		success!\n"); points =points + 1; end else $display("XOR  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[27]==32'ha7d6d545) begin $display("MULT 2		success!\n"); points =points + 1; end else $display("MULT 2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[28]==32'h00000009) begin $display("DIV  2		success!\n"); points =points + 1; end else $display("DIV  2		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[29]==32'hd18fa000) begin $display("ANDI 3		success!\n"); points =points + 1; end else $display("ANDI 3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[30]==32'h010eac20) begin $display("NOR  3		success!\n"); points =points + 1; end else $display("NOR  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[31]==32'h00000000) begin $display("SLT  3		success!\n"); points =points + 1; end else $display("SLT  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[32]==32'h87360000) begin $display("SLL  3		success!\n"); points =points + 1; end else $display("SLL  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[33]==32'h00000bcd) begin $display("SRL  3		success!\n"); points =points + 1; end else $display("SRL  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[34]==32'hde688923) begin $display("SRA  3		success!\n"); points =points + 1; end else $display("SRA  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[35]==32'hd6e051dc) begin $display("XOR  3		success!\n"); points =points + 1; end else $display("XOR  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[36]==32'heff5a5fd) begin $display("MULT 3		success!\n"); points =points + 1; end else $display("MULT 3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[37]==32'h00000001) begin $display("DIV  3		success!\n"); points =points + 1; end else $display("DIV  3		failed!\n");
           
          if(uut.datapath_unit.data_mem.ram[38]==32'hbcd11002) begin $display("ANDI 4		success!\n"); points =points + 1; end else $display("ANDI 4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[39]==32'h420a0088) begin $display("NOR  4		success!\n"); points =points + 1; end else $display("NOR  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[40]==32'h00000000) begin $display("SLT  4		success!\n"); points =points + 1; end else $display("SLT  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[41]==32'h9a7eba80) begin $display("SLL  4		success!\n"); points =points + 1; end else $display("SLL  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[42]==32'h16ab7b06) begin $display("SRL  4		success!\n"); points =points + 1; end else $display("SRL  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[43]==32'hfdaadec1) begin $display("SRA  4		success!\n"); points =points + 1; end else $display("SRA  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[44]==32'h2de5ef32) begin $display("XOR  4		success!\n"); points =points + 1; end else $display("XOR  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[45]==32'hd8098573) begin $display("MULT 4		success!\n"); points =points + 1; end else $display("MULT 4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[46]==32'h00000001) begin $display("DIV  4		success!\n"); points =points + 1; end else $display("DIV  4		failed!\n");
           
          if(uut.datapath_unit.data_mem.ram[47]==32'h00000000) begin $display("ANDI 5		success!\n"); points =points + 1; end else $display("ANDI 5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[48]==32'h2e7059ff) begin $display("NOR  5		success!\n"); points =points + 1; end else $display("NOR  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[49]==32'h00000001) begin $display("SLT  5		success!\n"); points =points + 1; end else $display("SLT  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[50]==32'h80000000) begin $display("SLL  5		success!\n"); points =points + 1; end else $display("SLL  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[51]==32'h00000001) begin $display("SRL  5		success!\n"); points =points + 1; end else $display("SRL  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[52]==32'hffffffff) begin $display("SRA  5		success!\n"); points =points + 1; end else $display("SRA  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[53]==32'h64d47e31) begin $display("XOR  5		success!\n"); points =points + 1; end else $display("XOR  5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[54]==32'h528ec600) begin $display("MULT 5		success!\n"); points =points + 1; end else $display("MULT 5		failed!\n");
          if(uut.datapath_unit.data_mem.ram[55]==32'h00000000) begin $display("DIV  5		success!\n"); points =points + 1; end else $display("DIV  5		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[56]==32'hd18fa600) begin $display("BEQ  1		success!\n"); points =points + 2.5; end else $display("BEQ  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[57]==32'h56344002) begin $display("BEQ  2		success!\n"); points =points + 2.5; end else $display("BEQ  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[58]==32'h00000004) begin $display("BEQ  3		success!\n"); points =points + 2.5; end else $display("BEQ  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[59]==32'h0000000d) begin $display("BEQ  4		success!\n"); points =points + 2.5; end else $display("BEQ  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[60]==32'h00000003) begin $display("BEQ  5		success!\n"); points =points + 2.5; end else $display("BEQ  5		failed!\n");
          
          if(uut.datapath_unit.data_mem.ram[61]==32'hd18fa600) begin $display("j  1		success!\n"); points =points + 2.5; end else $display("j  1		failed!\n");
          if(uut.datapath_unit.data_mem.ram[62]==32'hb55bd831) begin $display("j  2		success!\n"); points =points + 2.5; end else $display("j  2		failed!\n");
          if(uut.datapath_unit.data_mem.ram[63]==32'hbcd11247) begin $display("j  3		success!\n"); points =points + 2.5; end else $display("j  3		failed!\n");
          if(uut.datapath_unit.data_mem.ram[64]==32'h9134fd75) begin $display("j  4		success!\n"); points =points + 2.5; end else $display("j  4		failed!\n");
          if(uut.datapath_unit.data_mem.ram[65]==32'h90000000) begin $display("j  5		success!\n"); points =points + 2.5; end else $display("j  5		failed!\n");
          
          */
          
         $display("points : ", points);
           
      end  
endmodule