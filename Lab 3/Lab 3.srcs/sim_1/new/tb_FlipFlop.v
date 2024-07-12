`timescale 1ns/1ps

module tb_FlipFlop();
reg clk_tb;
reg reset_tb;
reg [7:0]d_tb;
wire [7:0]q_tb;

FlipFlop instant
(
.clk(clk_tb),
.reset(reset_tb),
.d(d_tb),
.q(q_tb)
);

always #20 clk_tb = ~clk_tb;
initial
    begin
        clk_tb = 1'b0;
        reset_tb = 1'b1;   
             
        #0   d_tb = 8'b00000000;
        #40  d_tb = 8'b00001111;
        #40  d_tb = 8'b00111111;
        
        #20 reset_tb = 1'b0;
        

        #40 d_tb = 8'b00000110;
        #40 d_tb = 8'b11111111;
        #20
        $finish;
    end
endmodule
        