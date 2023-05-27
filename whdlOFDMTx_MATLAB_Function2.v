// -------------------------------------------------------------
// 
// File Name: D:\NU\OF\WHDLOFDMTransmitterExample_all_new\hdl_prj\hdlsrc3\whdlOFDMTransmitter_up_con\whdlOFDMTx\whdlOFDMTx_MATLAB_Function2.v
// Created: 2023-05-02 12:36:36
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: whdlOFDMTx_MATLAB_Function2
// Source Path: whdlOFDMTx/Frame Controller and Input Sampler/Frame Controller/Generate OFDM Modulator Ready/Control 
// OFDM Signal Generation/MATLAB Function
// Hierarchy Level: 6
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module whdlOFDMTx_MATLAB_Function2
          (clk,
           reset,
           enb_1_2_0,
           trigger,
           out);


  input   clk;
  input   reset;
  input   enb_1_2_0;
  input   trigger;
  output  out;


  reg  out_1;
  reg [13:0] count;  // ufix14
  reg  state;
  reg [13:0] count_next;  // ufix14
  reg  state_next;
  reg [13:0] count_temp;  // ufix14
  reg  state_temp;


  always @(posedge clk or posedge reset)
    begin : MATLAB_Function2_process
      if (reset == 1'b1) begin
        count <= 14'b00000000000000;
        state <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          count <= count_next;
          state <= state_next;
        end
      end
    end

  always @(count, state, trigger) begin
    count_temp = count;
    state_temp = state;
    // %% Executes in next clock cycle
    if (count == 14'b10010101011010) begin
      state_temp = 1'b0;
    end
    out_1 = state_temp;
    // %% Executes in current clock cycle
    if (trigger) begin
      state_temp = 1'b1;
      count_temp = 14'b00000000000000;
    end
    if (state_temp && ( ! trigger)) begin
      count_temp = count_temp + 14'b00000000000001;
    end
    count_next = count_temp;
    state_next = state_temp;
  end



  assign out = out_1;

endmodule  // whdlOFDMTx_MATLAB_Function2

