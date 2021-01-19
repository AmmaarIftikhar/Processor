`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 15:21:38
// Design Name: 
// Module Name: datapath_final
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


module datapath_final(
    input logic clk,
    input logic [3:0] Rf_writeAddress,
    input logic Rf_we,
    input logic [3:0] Rf_readAddress1,
    input logic [3:0] Rf_readAddress2,
    input logic alu_s1,
    input logic alu_s0,
    input logic Rf_s1,
    input logic Rf_s0,
    input logic [7:0] R_data,
    output logic [7:0] W_data,
    output logic isEqual);
    
    logic [7:0] writeData, readData1, readData2, temp1;
    
    register_file regist( clk, Rf_we, Rf_writeAddress, writeData, Rf_readAddress1, Rf_readAddress2, readData1, readData2);
    alu aluN( alu_s1, alu_s0, readData1, readData2, temp1);
    muxN mux( Rf_s0, temp1, R_Data);
    // to be constructed
    //alu a1( alu_s1, alu_s0, )
    
    assign W_data = readData1;
    assign isEqual = (readData1 == readData2);
    
endmodule
