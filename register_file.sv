`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 15:36:25
// Design Name: 
// Module Name: register_file
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


module register_file( input logic clk,
            input logic [3:0] writeAddress,
            input logic [7:0] writeData,
            input logic writeEnable,
            input logic [3:0] readAddress1,
            input logic [3:0] readAddress2,
            output logic [7:0] readData1,
            output logic [7:0] readData2);
    
    logic [7:0] mem[15:0];
    localparam up = 16;
    always @(posedge clk)
        if(writeEnable)  mem[writeAddress] <= writeData;
    
    initial
        begin
            for( int i = 0; i < up; i++)
                mem[i] = 8'b00000000;
        end
        
    assign readData1 = mem[readAddress1];
    assign readData2 = mem[readAddress2];
endmodule
