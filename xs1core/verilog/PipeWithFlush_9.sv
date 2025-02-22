// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

module PipeWithFlush_9(
  input         clock,
  input         reset,
  input         io_flush_redirect_valid,
  input         io_flush_redirect_bits_robIdx_flag,
  input  [7:0]  io_flush_redirect_bits_robIdx_value,
  input         io_flush_redirect_bits_level,
  input         io_flush_ldCancel_0_ld2Cancel,
  input         io_flush_ldCancel_1_ld2Cancel,
  input         io_flush_ldCancel_2_ld2Cancel,
  input         io_flush_og0Fail,
  input         io_flush_og1Fail,
  input         io_enq_valid,
  input  [34:0] io_enq_bits_fuType,
  input         io_enq_bits_robIdx_flag,
  input  [7:0]  io_enq_bits_robIdx_value,
  input  [7:0]  io_enq_bits_pdest,
  input         io_enq_bits_rfWen,
  input         io_enq_bits_fpWen,
  input         io_enq_bits_vecWen,
  input         io_enq_bits_v0Wen,
  input  [1:0]  io_enq_bits_loadDependency_0,
  input  [1:0]  io_enq_bits_loadDependency_1,
  input  [1:0]  io_enq_bits_loadDependency_2,
  output        io_deq_valid,
  output [34:0] io_deq_bits_fuType,
  output        io_deq_bits_robIdx_flag,
  output [7:0]  io_deq_bits_robIdx_value,
  output [7:0]  io_deq_bits_pdest,
  output        io_deq_bits_rfWen,
  output        io_deq_bits_fpWen,
  output        io_deq_bits_vecWen,
  output        io_deq_bits_v0Wen,
  output [1:0]  io_deq_bits_loadDependency_0,
  output [1:0]  io_deq_bits_loadDependency_1,
  output [1:0]  io_deq_bits_loadDependency_2
);

  reg         valids_1;
  reg         valids_2;
  reg         valids_3;
  reg  [34:0] bits_1_fuType;
  reg         bits_1_robIdx_flag;
  reg  [7:0]  bits_1_robIdx_value;
  reg  [7:0]  bits_1_pdest;
  reg         bits_1_rfWen;
  reg         bits_1_fpWen;
  reg         bits_1_vecWen;
  reg         bits_1_v0Wen;
  reg  [1:0]  bits_1_loadDependency_0;
  reg  [1:0]  bits_1_loadDependency_1;
  reg  [1:0]  bits_1_loadDependency_2;
  reg  [34:0] bits_2_fuType;
  reg         bits_2_robIdx_flag;
  reg  [7:0]  bits_2_robIdx_value;
  reg  [7:0]  bits_2_pdest;
  reg         bits_2_rfWen;
  reg         bits_2_fpWen;
  reg         bits_2_vecWen;
  reg         bits_2_v0Wen;
  reg  [1:0]  bits_2_loadDependency_0;
  reg  [1:0]  bits_2_loadDependency_1;
  reg  [1:0]  bits_2_loadDependency_2;
  reg  [34:0] bits_3_fuType;
  reg         bits_3_robIdx_flag;
  reg  [7:0]  bits_3_robIdx_value;
  reg  [7:0]  bits_3_pdest;
  reg         bits_3_rfWen;
  reg         bits_3_fpWen;
  reg         bits_3_vecWen;
  reg         bits_3_v0Wen;
  reg  [1:0]  bits_3_loadDependency_0;
  reg  [1:0]  bits_3_loadDependency_1;
  reg  [1:0]  bits_3_loadDependency_2;
  wire [8:0]  _valids_3_redirectFlush_flushItself_T_2 =
    {io_flush_redirect_bits_robIdx_flag, io_flush_redirect_bits_robIdx_value};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      valids_1 <= 1'h0;
      valids_2 <= 1'h0;
      valids_3 <= 1'h0;
    end
    else begin
      valids_1 <= io_enq_valid;
      valids_2 <=
        valids_1
        & ~(io_flush_redirect_valid
            & (io_flush_redirect_bits_level
               & {bits_1_robIdx_flag,
                  bits_1_robIdx_value} == _valids_3_redirectFlush_flushItself_T_2
               | bits_1_robIdx_flag ^ io_flush_redirect_bits_robIdx_flag
               ^ bits_1_robIdx_value > io_flush_redirect_bits_robIdx_value)
            | io_flush_ldCancel_0_ld2Cancel & bits_1_loadDependency_0[1]
            | io_flush_ldCancel_1_ld2Cancel & bits_1_loadDependency_1[1]
            | io_flush_ldCancel_2_ld2Cancel & bits_1_loadDependency_2[1]
            | io_flush_og0Fail);
      valids_3 <=
        valids_2
        & ~(io_flush_redirect_valid
            & (io_flush_redirect_bits_level
               & {bits_2_robIdx_flag,
                  bits_2_robIdx_value} == _valids_3_redirectFlush_flushItself_T_2
               | bits_2_robIdx_flag ^ io_flush_redirect_bits_robIdx_flag
               ^ bits_2_robIdx_value > io_flush_redirect_bits_robIdx_value)
            | io_flush_ldCancel_0_ld2Cancel & bits_2_loadDependency_0[1]
            | io_flush_ldCancel_1_ld2Cancel & bits_2_loadDependency_1[1]
            | io_flush_ldCancel_2_ld2Cancel & bits_2_loadDependency_2[1]
            | io_flush_og1Fail);
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_enq_valid) begin
      bits_1_fuType <= io_enq_bits_fuType;
      bits_1_robIdx_flag <= io_enq_bits_robIdx_flag;
      bits_1_robIdx_value <= io_enq_bits_robIdx_value;
      bits_1_pdest <= io_enq_bits_pdest;
      bits_1_rfWen <= io_enq_bits_rfWen;
      bits_1_fpWen <= io_enq_bits_fpWen;
      bits_1_vecWen <= io_enq_bits_vecWen;
      bits_1_v0Wen <= io_enq_bits_v0Wen;
      bits_1_loadDependency_0 <= io_enq_bits_loadDependency_0;
      bits_1_loadDependency_1 <= io_enq_bits_loadDependency_1;
      bits_1_loadDependency_2 <= io_enq_bits_loadDependency_2;
    end
    if (valids_1) begin
      bits_2_fuType <= bits_1_fuType;
      bits_2_robIdx_flag <= bits_1_robIdx_flag;
      bits_2_robIdx_value <= bits_1_robIdx_value;
      bits_2_pdest <= bits_1_pdest;
      bits_2_rfWen <= bits_1_rfWen;
      bits_2_fpWen <= bits_1_fpWen;
      bits_2_vecWen <= bits_1_vecWen;
      bits_2_v0Wen <= bits_1_v0Wen;
      bits_2_loadDependency_0 <= {bits_1_loadDependency_0[0], 1'h0};
      bits_2_loadDependency_1 <= {bits_1_loadDependency_1[0], 1'h0};
      bits_2_loadDependency_2 <= {bits_1_loadDependency_2[0], 1'h0};
    end
    if (valids_2) begin
      bits_3_fuType <= bits_2_fuType;
      bits_3_robIdx_flag <= bits_2_robIdx_flag;
      bits_3_robIdx_value <= bits_2_robIdx_value;
      bits_3_pdest <= bits_2_pdest;
      bits_3_rfWen <= bits_2_rfWen;
      bits_3_fpWen <= bits_2_fpWen;
      bits_3_vecWen <= bits_2_vecWen;
      bits_3_v0Wen <= bits_2_v0Wen;
      bits_3_loadDependency_0 <= {bits_2_loadDependency_0[0], 1'h0};
      bits_3_loadDependency_1 <= {bits_2_loadDependency_1[0], 1'h0};
      bits_3_loadDependency_2 <= {bits_2_loadDependency_2[0], 1'h0};
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:94];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [6:0] i = 7'h0; i < 7'h5F; i += 7'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        valids_1 = _RANDOM[7'h0][0];
        valids_2 = _RANDOM[7'h0][1];
        valids_3 = _RANDOM[7'h0][2];
        bits_1_fuType = {_RANDOM[7'h0][31:3], _RANDOM[7'h1][5:0]};
        bits_1_robIdx_flag = _RANDOM[7'h8][15];
        bits_1_robIdx_value = _RANDOM[7'h8][23:16];
        bits_1_pdest = {_RANDOM[7'h8][31:29], _RANDOM[7'h9][4:0]};
        bits_1_rfWen = _RANDOM[7'h9][5];
        bits_1_fpWen = _RANDOM[7'h9][6];
        bits_1_vecWen = _RANDOM[7'h9][7];
        bits_1_v0Wen = _RANDOM[7'h9][8];
        bits_1_loadDependency_0 = _RANDOM[7'h13][8:7];
        bits_1_loadDependency_1 = _RANDOM[7'h13][10:9];
        bits_1_loadDependency_2 = _RANDOM[7'h13][12:11];
        bits_2_fuType = {_RANDOM[7'h25][31:14], _RANDOM[7'h26][16:0]};
        bits_2_robIdx_flag = _RANDOM[7'h2D][26];
        bits_2_robIdx_value = {_RANDOM[7'h2D][31:27], _RANDOM[7'h2E][2:0]};
        bits_2_pdest = _RANDOM[7'h2E][15:8];
        bits_2_rfWen = _RANDOM[7'h2E][16];
        bits_2_fpWen = _RANDOM[7'h2E][17];
        bits_2_vecWen = _RANDOM[7'h2E][18];
        bits_2_v0Wen = _RANDOM[7'h2E][19];
        bits_2_loadDependency_0 = _RANDOM[7'h38][19:18];
        bits_2_loadDependency_1 = _RANDOM[7'h38][21:20];
        bits_2_loadDependency_2 = _RANDOM[7'h38][23:22];
        bits_3_fuType = {_RANDOM[7'h4A][31:25], _RANDOM[7'h4B][27:0]};
        bits_3_robIdx_flag = _RANDOM[7'h53][5];
        bits_3_robIdx_value = _RANDOM[7'h53][13:6];
        bits_3_pdest = _RANDOM[7'h53][26:19];
        bits_3_rfWen = _RANDOM[7'h53][27];
        bits_3_fpWen = _RANDOM[7'h53][28];
        bits_3_vecWen = _RANDOM[7'h53][29];
        bits_3_v0Wen = _RANDOM[7'h53][30];
        bits_3_loadDependency_0 = _RANDOM[7'h5D][30:29];
        bits_3_loadDependency_1 = {_RANDOM[7'h5D][31], _RANDOM[7'h5E][0]};
        bits_3_loadDependency_2 = _RANDOM[7'h5E][2:1];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        valids_1 = 1'h0;
        valids_2 = 1'h0;
        valids_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_deq_valid = valids_3;
  assign io_deq_bits_fuType = bits_3_fuType;
  assign io_deq_bits_robIdx_flag = bits_3_robIdx_flag;
  assign io_deq_bits_robIdx_value = bits_3_robIdx_value;
  assign io_deq_bits_pdest = bits_3_pdest;
  assign io_deq_bits_rfWen = bits_3_rfWen;
  assign io_deq_bits_fpWen = bits_3_fpWen;
  assign io_deq_bits_vecWen = bits_3_vecWen;
  assign io_deq_bits_v0Wen = bits_3_v0Wen;
  assign io_deq_bits_loadDependency_0 = bits_3_loadDependency_0;
  assign io_deq_bits_loadDependency_1 = bits_3_loadDependency_1;
  assign io_deq_bits_loadDependency_2 = bits_3_loadDependency_2;
endmodule

