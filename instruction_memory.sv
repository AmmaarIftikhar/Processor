`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2020 10:29:38
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input logic [4:0] address,
    output logic [15:0] inst);
    
    logic [15:0] mem[31:0];
    
    // assign values to the array
    assign mem[0] = 16'b001_1_1000_1000_0000;
    assign mem[1] = 16'b000_1_0000_0001_0001;
    assign mem[2] = 16'b000_1_0010_0000_1000;
    assign mem[3] = 16'b000_1_0011_0000_0100;
    assign mem[4] = 16'b000_1_0100_0000_0001;
    assign mem[5] = 16'b001_1_1001_0010_0001;
    assign mem[6] = 16'b001_1_0011_0011_0000;
    assign mem[7] = 16'b000_0_0111_1001_0011;
    assign mem[8] = 16'b000_0_1111_0000_0011;    // check upto here
    assign mem[9] = 16'b000_0_0000_0011_0011;
    assign mem[10] = 16'b001_0_0000_0000_0000;
    assign mem[11] = 16'b000_0_1111_0011_0011;
    assign mem[12] = 16'b001_1_0010_00000000;
    assign mem[13] = 16'b001_1_0111_00000000;
    assign mem[14] = 16'b001_1_1100_00000001;
    assign mem[15] = 16'b101_0_1101_0010_0001;
    assign mem[16] = 16'b010_0_1011_0011_0000;
    assign mem[17] = 16'b010_0_1110_0010_0100;
    assign mem[18] = 16'b101_0_1111_0000_0000;
    assign mem[19] = 16'b000_0_1111_0011_0011;
    assign mem[20] = 16'b001_0_0000_0001_0001;
    assign mem[21] = 16'b001_1_0010_00000000;
    assign mem[22] = 16'b001_1_0011_00000000;
    assign mem[23] = 16'b001_1_0100_00000001;
    assign mem[24] = 16'b010_0_1011_0011_0000;
    assign mem[25] = 16'b010_0_1110_0010_0100;
    assign mem[26] = 16'b101_0_1111_0000_0000;
    assign mem[27] = 16'b000_0_1111_0011_0011;
    assign mem[28] = 16'b001_0_0000_0001_0001;
    assign mem[29] = 16'b011_1_0010_00000000;
    assign mem[30] = 16'b010_1_0011_00000000;
    assign mem[31] = 16'b111_1_0100_00000001;
    
    // return value to inst
    assign inst = mem[address];   
endmodule
