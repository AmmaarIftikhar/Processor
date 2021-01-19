`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 21:10:05
// Design Name: 
// Module Name: alu
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


module alu(
    input logic s1,
    input logic s0,
    input logic [7:0] inp1,
    input logic [7:0] inp2,
    output logic [7:0] out);
    always_comb
        if( s0 == 0) out = inp1;
        else         out = inp1 + inp2;
endmodule
