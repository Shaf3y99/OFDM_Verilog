
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marwan Ahmed Elsayed
// 
// Create Date: 02/05/2023 09:14:00 AM
// Design Name: DUC to DAC Connection
// Module Name: DUC_DAC
// Project Name: OFDM
// Target Devices: Zedboard 
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


module OFDM_Test(
  //input   clk_in,
  input   clk_in,
  input   rst,
  input   clk_enable,
  input   [1:0] modTypeIndex,  // ufix2
  input   [1:0] codeRateIndex,  // ufix2
  input   data,
  input   valid,
  
  output  ce_out_0,
  output  clk_out1,
  output  clk_out2,
  output  ce_out_1,
  output  txValid,
  output  signed [15:0] txData_re_out,
  
//  output  signed [15:0] txData_im,  // sfix16_En13
 // output  Out3,
 // output  signed [15:0] Out4_re_out,  // sfix18_En16
//  output  signed [15:0] Out4_im_out,  // sfix18_En16
  output  ready
  );

  ///////////////////////
  // Wires And Registers
  //////////////////////

  wire signed [17:0] txData_re;
  wire signed [17:0] txData_re1;
  wire signed [17:0] txData_re2;
  wire signed [17:0] txData_im;
  
  wire signed [17:0] Out4_re;
  wire signed [17:0] Out4_im;
  
  wire clk_out_8_192_MHz;
  wire clk_out_4_096_MHz;
  
  wire clk_out_2_048_MHz;

  
  
  
//  assign Out4_im_out = {!Out4_im[17], Out4_im[16:2]};
 // assign Out4_re_out = {!Out4_re[17], Out4_re[16:2]};
 
//assign txData_re2 = txData_re1 << 3'b011;
assign txData_re = txData_re1 & 18'b011111111111111111;

assign txData_re_out = {!txData_re[16], txData_re[15:1]};
assign clk_out1 = clk_out_2_048_MHz;
assign clk_out2 = !clk_out_4_096_MHz;


 // reg [1:0] clk;
  

  ///////////////////////
  // Clock Logic
  //////////////////////

//  always @(posedge clk_out1 or posedge rst) begin
//    if (rst == 1'b1) begin
//      clk <= 0;
//    end
//    else begin
//      clk <= clk+1;
//    end
//  end
    

  ///////////////////////
  // Instantiations
  //////////////////////    
  
  Div_by_two Div_by_two1(.clk(clk_out_8_192_MHz),
                         .out_clk(clk_out_4_096_MHz));
                         
  Div_by_two Div_by_two2(.clk(clk_out_4_096_MHz),
                         .out_clk(clk_out_2_048_MHz));
                         

  

/////////////////////////////////////////////Repeation////////////////////////////////////////////
///////////////////////////////////////////////Algorithm///////////////////////////////////////////

                   
///////////////////////////////////////////////////////////////////////////////////////////////////////// 
                                                  
  OFDM_Transmitter OFDM_Transmitter1(.clk(!clk_out_4_096_MHz),
           .clk_repeat(clk_out_4_096_MHz),
           .reset(rst),  // Positive Edge Resetc
           .clk_enable(clk_enable),
           .modTypeIndex(modTypeIndex),
           .codeRateIndex(codeRateIndex),
           .data(data),
           .valid(valid),
           .ce_out_0(ce_out_0),
           .ce_out_1(ce_out_1),
           .txValid(txValid),
           
           .Repeat_out_re(txData_re1),
           //.txData_re(txData_re1),
           
           .txData_im(txData_im),
           .ready(ready));
        
    ///////////clock wizard//////////////////      
  clk_wiz_0 clk_wiz_inst(
    // Clock out ports
    .clk_out1(clk_out_8_192_MHz), // DAC Clock 
//    // Clock in ports
    .clk_in1(clk_in),
    .reset(rst)

    );
    
endmodule