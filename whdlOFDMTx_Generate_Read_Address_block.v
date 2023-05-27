// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_Generate_Read_Address_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_Generate_Read_Address_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Interleaver/Read Logic/Generate Read Address
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_Generate_Read_Address_block
          (clk,
           reset,
           enb,
           blockLen,
           enable,
           reset_1,
           blockDataCount,
           currentAddr);


  input   clk;
  input   reset;
  input   enb;
  input   [6:0] blockLen;  // ufix7
  input   enable;
  input   reset_1;
  output  [6:0] blockDataCount;  // ufix7
  output  [6:0] currentAddr;  // ufix7


  wire [6:0] count_step;  // ufix7
  wire [6:0] count_from;  // ufix7
  wire [6:0] count_reset;  // ufix7
  reg [6:0] HDL_Counter2_out1;  // ufix7
  wire [6:0] count;  // ufix7
  wire need_to_wrap;
  wire [6:0] count_value;  // ufix7
  wire [6:0] count_1;  // ufix7
  wire [6:0] count_2;  // ufix7
  reg [6:0] Delay12_out1;  // ufix7
  reg [6:0] Delay9_out1;  // ufix7
  reg [6:0] Delay13_out1;  // ufix7
  reg [6:0] Delay14_out1;  // ufix7
  reg [6:0] Delay11_out1;  // ufix7
  wire Relational_Operator1_relop1;
  wire Logical_Operator1_out1;
  reg  Delay16_out1;
  reg  Delay8_out1;
  wire [2:0] Constant4_out1;  // ufix3
  wire Constant_out1;  // ufix1
  wire [7:0] Add_1;  // ufix8
  wire [7:0] Add_2;  // ufix8
  wire [7:0] Add_out1;  // uint8
  reg [7:0] Delay10_out1;  // uint8
  wire [4:0] Constant2_out1;  // ufix5
  reg [2:0] Divide_out1;  // ufix3
  reg [2:0] Delay3_out1;  // ufix3
  wire [1:0] Constant1_out1;  // ufix2
  wire signed [3:0] Add1_sub_temp;  // sfix4
  wire signed [3:0] Add1_1;  // sfix4
  wire signed [3:0] Add1_2;  // sfix4
  wire [2:0] Add1_out1;  // ufix3
  wire [2:0] Switch_out1;  // ufix3
  reg  Delay15_out1;
  reg  Delay7_out1;
  wire [2:0] count_step_1;  // ufix3
  wire [2:0] count_from_1;  // ufix3
  wire [2:0] count_reset_1;  // ufix3
  reg [2:0] rowIndex;  // ufix3
  wire [2:0] count_3;  // ufix3
  wire need_to_wrap_1;
  wire [2:0] count_value_1;  // ufix3
  wire [2:0] count_4;  // ufix3
  wire Relational_Operator_relop1;
  reg  Delay_out1;
  wire Logical_Operator_out1;
  wire [2:0] count_5;  // ufix3
  reg [2:0] Delay1_out1;  // ufix3
  wire [4:0] Constant3_out1;  // ufix5
  wire [7:0] Product_mul_temp;  // ufix8
  wire [6:0] Product_out1;  // ufix7
  reg [6:0] Delay5_out1;  // ufix7
  wire [4:0] count_step_2;  // ufix5
  wire [4:0] count_from_2;  // ufix5
  wire [4:0] count_reset_2;  // ufix5
  reg [4:0] colIndex;  // ufix5
  wire [4:0] count_6;  // ufix5
  wire need_to_wrap_2;
  wire [4:0] count_value_2;  // ufix5
  wire [4:0] count_7;  // ufix5
  wire [4:0] count_8;  // ufix5
  reg [4:0] Delay2_out1;  // ufix5
  reg [4:0] Delay4_out1;  // ufix5
  wire [6:0] Add2_1;  // ufix7
  wire [6:0] Add2_out1;  // ufix7
  reg [6:0] Delay6_out1;  // ufix7
  reg [7:0] Divide_varargout_1;  // ufix8
  reg [8:0] Divide_div_temp;  // ufix9
  reg [8:0] Divide_t_0_0;  // ufix9

  // Compute read address


  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 72
  assign count_step = 7'b0000001;



  assign count_from = 7'b0000000;



  assign count_reset = 7'b0000000;



  assign count = HDL_Counter2_out1 + count_step;



  assign need_to_wrap = HDL_Counter2_out1 == 7'b1001000;



  assign count_value = (need_to_wrap == 1'b0 ? count :
              count_from);



  assign count_1 = (enable == 1'b0 ? HDL_Counter2_out1 :
              count_value);



  assign count_2 = (reset_1 == 1'b0 ? count_1 :
              count_reset);



  always @(posedge clk or posedge reset)
    begin : HDL_Counter2_process
      if (reset == 1'b1) begin
        HDL_Counter2_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          HDL_Counter2_out1 <= count_2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay12_process
      if (reset == 1'b1) begin
        Delay12_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay12_out1 <= HDL_Counter2_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay9_process
      if (reset == 1'b1) begin
        Delay9_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay9_out1 <= Delay12_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay13_process
      if (reset == 1'b1) begin
        Delay13_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay13_out1 <= Delay9_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay14_process
      if (reset == 1'b1) begin
        Delay14_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay14_out1 <= Delay13_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay11_process
      if (reset == 1'b1) begin
        Delay11_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay11_out1 <= Delay14_out1;
        end
      end
    end



  assign blockDataCount = Delay11_out1;

  assign Relational_Operator1_relop1 = blockLen >= HDL_Counter2_out1;



  assign Logical_Operator1_out1 = Relational_Operator1_relop1 & enable;



  always @(posedge clk or posedge reset)
    begin : Delay16_process
      if (reset == 1'b1) begin
        Delay16_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay16_out1 <= Logical_Operator1_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay8_out1 <= Delay16_out1;
        end
      end
    end



  assign Constant4_out1 = 3'b100;



  assign Constant_out1 = 1'b1;



  assign Add_1 = {1'b0, blockLen};
  assign Add_2 = {7'b0, Constant_out1};
  assign Add_out1 = Add_1 + Add_2;



  always @(posedge clk or posedge reset)
    begin : Delay10_process
      if (reset == 1'b1) begin
        Delay10_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay10_out1 <= Add_out1;
        end
      end
    end



  assign Constant2_out1 = 5'b10010;



  always @(Constant2_out1, Delay10_out1) begin
    Divide_div_temp = 9'b000000000;
    Divide_t_0_0 = 9'b000000000;
    if (Constant2_out1 == 5'b00000) begin
      Divide_varargout_1 = 8'b11111111;
    end
    else begin
      Divide_t_0_0 = {1'b0, Delay10_out1};
      Divide_div_temp = Divide_t_0_0 / Constant2_out1;
      if (Divide_div_temp[8] != 1'b0) begin
        Divide_varargout_1 = 8'b11111111;
      end
      else begin
        Divide_varargout_1 = Divide_div_temp[7:0];
      end
    end
    if (Divide_varargout_1[7:3] != 5'b00000) begin
      Divide_out1 = 3'b111;
    end
    else begin
      Divide_out1 = Divide_varargout_1[2:0];
    end
  end



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 3'b000;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= Divide_out1;
        end
      end
    end



  assign Constant1_out1 = 2'b10;



  assign Add1_1 = {1'b0, Delay3_out1};
  assign Add1_2 = {2'b0, Constant1_out1};
  assign Add1_sub_temp = Add1_1 - Add1_2;
  assign Add1_out1 = Add1_sub_temp[2:0];



  assign Switch_out1 = (Delay8_out1 == 1'b0 ? Constant4_out1 :
              Add1_out1);



  always @(posedge clk or posedge reset)
    begin : Delay15_process
      if (reset == 1'b1) begin
        Delay15_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay15_out1 <= reset_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= Delay15_out1;
        end
      end
    end



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 3
  assign count_step_1 = 3'b001;



  assign count_from_1 = 3'b000;



  assign count_reset_1 = 3'b000;



  assign count_3 = rowIndex + count_step_1;



  assign need_to_wrap_1 = rowIndex == 3'b011;



  assign count_value_1 = (need_to_wrap_1 == 1'b0 ? count_3 :
              count_from_1);



  assign count_4 = (Delay8_out1 == 1'b0 ? rowIndex :
              count_value_1);



  assign Relational_Operator_relop1 = Switch_out1 == rowIndex;



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay_out1 <= Relational_Operator_relop1;
        end
      end
    end



  assign Logical_Operator_out1 = Delay_out1 | Delay7_out1;



  assign count_5 = (Logical_Operator_out1 == 1'b0 ? count_4 :
              count_reset_1);



  always @(posedge clk or posedge reset)
    begin : rowCounter_process
      if (reset == 1'b1) begin
        rowIndex <= 3'b000;
      end
      else begin
        if (enb) begin
          rowIndex <= count_5;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 3'b000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= rowIndex;
        end
      end
    end



  assign Constant3_out1 = 5'b10010;



  assign Product_mul_temp = Delay1_out1 * Constant3_out1;
  assign Product_out1 = Product_mul_temp[6:0];



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= Product_out1;
        end
      end
    end



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 17
  assign count_step_2 = 5'b00001;



  assign count_from_2 = 5'b00000;



  assign count_reset_2 = 5'b00000;



  assign count_6 = colIndex + count_step_2;



  assign need_to_wrap_2 = colIndex == 5'b10001;



  assign count_value_2 = (need_to_wrap_2 == 1'b0 ? count_6 :
              count_from_2);



  assign count_7 = (Delay_out1 == 1'b0 ? colIndex :
              count_value_2);



  assign count_8 = (Delay7_out1 == 1'b0 ? count_7 :
              count_reset_2);



  always @(posedge clk or posedge reset)
    begin : colCounter_process
      if (reset == 1'b1) begin
        colIndex <= 5'b00000;
      end
      else begin
        if (enb) begin
          colIndex <= count_8;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 5'b00000;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= colIndex;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 5'b00000;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= Delay2_out1;
        end
      end
    end



  assign Add2_1 = {2'b0, Delay4_out1};
  assign Add2_out1 = Delay5_out1 + Add2_1;



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 7'b0000000;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= Add2_out1;
        end
      end
    end



  assign currentAddr = Delay6_out1;

endmodule  // whdlOFDMTx_Generate_Read_Address_block

