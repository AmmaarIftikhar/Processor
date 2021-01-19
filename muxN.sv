`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 21:24:31
// Design Name: 
// Module Name: muxN
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


module muxN(
    input logic s,
    input logic [7:0] inp1,
    input logic [7:0] inp2,
    output logic [7:0] out
    );
    always_comb 
        if( s) 
            out = inp1;
        else 
            out = inp2;
endmodule
