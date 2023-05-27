// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Pilot.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Pilot
// Source Path: whdlOFDMTx/Frame Generator/Pilot
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Pilot
          (clk,
           reset,
           enb,
           enb_1_2_0,
           pilot_set,
           pilot,
           pilotValid);


  input   clk;
  input   reset;
  input   enb;
  input   enb_1_2_0;
  input   pilot_set;
  output  signed [15:0] pilot;  // sfix16_En14
  output  pilotValid;


  reg  Upsample_muxsel;  // ufix1
  wire [3:0] count_step;  // ufix4
  wire [3:0] count_from;  // ufix4
  reg [3:0] Pilot_Counter_out1;  // ufix4
  wire [3:0] count;  // ufix4
  wire need_to_wrap;
  wire [3:0] count_value;  // ufix4
  wire [3:0] count_1;  // ufix4
  wire [3:0] Pilot_LUT_k;  // ufix4
  wire signed [15:0] Pilot_LUT_table_data [0:11];  // sfix16_En14 [12]
  wire signed [15:0] Pilot_LUT_out1;  // sfix16_En14
  reg signed [15:0] Delay_out1;  // sfix16_En14
  wire signed [15:0] Upsample_zero;  // sfix16_En14
  wire signed [15:0] Upsample_out1;  // sfix16_En14
  reg  Upsample1_muxsel;  // ufix1
  reg  Delay2_out1;
  wire Upsample1_zero;
  wire Upsample1_out1;

  // Access pilot signals from LUT.
  // Upsampling is done to compensate the rate change due to Convolutional Encoder 
  // in Header and Data subsystems.


  // Free running, Unsigned Counter
  //  initial value   = 1
  //  step value      = 1
  // Upsample: Upsample by 2, Sample offset 0 
  always @(posedge clk or posedge reset)
    begin : Upsample_cnt_process
      if (reset == 1'b1) begin
        Upsample_muxsel <= 1'b1;
      end
      else begin
        if (enb) begin
          Upsample_muxsel <=  ~ Upsample_muxsel;
        end
      end
    end



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 11
  assign count_step = 4'b0001;



  assign count_from = 4'b0000;



  assign count = Pilot_Counter_out1 + count_step;



  assign need_to_wrap = Pilot_Counter_out1 == 4'b1011;



  assign count_value = (need_to_wrap == 1'b0 ? count :
              count_from);



  assign count_1 = (pilot_set == 1'b0 ? Pilot_Counter_out1 :
              count_value);



  always @(posedge clk or posedge reset)
    begin : Pilot_Counter_process
      if (reset == 1'b1) begin
        Pilot_Counter_out1 <= 4'b0000;
      end
      else begin
        if (enb_1_2_0) begin
          Pilot_Counter_out1 <= count_1;
        end
      end
    end



  assign Pilot_LUT_table_data[0] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[1] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[2] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[3] = 16'sb1100000000000000;
  assign Pilot_LUT_table_data[4] = 16'sb1100000000000000;
  assign Pilot_LUT_table_data[5] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[6] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[7] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[8] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[9] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[10] = 16'sb0100000000000000;
  assign Pilot_LUT_table_data[11] = 16'sb1100000000000000;
  assign Pilot_LUT_k = (Pilot_Counter_out1 == 4'b0000 ? 4'b0000 :
              (Pilot_Counter_out1 >= 4'b1011 ? 4'b1011 :
              Pilot_Counter_out1));
  assign Pilot_LUT_out1 = Pilot_LUT_table_data[Pilot_LUT_k];



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          Delay_out1 <= Pilot_LUT_out1;
        end
      end
    end



  assign Upsample_zero = 16'sb0000000000000000;



  assign Upsample_out1 = (Upsample_muxsel == 1'b1 ? Delay_out1 :
              Upsample_zero);



  assign pilot = Upsample_out1;

  // Free running, Unsigned Counter
  //  initial value   = 1
  //  step value      = 1
  // Upsample1: Upsample by 2, Sample offset 0 
  always @(posedge clk or posedge reset)
    begin : Upsample1_cnt_process
      if (reset == 1'b1) begin
        Upsample1_muxsel <= 1'b1;
      end
      else begin
        if (enb) begin
          Upsample1_muxsel <=  ~ Upsample1_muxsel;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Delay2_out1 <= pilot_set;
        end
      end
    end



  assign Upsample1_zero = 1'b0;



  assign Upsample1_out1 = (Upsample1_muxsel == 1'b1 ? Delay2_out1 :
              Upsample1_zero);



  assign pilotValid = Upsample1_out1;

endmodule  // whdlOFDMTx_Pilot

