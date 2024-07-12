`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 11:20:19 AM
// Design Name: 
// Module Name: HA_tb
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


module HA_tb();
    
    // Define the input and output ports
    reg A_tb = 0; 
    reg B_tb = 0;
    wire Sum_tb ;
    wire Cout_tb ;
    // Port Mapping
    HA instant
    (
    .A( A_tb ),
    .B( B_tb ),
    .Sum ( Sum_tb ),
    .Cout ( Cout_tb )
    );

    // Test samples
    initial // initial block executes only once
     begin
        A_tb = 1'b0 ;
        B_tb = 1'b0 ;
        #10; // wait for 10 time - units (10 ns in this example )
        A_tb = 1'b0 ;
        B_tb = 1'b1 ;
        # 10; // wait for 10 time - units (10 ns in this example )
        A_tb = 1'b1;
        B_tb = 1'b0;
        #10;
        A_tb = 1'b1;
        B_tb = 1'b1;
        #10;
         
     end

endmodule
