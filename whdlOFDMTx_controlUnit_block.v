// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_controlUnit_block.v
// Created: 2023-05-02 12:36:37
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_controlUnit_block
// Source Path: whdlOFDMTx/Frame Generator/Header/Convolutional Encoder/controlUnit
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_controlUnit_block
          (clk,
           reset,
           enb_1_2_0,
           startIn,
           endIn,
           validIn,
           rstSig,
           endSig,
           enbSig,
           tailFlag);


  input   clk;
  input   reset;
  input   enb_1_2_0;
  input   startIn;  // ufix1
  input   endIn;  // ufix1
  input   validIn;  // ufix1
  output  rstSig;  // ufix1
  output  endSig;  // ufix1
  output  enbSig;  // ufix1
  output  tailFlag;  // ufix1


  wire startinFlag;  // ufix1
  reg  rstSig_2;  // ufix1
  wire negstart;  // ufix1
  reg  enbFrameEndOp;  // ufix1
  wire tmp1;  // ufix1
  wire negtailend;  // ufix1
  wire enbFramEndOpsel0;  // ufix1
  reg [2:0] cntReg;  // ufix3
  wire tailend;  // ufix1
  wire enbFramEndOpsel1;  // ufix1
  wire enbFramEndOptmp;  // ufix1
  wire negstartinflag;  // ufix1
  wire frameGapValid;  // ufix1
  wire endSigtmp;  // ufix1
  reg  endSig_2;  // ufix1
  wire tmp;  // ufix1
  wire negendSigtmp;  // ufix1
  wire enbStart;  // ufix1
  wire enbStarttmp;  // ufix1
  reg  enbStartReg_1;  // ufix1
  wire startProcess;  // ufix1
  reg  enbSig_1;  // ufix1
  reg  tailFlag_2;  // ufix1


  assign startinFlag = startIn & validIn;



  // reset signal of frame
  always @(posedge clk or posedge reset)
    begin : rstSig_1_process
      if (reset == 1'b1) begin
        rstSig_2 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          rstSig_2 <= startinFlag;
        end
      end
    end



  assign negstart =  ~ startIn;



  assign tmp1 = enbFrameEndOp | endIn;



  assign enbFramEndOpsel0 = tmp1 & (negstart & negtailend);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 5
  // counts upto tail length
  always @(posedge clk or posedge reset)
    begin : counter_process
      if (reset == 1'b1) begin
        cntReg <= 3'b000;
      end
      else begin
        if (enb_1_2_0) begin
          if (startinFlag == 1'b1) begin
            cntReg <= 3'b000;
          end
          else if (enbFrameEndOp == 1'b1) begin
            if (cntReg >= 3'b101) begin
              cntReg <= 3'b000;
            end
            else begin
              cntReg <= cntReg + 3'b001;
            end
          end
        end
      end
    end



  assign tailend = cntReg == 3'b101;



  assign negtailend =  ~ tailend;



  assign enbFramEndOpsel1 = enbFrameEndOp & negtailend;



  assign enbFramEndOptmp = (validIn == 1'b0 ? enbFramEndOpsel1 :
              enbFramEndOpsel0);



  // frameEndComp flag for frame endout operations
  always @(posedge clk or posedge reset)
    begin : enbFrameEndOp_1_process
      if (reset == 1'b1) begin
        enbFrameEndOp <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          enbFrameEndOp <= enbFramEndOptmp;
        end
      end
    end



  assign negstartinflag =  ~ startinFlag;



  assign frameGapValid = enbFrameEndOp & negstartinflag;



  assign endSigtmp = frameGapValid & tailend;



  // end out signal of frame
  always @(posedge clk or posedge reset)
    begin : endSig_1_process
      if (reset == 1'b1) begin
        endSig_2 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          endSig_2 <= endSigtmp;
        end
      end
    end



  assign tmp = enbFrameEndOp | validIn;



  assign negendSigtmp =  ~ endSigtmp;



  assign enbStarttmp = negendSigtmp & enbStart;



  // internal flag for enabling the frame controls
  always @(posedge clk or posedge reset)
    begin : enbStartReg_process
      if (reset == 1'b1) begin
        enbStartReg_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          enbStartReg_1 <= enbStarttmp;
        end
      end
    end



  assign enbStart = startinFlag | enbStartReg_1;



  assign startProcess = tmp & enbStart;



  // enable signal to process the frame data
  always @(posedge clk or posedge reset)
    begin : startProcess_1_process
      if (reset == 1'b1) begin
        enbSig_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          enbSig_1 <= startProcess;
        end
      end
    end



  // flag to enable the appending of tail bits
  always @(posedge clk or posedge reset)
    begin : tailflag_1_process
      if (reset == 1'b1) begin
        tailFlag_2 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          tailFlag_2 <= frameGapValid;
        end
      end
    end



  assign rstSig = rstSig_2;

  assign endSig = endSig_2;

  assign enbSig = enbSig_1;

  assign tailFlag = tailFlag_2;

endmodule  // whdlOFDMTx_controlUnit_block

