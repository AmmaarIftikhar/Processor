`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 13:00:09
// Design Name: 
// Module Name: controller2
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


module controller2( input logic clk,
                    input logic [15:0] swt,
                    input logic  button1, button2, button3, button4, button5,
                    output logic [15:0] led,
                    output logic [6:0] seg,
                    output logic  dp,
                    output logic [3:0] an);
       logic [15:0] inst, inst2;
       logic [4:0] index;
       logic [4:0] pc_cntr;
       logic [7:0] writeValueDM, writeValueR, readValue2, readDataR2, readDataDM2, readDataR1, readRF1, r1, r2;
       logic weR, weD;
       logic b1, b2, b3, b4, b5, isEqual;
       localparam ele = 32;
       logic [3:0] writeAddressDM, readAddressDM, writeAddressR, readAddressR1, readAddressR2;
       
       // works
       instruction_memory in( pc_cntr, inst2);
       register_file data( clk, writeAddressDM, writeValueDM, weD, readAddressDM, index, readDataDM2, readValue2);
       register_file register( clk, writeAddressR, writeValueR, weR, readAddressR1, readAddressR2, readDataR1, readDataR2);
       
       // deboucning the buttons
       debounce db1( clk, button1, b1);
       debounce db2( clk, button2, b2);
       debounce db3( clk, button3, b3);
       debounce db4( clk, button4, b4);
       debounce db5( clk, button5, b5);
       
       // display on the seven segment 
       SevSeg_4digit( clk, index, 4'b0, readValue2[7:4], readValue2[3:0], seg, dp, an);
       always @( posedge clk)
            if( swt == 16'b0)   inst = inst2;
            else                inst = swt;
       
       always_comb
            begin
                readAddressR1 = inst[7:4];
                readAddressR2 = inst[3:0];
                readAddressDM = inst[3:0];
            end
       
      always @( posedge clk)
        begin
            if( {inst[15:12]} == 4'b0000 && b4)  
                begin
                  weD = 1;
                  weR = 0;
                  writeAddressDM = inst[7:4];
                  writeValueDM = readDataR2;   
                end
            else if( {inst[15:12]} == 4'b0001 && b4)
                begin
                    weD = 1;
                    weR = 0;
                    writeAddressDM = inst[11:8];
                    writeValueDM = inst[7:0]; 
                end
            else if( {inst[15:12]} == 4'b0010 && b4)
                begin
                    weD = 0;
                    weR = 1;
                    writeAddressR = inst[7:4];
                    writeValueR = readDataDM2; 
                end
             else if( {inst[15:12]} == 4'b0011 && b4)
                 begin
                     weD = 0;
                     weR = 1;
                     writeAddressR = inst[11:8];
                     writeValueR = inst[7:0]; 
                 end
             else if( {inst[15:12]} === 4'b010x && b4)
                begin
                    writeAddressR = inst[11:8];
                    writeValueR = readDataR1 + readDataR2;
                    weR = 1;
                    weD = 0;
                end
             else if( {inst[15:12]} === 4'b100x && b4)
                if( readDataR1 == readDataR2)   
                    isEqual = 1;
        end
            
      always @( posedge clk)
         begin
            
            if( b5)
                index = 0;
            else if( b1 && index == 15)
                index = 0;
            else if( b1) 
                index = index + 1;
            else if( b2 && index == 0)
                index = 15;
            else if ( b2)
                index = index - 1;                            
          end
      
      always @( posedge clk) 
        begin
          led = inst;
        end
        
     always @( posedge clk)
        begin
            if( b5)
                pc_cntr = 0;
            else if( b3 && pc_cntr == (ele - 1)) 
                begin
                    pc_cntr = 0;
                end
            else if( b3)
                begin
                    pc_cntr = pc_cntr + 1;
                end
            else if( isEqual && {inst[15:13]} == 3'b101)
                begin
                    pc_cntr = inst[12:8];
                end
        end         
endmodule


