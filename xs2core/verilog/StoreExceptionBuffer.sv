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

module StoreExceptionBuffer(
  input         clock,
  input         reset,
  input         io_redirect_valid,
  input         io_redirect_bits_robIdx_flag,
  input  [7:0]  io_redirect_bits_robIdx_value,
  input         io_redirect_bits_level,
  input         io_storeAddrIn_0_valid,
  input         io_storeAddrIn_0_bits_uop_exceptionVec_3,
  input         io_storeAddrIn_0_bits_uop_exceptionVec_6,
  input         io_storeAddrIn_0_bits_uop_exceptionVec_7,
  input         io_storeAddrIn_0_bits_uop_exceptionVec_15,
  input         io_storeAddrIn_0_bits_uop_exceptionVec_23,
  input  [6:0]  io_storeAddrIn_0_bits_uop_uopIdx,
  input         io_storeAddrIn_0_bits_uop_robIdx_flag,
  input  [7:0]  io_storeAddrIn_0_bits_uop_robIdx_value,
  input  [40:0] io_storeAddrIn_0_bits_vaddr,
  input  [40:0] io_storeAddrIn_0_bits_gpaddr,
  input         io_storeAddrIn_1_valid,
  input         io_storeAddrIn_1_bits_uop_exceptionVec_3,
  input         io_storeAddrIn_1_bits_uop_exceptionVec_6,
  input         io_storeAddrIn_1_bits_uop_exceptionVec_7,
  input         io_storeAddrIn_1_bits_uop_exceptionVec_15,
  input         io_storeAddrIn_1_bits_uop_exceptionVec_23,
  input  [6:0]  io_storeAddrIn_1_bits_uop_uopIdx,
  input         io_storeAddrIn_1_bits_uop_robIdx_flag,
  input  [7:0]  io_storeAddrIn_1_bits_uop_robIdx_value,
  input  [40:0] io_storeAddrIn_1_bits_vaddr,
  input  [40:0] io_storeAddrIn_1_bits_gpaddr,
  input         io_storeAddrIn_2_valid,
  input         io_storeAddrIn_2_bits_uop_exceptionVec_3,
  input         io_storeAddrIn_2_bits_uop_exceptionVec_6,
  input         io_storeAddrIn_2_bits_uop_exceptionVec_7,
  input         io_storeAddrIn_2_bits_uop_exceptionVec_15,
  input         io_storeAddrIn_2_bits_uop_exceptionVec_23,
  input  [6:0]  io_storeAddrIn_2_bits_uop_uopIdx,
  input         io_storeAddrIn_2_bits_uop_robIdx_flag,
  input  [7:0]  io_storeAddrIn_2_bits_uop_robIdx_value,
  input  [40:0] io_storeAddrIn_2_bits_vaddr,
  input  [40:0] io_storeAddrIn_2_bits_gpaddr,
  input         io_storeAddrIn_3_valid,
  input         io_storeAddrIn_3_bits_uop_exceptionVec_3,
  input         io_storeAddrIn_3_bits_uop_exceptionVec_6,
  input         io_storeAddrIn_3_bits_uop_exceptionVec_7,
  input         io_storeAddrIn_3_bits_uop_exceptionVec_15,
  input         io_storeAddrIn_3_bits_uop_exceptionVec_23,
  input  [6:0]  io_storeAddrIn_3_bits_uop_uopIdx,
  input         io_storeAddrIn_3_bits_uop_robIdx_flag,
  input  [7:0]  io_storeAddrIn_3_bits_uop_robIdx_value,
  input  [40:0] io_storeAddrIn_3_bits_vaddr,
  input  [40:0] io_storeAddrIn_3_bits_gpaddr,
  input         io_storeAddrIn_4_valid,
  input         io_storeAddrIn_4_bits_uop_exceptionVec_6,
  input         io_storeAddrIn_4_bits_uop_exceptionVec_7,
  input         io_storeAddrIn_4_bits_uop_exceptionVec_15,
  input         io_storeAddrIn_4_bits_uop_exceptionVec_23,
  input  [6:0]  io_storeAddrIn_4_bits_uop_uopIdx,
  input         io_storeAddrIn_4_bits_uop_robIdx_flag,
  input  [7:0]  io_storeAddrIn_4_bits_uop_robIdx_value,
  input  [40:0] io_storeAddrIn_4_bits_vaddr,
  input         io_storeAddrIn_5_valid,
  input         io_storeAddrIn_5_bits_uop_exceptionVec_6,
  input         io_storeAddrIn_5_bits_uop_exceptionVec_7,
  input         io_storeAddrIn_5_bits_uop_exceptionVec_15,
  input         io_storeAddrIn_5_bits_uop_exceptionVec_23,
  input  [6:0]  io_storeAddrIn_5_bits_uop_uopIdx,
  input         io_storeAddrIn_5_bits_uop_robIdx_flag,
  input  [7:0]  io_storeAddrIn_5_bits_uop_robIdx_value,
  input  [40:0] io_storeAddrIn_5_bits_vaddr,
  output [40:0] io_exceptionAddr_vaddr,
  output [40:0] io_exceptionAddr_gpaddr
);

  reg         req_valid;
  reg  [6:0]  req_uop_uopIdx;
  reg         req_uop_robIdx_flag;
  reg  [7:0]  req_uop_robIdx_value;
  reg  [40:0] req_vaddr;
  reg  [40:0] req_gpaddr;
  reg         s2_req_0_uop_exceptionVec_3;
  reg         s2_req_0_uop_exceptionVec_6;
  reg         s2_req_0_uop_exceptionVec_7;
  reg         s2_req_0_uop_exceptionVec_15;
  reg         s2_req_0_uop_exceptionVec_23;
  reg  [6:0]  s2_req_0_uop_uopIdx;
  reg         s2_req_0_uop_robIdx_flag;
  reg  [7:0]  s2_req_0_uop_robIdx_value;
  reg  [40:0] s2_req_0_vaddr;
  reg  [40:0] s2_req_0_gpaddr;
  reg         s2_req_1_uop_exceptionVec_3;
  reg         s2_req_1_uop_exceptionVec_6;
  reg         s2_req_1_uop_exceptionVec_7;
  reg         s2_req_1_uop_exceptionVec_15;
  reg         s2_req_1_uop_exceptionVec_23;
  reg  [6:0]  s2_req_1_uop_uopIdx;
  reg         s2_req_1_uop_robIdx_flag;
  reg  [7:0]  s2_req_1_uop_robIdx_value;
  reg  [40:0] s2_req_1_vaddr;
  reg  [40:0] s2_req_1_gpaddr;
  reg         s2_req_2_uop_exceptionVec_3;
  reg         s2_req_2_uop_exceptionVec_6;
  reg         s2_req_2_uop_exceptionVec_7;
  reg         s2_req_2_uop_exceptionVec_15;
  reg         s2_req_2_uop_exceptionVec_23;
  reg  [6:0]  s2_req_2_uop_uopIdx;
  reg         s2_req_2_uop_robIdx_flag;
  reg  [7:0]  s2_req_2_uop_robIdx_value;
  reg  [40:0] s2_req_2_vaddr;
  reg  [40:0] s2_req_2_gpaddr;
  reg         s2_req_3_uop_exceptionVec_3;
  reg         s2_req_3_uop_exceptionVec_6;
  reg         s2_req_3_uop_exceptionVec_7;
  reg         s2_req_3_uop_exceptionVec_15;
  reg         s2_req_3_uop_exceptionVec_23;
  reg  [6:0]  s2_req_3_uop_uopIdx;
  reg         s2_req_3_uop_robIdx_flag;
  reg  [7:0]  s2_req_3_uop_robIdx_value;
  reg  [40:0] s2_req_3_vaddr;
  reg  [40:0] s2_req_3_gpaddr;
  reg         s2_req_4_uop_exceptionVec_6;
  reg         s2_req_4_uop_exceptionVec_7;
  reg         s2_req_4_uop_exceptionVec_15;
  reg         s2_req_4_uop_exceptionVec_23;
  reg  [6:0]  s2_req_4_uop_uopIdx;
  reg         s2_req_4_uop_robIdx_flag;
  reg  [7:0]  s2_req_4_uop_robIdx_value;
  reg  [40:0] s2_req_4_vaddr;
  reg         s2_req_5_uop_exceptionVec_6;
  reg         s2_req_5_uop_exceptionVec_7;
  reg         s2_req_5_uop_exceptionVec_15;
  reg         s2_req_5_uop_exceptionVec_23;
  reg  [6:0]  s2_req_5_uop_uopIdx;
  reg         s2_req_5_uop_robIdx_flag;
  reg  [7:0]  s2_req_5_uop_robIdx_value;
  reg  [40:0] s2_req_5_vaddr;
  reg         s2_valid_REG;
  reg         s2_valid_REG_1_valid;
  reg         s2_valid_REG_1_bits_robIdx_flag;
  reg  [7:0]  s2_valid_REG_1_bits_robIdx_value;
  reg         s2_valid_REG_1_bits_level;
  wire [8:0]  _s2_valid_flushItself_T_5 =
    {s2_req_0_uop_robIdx_flag, s2_req_0_uop_robIdx_value};
  wire [8:0]  _flushItself_T_2 =
    {io_redirect_bits_robIdx_flag, io_redirect_bits_robIdx_value};
  reg         s2_valid_REG_2;
  reg         s2_valid_REG_3_valid;
  reg         s2_valid_REG_3_bits_robIdx_flag;
  reg  [7:0]  s2_valid_REG_3_bits_robIdx_value;
  reg         s2_valid_REG_3_bits_level;
  wire [8:0]  _s2_valid_flushItself_T_13 =
    {s2_req_1_uop_robIdx_flag, s2_req_1_uop_robIdx_value};
  reg         s2_valid_REG_4;
  reg         s2_valid_REG_5_valid;
  reg         s2_valid_REG_5_bits_robIdx_flag;
  reg  [7:0]  s2_valid_REG_5_bits_robIdx_value;
  reg         s2_valid_REG_5_bits_level;
  wire [8:0]  _s2_valid_flushItself_T_21 =
    {s2_req_2_uop_robIdx_flag, s2_req_2_uop_robIdx_value};
  reg         s2_valid_REG_6;
  reg         s2_valid_REG_7_valid;
  reg         s2_valid_REG_7_bits_robIdx_flag;
  reg  [7:0]  s2_valid_REG_7_bits_robIdx_value;
  reg         s2_valid_REG_7_bits_level;
  wire [8:0]  _s2_valid_flushItself_T_29 =
    {s2_req_3_uop_robIdx_flag, s2_req_3_uop_robIdx_value};
  reg         s2_valid_REG_8;
  reg         s2_valid_REG_9_valid;
  reg         s2_valid_REG_9_bits_robIdx_flag;
  reg  [7:0]  s2_valid_REG_9_bits_robIdx_value;
  reg         s2_valid_REG_9_bits_level;
  wire [8:0]  _s2_valid_flushItself_T_37 =
    {s2_req_4_uop_robIdx_flag, s2_req_4_uop_robIdx_value};
  reg         s2_valid_REG_10;
  reg         s2_valid_REG_11_valid;
  reg         s2_valid_REG_11_bits_robIdx_flag;
  reg  [7:0]  s2_valid_REG_11_bits_robIdx_value;
  reg         s2_valid_REG_11_bits_level;
  wire [8:0]  _s2_valid_flushItself_T_45 =
    {s2_req_5_uop_robIdx_flag, s2_req_5_uop_robIdx_value};
  wire        s2_enqueue_0 =
    s2_valid_REG
    & ~(s2_valid_REG_1_valid
        & (s2_valid_REG_1_bits_level
           & _s2_valid_flushItself_T_5 == {s2_valid_REG_1_bits_robIdx_flag,
                                           s2_valid_REG_1_bits_robIdx_value}
           | s2_req_0_uop_robIdx_flag ^ s2_valid_REG_1_bits_robIdx_flag
           ^ s2_req_0_uop_robIdx_value > s2_valid_REG_1_bits_robIdx_value))
    & ~(io_redirect_valid
        & (io_redirect_bits_level & _s2_valid_flushItself_T_5 == _flushItself_T_2
           | s2_req_0_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
           ^ s2_req_0_uop_robIdx_value > io_redirect_bits_robIdx_value))
    & (|{s2_req_0_uop_exceptionVec_23,
         s2_req_0_uop_exceptionVec_15,
         s2_req_0_uop_exceptionVec_7,
         s2_req_0_uop_exceptionVec_6,
         s2_req_0_uop_exceptionVec_3});
  wire        s2_enqueue_1 =
    s2_valid_REG_2
    & ~(s2_valid_REG_3_valid
        & (s2_valid_REG_3_bits_level
           & _s2_valid_flushItself_T_13 == {s2_valid_REG_3_bits_robIdx_flag,
                                            s2_valid_REG_3_bits_robIdx_value}
           | s2_req_1_uop_robIdx_flag ^ s2_valid_REG_3_bits_robIdx_flag
           ^ s2_req_1_uop_robIdx_value > s2_valid_REG_3_bits_robIdx_value))
    & ~(io_redirect_valid
        & (io_redirect_bits_level & _s2_valid_flushItself_T_13 == _flushItself_T_2
           | s2_req_1_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
           ^ s2_req_1_uop_robIdx_value > io_redirect_bits_robIdx_value))
    & (|{s2_req_1_uop_exceptionVec_23,
         s2_req_1_uop_exceptionVec_15,
         s2_req_1_uop_exceptionVec_7,
         s2_req_1_uop_exceptionVec_6,
         s2_req_1_uop_exceptionVec_3});
  wire        s2_enqueue_2 =
    s2_valid_REG_4
    & ~(s2_valid_REG_5_valid
        & (s2_valid_REG_5_bits_level
           & _s2_valid_flushItself_T_21 == {s2_valid_REG_5_bits_robIdx_flag,
                                            s2_valid_REG_5_bits_robIdx_value}
           | s2_req_2_uop_robIdx_flag ^ s2_valid_REG_5_bits_robIdx_flag
           ^ s2_req_2_uop_robIdx_value > s2_valid_REG_5_bits_robIdx_value))
    & ~(io_redirect_valid
        & (io_redirect_bits_level & _s2_valid_flushItself_T_21 == _flushItself_T_2
           | s2_req_2_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
           ^ s2_req_2_uop_robIdx_value > io_redirect_bits_robIdx_value))
    & (|{s2_req_2_uop_exceptionVec_23,
         s2_req_2_uop_exceptionVec_15,
         s2_req_2_uop_exceptionVec_7,
         s2_req_2_uop_exceptionVec_6,
         s2_req_2_uop_exceptionVec_3});
  wire        s2_enqueue_3 =
    s2_valid_REG_6
    & ~(s2_valid_REG_7_valid
        & (s2_valid_REG_7_bits_level
           & _s2_valid_flushItself_T_29 == {s2_valid_REG_7_bits_robIdx_flag,
                                            s2_valid_REG_7_bits_robIdx_value}
           | s2_req_3_uop_robIdx_flag ^ s2_valid_REG_7_bits_robIdx_flag
           ^ s2_req_3_uop_robIdx_value > s2_valid_REG_7_bits_robIdx_value))
    & ~(io_redirect_valid
        & (io_redirect_bits_level & _s2_valid_flushItself_T_29 == _flushItself_T_2
           | s2_req_3_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
           ^ s2_req_3_uop_robIdx_value > io_redirect_bits_robIdx_value))
    & (|{s2_req_3_uop_exceptionVec_23,
         s2_req_3_uop_exceptionVec_15,
         s2_req_3_uop_exceptionVec_7,
         s2_req_3_uop_exceptionVec_6,
         s2_req_3_uop_exceptionVec_3});
  wire        s2_enqueue_4 =
    s2_valid_REG_8
    & ~(s2_valid_REG_9_valid
        & (s2_valid_REG_9_bits_level
           & _s2_valid_flushItself_T_37 == {s2_valid_REG_9_bits_robIdx_flag,
                                            s2_valid_REG_9_bits_robIdx_value}
           | s2_req_4_uop_robIdx_flag ^ s2_valid_REG_9_bits_robIdx_flag
           ^ s2_req_4_uop_robIdx_value > s2_valid_REG_9_bits_robIdx_value))
    & ~(io_redirect_valid
        & (io_redirect_bits_level & _s2_valid_flushItself_T_37 == _flushItself_T_2
           | s2_req_4_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
           ^ s2_req_4_uop_robIdx_value > io_redirect_bits_robIdx_value))
    & (|{s2_req_4_uop_exceptionVec_23,
         s2_req_4_uop_exceptionVec_15,
         s2_req_4_uop_exceptionVec_7,
         s2_req_4_uop_exceptionVec_6});
  wire        s2_enqueue_5 =
    s2_valid_REG_10
    & ~(s2_valid_REG_11_valid
        & (s2_valid_REG_11_bits_level
           & _s2_valid_flushItself_T_45 == {s2_valid_REG_11_bits_robIdx_flag,
                                            s2_valid_REG_11_bits_robIdx_value}
           | s2_req_5_uop_robIdx_flag ^ s2_valid_REG_11_bits_robIdx_flag
           ^ s2_req_5_uop_robIdx_value > s2_valid_REG_11_bits_robIdx_value))
    & ~(io_redirect_valid
        & (io_redirect_bits_level & _s2_valid_flushItself_T_45 == _flushItself_T_2
           | s2_req_5_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
           ^ s2_req_5_uop_robIdx_value > io_redirect_bits_robIdx_value))
    & (|{s2_req_5_uop_exceptionVec_23,
         s2_req_5_uop_exceptionVec_15,
         s2_req_5_uop_exceptionVec_7,
         s2_req_5_uop_exceptionVec_6});
  wire [5:0]  _GEN =
    {s2_enqueue_5, s2_enqueue_4, s2_enqueue_3, s2_enqueue_2, s2_enqueue_1, s2_enqueue_0};
  always @(posedge clock or posedge reset) begin
    if (reset)
      req_valid <= 1'h0;
    else if (req_valid & io_redirect_valid
             & (io_redirect_bits_level
                & {req_uop_robIdx_flag, req_uop_robIdx_value} == _flushItself_T_2
                | req_uop_robIdx_flag ^ io_redirect_bits_robIdx_flag
                ^ req_uop_robIdx_value > io_redirect_bits_robIdx_value))
      req_valid <=
        |{s2_enqueue_5,
          s2_enqueue_4,
          s2_enqueue_3,
          s2_enqueue_2,
          s2_enqueue_1,
          s2_enqueue_0};
    else
      req_valid <= (|_GEN) | req_valid;
  end // always @(posedge, posedge)
  wire        _reqSel_left_right_oldest_T = s2_enqueue_1 & s2_enqueue_2;
  wire        reqSel_left_right_oldest_differentFlag =
    s2_req_1_uop_robIdx_flag ^ s2_req_2_uop_robIdx_flag;
  wire        _reqSel_left_right_oldest_T_5 =
    reqSel_left_right_oldest_differentFlag
    ^ s2_req_1_uop_robIdx_value > s2_req_2_uop_robIdx_value
    | (reqSel_left_right_oldest_differentFlag
       ^ s2_req_1_uop_robIdx_value >= s2_req_2_uop_robIdx_value)
    & s2_req_1_uop_uopIdx > s2_req_2_uop_uopIdx;
  wire        _reqSel_left_right_oldest_T_8 = s2_enqueue_1 & ~s2_enqueue_2;
  wire        reqSel_left_res_1_valid =
    _reqSel_left_right_oldest_T
      ? (_reqSel_left_right_oldest_T_5 ? s2_enqueue_2 : s2_enqueue_1)
      : _reqSel_left_right_oldest_T_8 ? s2_enqueue_1 : s2_enqueue_2;
  wire [6:0]  reqSel_left_res_1_bits_uop_uopIdx =
    _reqSel_left_right_oldest_T
      ? (_reqSel_left_right_oldest_T_5 ? s2_req_2_uop_uopIdx : s2_req_1_uop_uopIdx)
      : _reqSel_left_right_oldest_T_8 ? s2_req_1_uop_uopIdx : s2_req_2_uop_uopIdx;
  wire        reqSel_left_res_1_bits_uop_robIdx_flag =
    _reqSel_left_right_oldest_T
      ? (_reqSel_left_right_oldest_T_5
           ? s2_req_2_uop_robIdx_flag
           : s2_req_1_uop_robIdx_flag)
      : _reqSel_left_right_oldest_T_8
          ? s2_req_1_uop_robIdx_flag
          : s2_req_2_uop_robIdx_flag;
  wire [7:0]  reqSel_left_res_1_bits_uop_robIdx_value =
    _reqSel_left_right_oldest_T
      ? (_reqSel_left_right_oldest_T_5
           ? s2_req_2_uop_robIdx_value
           : s2_req_1_uop_robIdx_value)
      : _reqSel_left_right_oldest_T_8
          ? s2_req_1_uop_robIdx_value
          : s2_req_2_uop_robIdx_value;
  wire        _reqSel_left_oldest_T = s2_enqueue_0 & reqSel_left_res_1_valid;
  wire        reqSel_left_oldest_differentFlag =
    s2_req_0_uop_robIdx_flag ^ reqSel_left_res_1_bits_uop_robIdx_flag;
  wire        _reqSel_left_oldest_T_5 =
    reqSel_left_oldest_differentFlag
    ^ s2_req_0_uop_robIdx_value > reqSel_left_res_1_bits_uop_robIdx_value
    | (reqSel_left_oldest_differentFlag
       ^ s2_req_0_uop_robIdx_value >= reqSel_left_res_1_bits_uop_robIdx_value)
    & s2_req_0_uop_uopIdx > reqSel_left_res_1_bits_uop_uopIdx;
  wire        _reqSel_left_oldest_T_8 = s2_enqueue_0 & ~reqSel_left_res_1_valid;
  wire        reqSel_res_0_valid =
    _reqSel_left_oldest_T
      ? (_reqSel_left_oldest_T_5 ? reqSel_left_res_1_valid : s2_enqueue_0)
      : _reqSel_left_oldest_T_8 ? s2_enqueue_0 : reqSel_left_res_1_valid;
  wire [6:0]  reqSel_res_0_bits_uop_uopIdx =
    _reqSel_left_oldest_T
      ? (_reqSel_left_oldest_T_5
           ? reqSel_left_res_1_bits_uop_uopIdx
           : s2_req_0_uop_uopIdx)
      : _reqSel_left_oldest_T_8 ? s2_req_0_uop_uopIdx : reqSel_left_res_1_bits_uop_uopIdx;
  wire        reqSel_res_0_bits_uop_robIdx_flag =
    _reqSel_left_oldest_T
      ? (_reqSel_left_oldest_T_5
           ? reqSel_left_res_1_bits_uop_robIdx_flag
           : s2_req_0_uop_robIdx_flag)
      : _reqSel_left_oldest_T_8
          ? s2_req_0_uop_robIdx_flag
          : reqSel_left_res_1_bits_uop_robIdx_flag;
  wire [7:0]  reqSel_res_0_bits_uop_robIdx_value =
    _reqSel_left_oldest_T
      ? (_reqSel_left_oldest_T_5
           ? reqSel_left_res_1_bits_uop_robIdx_value
           : s2_req_0_uop_robIdx_value)
      : _reqSel_left_oldest_T_8
          ? s2_req_0_uop_robIdx_value
          : reqSel_left_res_1_bits_uop_robIdx_value;
  wire        _reqSel_right_right_oldest_T = s2_enqueue_4 & s2_enqueue_5;
  wire        reqSel_right_right_oldest_differentFlag =
    s2_req_4_uop_robIdx_flag ^ s2_req_5_uop_robIdx_flag;
  wire        _reqSel_right_right_oldest_T_5 =
    reqSel_right_right_oldest_differentFlag
    ^ s2_req_4_uop_robIdx_value > s2_req_5_uop_robIdx_value
    | (reqSel_right_right_oldest_differentFlag
       ^ s2_req_4_uop_robIdx_value >= s2_req_5_uop_robIdx_value)
    & s2_req_4_uop_uopIdx > s2_req_5_uop_uopIdx;
  wire        _reqSel_right_right_oldest_T_8 = s2_enqueue_4 & ~s2_enqueue_5;
  wire        reqSel_right_res_1_valid =
    _reqSel_right_right_oldest_T
      ? (_reqSel_right_right_oldest_T_5 ? s2_enqueue_5 : s2_enqueue_4)
      : _reqSel_right_right_oldest_T_8 ? s2_enqueue_4 : s2_enqueue_5;
  wire [6:0]  reqSel_right_res_1_bits_uop_uopIdx =
    _reqSel_right_right_oldest_T
      ? (_reqSel_right_right_oldest_T_5 ? s2_req_5_uop_uopIdx : s2_req_4_uop_uopIdx)
      : _reqSel_right_right_oldest_T_8 ? s2_req_4_uop_uopIdx : s2_req_5_uop_uopIdx;
  wire        reqSel_right_res_1_bits_uop_robIdx_flag =
    _reqSel_right_right_oldest_T
      ? (_reqSel_right_right_oldest_T_5
           ? s2_req_5_uop_robIdx_flag
           : s2_req_4_uop_robIdx_flag)
      : _reqSel_right_right_oldest_T_8
          ? s2_req_4_uop_robIdx_flag
          : s2_req_5_uop_robIdx_flag;
  wire [7:0]  reqSel_right_res_1_bits_uop_robIdx_value =
    _reqSel_right_right_oldest_T
      ? (_reqSel_right_right_oldest_T_5
           ? s2_req_5_uop_robIdx_value
           : s2_req_4_uop_robIdx_value)
      : _reqSel_right_right_oldest_T_8
          ? s2_req_4_uop_robIdx_value
          : s2_req_5_uop_robIdx_value;
  wire        _reqSel_right_oldest_T = s2_enqueue_3 & reqSel_right_res_1_valid;
  wire        reqSel_right_oldest_differentFlag =
    s2_req_3_uop_robIdx_flag ^ reqSel_right_res_1_bits_uop_robIdx_flag;
  wire        _reqSel_right_oldest_T_5 =
    reqSel_right_oldest_differentFlag
    ^ s2_req_3_uop_robIdx_value > reqSel_right_res_1_bits_uop_robIdx_value
    | (reqSel_right_oldest_differentFlag
       ^ s2_req_3_uop_robIdx_value >= reqSel_right_res_1_bits_uop_robIdx_value)
    & s2_req_3_uop_uopIdx > reqSel_right_res_1_bits_uop_uopIdx;
  wire        _reqSel_right_oldest_T_8 = s2_enqueue_3 & ~reqSel_right_res_1_valid;
  wire        reqSel_res_1_valid =
    _reqSel_right_oldest_T
      ? (_reqSel_right_oldest_T_5 ? reqSel_right_res_1_valid : s2_enqueue_3)
      : _reqSel_right_oldest_T_8 ? s2_enqueue_3 : reqSel_right_res_1_valid;
  wire [6:0]  reqSel_res_1_bits_uop_uopIdx =
    _reqSel_right_oldest_T
      ? (_reqSel_right_oldest_T_5
           ? reqSel_right_res_1_bits_uop_uopIdx
           : s2_req_3_uop_uopIdx)
      : _reqSel_right_oldest_T_8
          ? s2_req_3_uop_uopIdx
          : reqSel_right_res_1_bits_uop_uopIdx;
  wire        reqSel_res_1_bits_uop_robIdx_flag =
    _reqSel_right_oldest_T
      ? (_reqSel_right_oldest_T_5
           ? reqSel_right_res_1_bits_uop_robIdx_flag
           : s2_req_3_uop_robIdx_flag)
      : _reqSel_right_oldest_T_8
          ? s2_req_3_uop_robIdx_flag
          : reqSel_right_res_1_bits_uop_robIdx_flag;
  wire [7:0]  reqSel_res_1_bits_uop_robIdx_value =
    _reqSel_right_oldest_T
      ? (_reqSel_right_oldest_T_5
           ? reqSel_right_res_1_bits_uop_robIdx_value
           : s2_req_3_uop_robIdx_value)
      : _reqSel_right_oldest_T_8
          ? s2_req_3_uop_robIdx_value
          : reqSel_right_res_1_bits_uop_robIdx_value;
  wire        _reqSel_oldest_T = reqSel_res_0_valid & reqSel_res_1_valid;
  wire        reqSel_oldest_differentFlag =
    reqSel_res_0_bits_uop_robIdx_flag ^ reqSel_res_1_bits_uop_robIdx_flag;
  wire        _reqSel_oldest_T_5 =
    reqSel_oldest_differentFlag
    ^ reqSel_res_0_bits_uop_robIdx_value > reqSel_res_1_bits_uop_robIdx_value
    | (reqSel_oldest_differentFlag
       ^ reqSel_res_0_bits_uop_robIdx_value >= reqSel_res_1_bits_uop_robIdx_value)
    & reqSel_res_0_bits_uop_uopIdx > reqSel_res_1_bits_uop_uopIdx;
  wire        _reqSel_oldest_T_8 = reqSel_res_0_valid & ~reqSel_res_1_valid;
  wire [6:0]  reqSel_oldest_bits_uop_uopIdx =
    _reqSel_oldest_T
      ? (_reqSel_oldest_T_5 ? reqSel_res_1_bits_uop_uopIdx : reqSel_res_0_bits_uop_uopIdx)
      : _reqSel_oldest_T_8 ? reqSel_res_0_bits_uop_uopIdx : reqSel_res_1_bits_uop_uopIdx;
  wire        reqSel_oldest_bits_uop_robIdx_flag =
    _reqSel_oldest_T
      ? (_reqSel_oldest_T_5
           ? reqSel_res_1_bits_uop_robIdx_flag
           : reqSel_res_0_bits_uop_robIdx_flag)
      : _reqSel_oldest_T_8
          ? reqSel_res_0_bits_uop_robIdx_flag
          : reqSel_res_1_bits_uop_robIdx_flag;
  wire [7:0]  reqSel_oldest_bits_uop_robIdx_value =
    _reqSel_oldest_T
      ? (_reqSel_oldest_T_5
           ? reqSel_res_1_bits_uop_robIdx_value
           : reqSel_res_0_bits_uop_robIdx_value)
      : _reqSel_oldest_T_8
          ? reqSel_res_0_bits_uop_robIdx_value
          : reqSel_res_1_bits_uop_robIdx_value;
  wire        req_differentFlag =
    req_uop_robIdx_flag ^ reqSel_oldest_bits_uop_robIdx_flag;
  wire [40:0] reqSel_left_res_1_bits_vaddr =
    _reqSel_left_right_oldest_T
      ? (_reqSel_left_right_oldest_T_5 ? s2_req_2_vaddr : s2_req_1_vaddr)
      : _reqSel_left_right_oldest_T_8 ? s2_req_1_vaddr : s2_req_2_vaddr;
  wire [40:0] reqSel_left_res_1_bits_gpaddr =
    _reqSel_left_right_oldest_T
      ? (_reqSel_left_right_oldest_T_5 ? s2_req_2_gpaddr : s2_req_1_gpaddr)
      : _reqSel_left_right_oldest_T_8 ? s2_req_1_gpaddr : s2_req_2_gpaddr;
  wire [40:0] reqSel_res_0_bits_vaddr =
    _reqSel_left_oldest_T
      ? (_reqSel_left_oldest_T_5 ? reqSel_left_res_1_bits_vaddr : s2_req_0_vaddr)
      : _reqSel_left_oldest_T_8 ? s2_req_0_vaddr : reqSel_left_res_1_bits_vaddr;
  wire [40:0] reqSel_res_0_bits_gpaddr =
    _reqSel_left_oldest_T
      ? (_reqSel_left_oldest_T_5 ? reqSel_left_res_1_bits_gpaddr : s2_req_0_gpaddr)
      : _reqSel_left_oldest_T_8 ? s2_req_0_gpaddr : reqSel_left_res_1_bits_gpaddr;
  wire [40:0] reqSel_right_res_1_bits_vaddr =
    _reqSel_right_right_oldest_T
      ? (_reqSel_right_right_oldest_T_5 ? s2_req_5_vaddr : s2_req_4_vaddr)
      : _reqSel_right_right_oldest_T_8 ? s2_req_4_vaddr : s2_req_5_vaddr;
  wire [40:0] reqSel_res_1_bits_vaddr =
    _reqSel_right_oldest_T
      ? (_reqSel_right_oldest_T_5 ? reqSel_right_res_1_bits_vaddr : s2_req_3_vaddr)
      : _reqSel_right_oldest_T_8 ? s2_req_3_vaddr : reqSel_right_res_1_bits_vaddr;
  wire [40:0] reqSel_res_1_bits_gpaddr =
    _reqSel_right_oldest_T
      ? (_reqSel_right_oldest_T_5 ? 41'h0 : s2_req_3_gpaddr)
      : _reqSel_right_oldest_T_8 ? s2_req_3_gpaddr : 41'h0;
  always @(posedge clock) begin
    if (req_valid
          ? (_reqSel_oldest_T
               ? (_reqSel_oldest_T_5 ? reqSel_res_1_valid : reqSel_res_0_valid)
               : _reqSel_oldest_T_8 ? reqSel_res_0_valid : reqSel_res_1_valid)
            & (req_differentFlag
               ^ req_uop_robIdx_value > reqSel_oldest_bits_uop_robIdx_value
               | (req_differentFlag
                  ^ req_uop_robIdx_value >= reqSel_oldest_bits_uop_robIdx_value)
               & req_uop_uopIdx > reqSel_oldest_bits_uop_uopIdx)
          : (|_GEN)) begin
      req_uop_uopIdx <= reqSel_oldest_bits_uop_uopIdx;
      req_uop_robIdx_flag <= reqSel_oldest_bits_uop_robIdx_flag;
      req_uop_robIdx_value <= reqSel_oldest_bits_uop_robIdx_value;
      req_vaddr <=
        _reqSel_oldest_T
          ? (_reqSel_oldest_T_5 ? reqSel_res_1_bits_vaddr : reqSel_res_0_bits_vaddr)
          : _reqSel_oldest_T_8 ? reqSel_res_0_bits_vaddr : reqSel_res_1_bits_vaddr;
      req_gpaddr <=
        _reqSel_oldest_T
          ? (_reqSel_oldest_T_5 ? reqSel_res_1_bits_gpaddr : reqSel_res_0_bits_gpaddr)
          : _reqSel_oldest_T_8 ? reqSel_res_0_bits_gpaddr : reqSel_res_1_bits_gpaddr;
    end
    if (io_storeAddrIn_0_valid) begin
      s2_req_0_uop_exceptionVec_3 <= io_storeAddrIn_0_bits_uop_exceptionVec_3;
      s2_req_0_uop_exceptionVec_6 <= io_storeAddrIn_0_bits_uop_exceptionVec_6;
      s2_req_0_uop_exceptionVec_7 <= io_storeAddrIn_0_bits_uop_exceptionVec_7;
      s2_req_0_uop_exceptionVec_15 <= io_storeAddrIn_0_bits_uop_exceptionVec_15;
      s2_req_0_uop_exceptionVec_23 <= io_storeAddrIn_0_bits_uop_exceptionVec_23;
      s2_req_0_uop_uopIdx <= io_storeAddrIn_0_bits_uop_uopIdx;
      s2_req_0_uop_robIdx_flag <= io_storeAddrIn_0_bits_uop_robIdx_flag;
      s2_req_0_uop_robIdx_value <= io_storeAddrIn_0_bits_uop_robIdx_value;
      s2_req_0_vaddr <= io_storeAddrIn_0_bits_vaddr;
      s2_req_0_gpaddr <= io_storeAddrIn_0_bits_gpaddr;
    end
    if (io_storeAddrIn_1_valid) begin
      s2_req_1_uop_exceptionVec_3 <= io_storeAddrIn_1_bits_uop_exceptionVec_3;
      s2_req_1_uop_exceptionVec_6 <= io_storeAddrIn_1_bits_uop_exceptionVec_6;
      s2_req_1_uop_exceptionVec_7 <= io_storeAddrIn_1_bits_uop_exceptionVec_7;
      s2_req_1_uop_exceptionVec_15 <= io_storeAddrIn_1_bits_uop_exceptionVec_15;
      s2_req_1_uop_exceptionVec_23 <= io_storeAddrIn_1_bits_uop_exceptionVec_23;
      s2_req_1_uop_uopIdx <= io_storeAddrIn_1_bits_uop_uopIdx;
      s2_req_1_uop_robIdx_flag <= io_storeAddrIn_1_bits_uop_robIdx_flag;
      s2_req_1_uop_robIdx_value <= io_storeAddrIn_1_bits_uop_robIdx_value;
      s2_req_1_vaddr <= io_storeAddrIn_1_bits_vaddr;
      s2_req_1_gpaddr <= io_storeAddrIn_1_bits_gpaddr;
    end
    if (io_storeAddrIn_2_valid) begin
      s2_req_2_uop_exceptionVec_3 <= io_storeAddrIn_2_bits_uop_exceptionVec_3;
      s2_req_2_uop_exceptionVec_6 <= io_storeAddrIn_2_bits_uop_exceptionVec_6;
      s2_req_2_uop_exceptionVec_7 <= io_storeAddrIn_2_bits_uop_exceptionVec_7;
      s2_req_2_uop_exceptionVec_15 <= io_storeAddrIn_2_bits_uop_exceptionVec_15;
      s2_req_2_uop_exceptionVec_23 <= io_storeAddrIn_2_bits_uop_exceptionVec_23;
      s2_req_2_uop_uopIdx <= io_storeAddrIn_2_bits_uop_uopIdx;
      s2_req_2_uop_robIdx_flag <= io_storeAddrIn_2_bits_uop_robIdx_flag;
      s2_req_2_uop_robIdx_value <= io_storeAddrIn_2_bits_uop_robIdx_value;
      s2_req_2_vaddr <= io_storeAddrIn_2_bits_vaddr;
      s2_req_2_gpaddr <= io_storeAddrIn_2_bits_gpaddr;
    end
    if (io_storeAddrIn_3_valid) begin
      s2_req_3_uop_exceptionVec_3 <= io_storeAddrIn_3_bits_uop_exceptionVec_3;
      s2_req_3_uop_exceptionVec_6 <= io_storeAddrIn_3_bits_uop_exceptionVec_6;
      s2_req_3_uop_exceptionVec_7 <= io_storeAddrIn_3_bits_uop_exceptionVec_7;
      s2_req_3_uop_exceptionVec_15 <= io_storeAddrIn_3_bits_uop_exceptionVec_15;
      s2_req_3_uop_exceptionVec_23 <= io_storeAddrIn_3_bits_uop_exceptionVec_23;
      s2_req_3_uop_uopIdx <= io_storeAddrIn_3_bits_uop_uopIdx;
      s2_req_3_uop_robIdx_flag <= io_storeAddrIn_3_bits_uop_robIdx_flag;
      s2_req_3_uop_robIdx_value <= io_storeAddrIn_3_bits_uop_robIdx_value;
      s2_req_3_vaddr <= io_storeAddrIn_3_bits_vaddr;
      s2_req_3_gpaddr <= io_storeAddrIn_3_bits_gpaddr;
    end
    if (io_storeAddrIn_4_valid) begin
      s2_req_4_uop_exceptionVec_6 <= io_storeAddrIn_4_bits_uop_exceptionVec_6;
      s2_req_4_uop_exceptionVec_7 <= io_storeAddrIn_4_bits_uop_exceptionVec_7;
      s2_req_4_uop_exceptionVec_15 <= io_storeAddrIn_4_bits_uop_exceptionVec_15;
      s2_req_4_uop_exceptionVec_23 <= io_storeAddrIn_4_bits_uop_exceptionVec_23;
      s2_req_4_uop_uopIdx <= io_storeAddrIn_4_bits_uop_uopIdx;
      s2_req_4_uop_robIdx_flag <= io_storeAddrIn_4_bits_uop_robIdx_flag;
      s2_req_4_uop_robIdx_value <= io_storeAddrIn_4_bits_uop_robIdx_value;
      s2_req_4_vaddr <= io_storeAddrIn_4_bits_vaddr;
    end
    if (io_storeAddrIn_5_valid) begin
      s2_req_5_uop_exceptionVec_6 <= io_storeAddrIn_5_bits_uop_exceptionVec_6;
      s2_req_5_uop_exceptionVec_7 <= io_storeAddrIn_5_bits_uop_exceptionVec_7;
      s2_req_5_uop_exceptionVec_15 <= io_storeAddrIn_5_bits_uop_exceptionVec_15;
      s2_req_5_uop_exceptionVec_23 <= io_storeAddrIn_5_bits_uop_exceptionVec_23;
      s2_req_5_uop_uopIdx <= io_storeAddrIn_5_bits_uop_uopIdx;
      s2_req_5_uop_robIdx_flag <= io_storeAddrIn_5_bits_uop_robIdx_flag;
      s2_req_5_uop_robIdx_value <= io_storeAddrIn_5_bits_uop_robIdx_value;
      s2_req_5_vaddr <= io_storeAddrIn_5_bits_vaddr;
    end
    s2_valid_REG <= io_storeAddrIn_0_valid;
    s2_valid_REG_1_valid <= io_redirect_valid;
    s2_valid_REG_1_bits_robIdx_flag <= io_redirect_bits_robIdx_flag;
    s2_valid_REG_1_bits_robIdx_value <= io_redirect_bits_robIdx_value;
    s2_valid_REG_1_bits_level <= io_redirect_bits_level;
    s2_valid_REG_2 <= io_storeAddrIn_1_valid;
    s2_valid_REG_3_valid <= io_redirect_valid;
    s2_valid_REG_3_bits_robIdx_flag <= io_redirect_bits_robIdx_flag;
    s2_valid_REG_3_bits_robIdx_value <= io_redirect_bits_robIdx_value;
    s2_valid_REG_3_bits_level <= io_redirect_bits_level;
    s2_valid_REG_4 <= io_storeAddrIn_2_valid;
    s2_valid_REG_5_valid <= io_redirect_valid;
    s2_valid_REG_5_bits_robIdx_flag <= io_redirect_bits_robIdx_flag;
    s2_valid_REG_5_bits_robIdx_value <= io_redirect_bits_robIdx_value;
    s2_valid_REG_5_bits_level <= io_redirect_bits_level;
    s2_valid_REG_6 <= io_storeAddrIn_3_valid;
    s2_valid_REG_7_valid <= io_redirect_valid;
    s2_valid_REG_7_bits_robIdx_flag <= io_redirect_bits_robIdx_flag;
    s2_valid_REG_7_bits_robIdx_value <= io_redirect_bits_robIdx_value;
    s2_valid_REG_7_bits_level <= io_redirect_bits_level;
    s2_valid_REG_8 <= io_storeAddrIn_4_valid;
    s2_valid_REG_9_valid <= io_redirect_valid;
    s2_valid_REG_9_bits_robIdx_flag <= io_redirect_bits_robIdx_flag;
    s2_valid_REG_9_bits_robIdx_value <= io_redirect_bits_robIdx_value;
    s2_valid_REG_9_bits_level <= io_redirect_bits_level;
    s2_valid_REG_10 <= io_storeAddrIn_5_valid;
    s2_valid_REG_11_valid <= io_redirect_valid;
    s2_valid_REG_11_bits_robIdx_flag <= io_redirect_bits_robIdx_flag;
    s2_valid_REG_11_bits_robIdx_value <= io_redirect_bits_robIdx_value;
    s2_valid_REG_11_bits_level <= io_redirect_bits_level;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:449];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [8:0] i = 9'h0; i < 9'h1C2; i += 9'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        req_valid = _RANDOM[9'h0][0];
        req_uop_uopIdx = {_RANDOM[9'hE][31:28], _RANDOM[9'hF][2:0]};
        req_uop_robIdx_flag = _RANDOM[9'h12][22];
        req_uop_robIdx_value = _RANDOM[9'h12][30:23];
        req_vaddr = {_RANDOM[9'h26][31:14], _RANDOM[9'h27][22:0]};
        req_gpaddr = {_RANDOM[9'h28][31:27], _RANDOM[9'h29], _RANDOM[9'h2A][3:0]};
        s2_req_0_uop_exceptionVec_3 = _RANDOM[9'h38][10];
        s2_req_0_uop_exceptionVec_6 = _RANDOM[9'h38][13];
        s2_req_0_uop_exceptionVec_7 = _RANDOM[9'h38][14];
        s2_req_0_uop_exceptionVec_15 = _RANDOM[9'h38][22];
        s2_req_0_uop_exceptionVec_23 = _RANDOM[9'h38][30];
        s2_req_0_uop_uopIdx = _RANDOM[9'h44][21:15];
        s2_req_0_uop_robIdx_flag = _RANDOM[9'h48][9];
        s2_req_0_uop_robIdx_value = _RANDOM[9'h48][17:10];
        s2_req_0_vaddr = {_RANDOM[9'h5C][31:1], _RANDOM[9'h5D][9:0]};
        s2_req_0_gpaddr = {_RANDOM[9'h5E][31:14], _RANDOM[9'h5F][22:0]};
        s2_req_1_uop_exceptionVec_3 = _RANDOM[9'h6D][29];
        s2_req_1_uop_exceptionVec_6 = _RANDOM[9'h6E][0];
        s2_req_1_uop_exceptionVec_7 = _RANDOM[9'h6E][1];
        s2_req_1_uop_exceptionVec_15 = _RANDOM[9'h6E][9];
        s2_req_1_uop_exceptionVec_23 = _RANDOM[9'h6E][17];
        s2_req_1_uop_uopIdx = _RANDOM[9'h7A][8:2];
        s2_req_1_uop_robIdx_flag = _RANDOM[9'h7D][28];
        s2_req_1_uop_robIdx_value = {_RANDOM[9'h7D][31:29], _RANDOM[9'h7E][4:0]};
        s2_req_1_vaddr = {_RANDOM[9'h91][31:20], _RANDOM[9'h92][28:0]};
        s2_req_1_gpaddr = {_RANDOM[9'h94][31:1], _RANDOM[9'h95][9:0]};
        s2_req_2_uop_exceptionVec_3 = _RANDOM[9'hA3][16];
        s2_req_2_uop_exceptionVec_6 = _RANDOM[9'hA3][19];
        s2_req_2_uop_exceptionVec_7 = _RANDOM[9'hA3][20];
        s2_req_2_uop_exceptionVec_15 = _RANDOM[9'hA3][28];
        s2_req_2_uop_exceptionVec_23 = _RANDOM[9'hA4][4];
        s2_req_2_uop_uopIdx = _RANDOM[9'hAF][27:21];
        s2_req_2_uop_robIdx_flag = _RANDOM[9'hB3][15];
        s2_req_2_uop_robIdx_value = _RANDOM[9'hB3][23:16];
        s2_req_2_vaddr = {_RANDOM[9'hC7][31:7], _RANDOM[9'hC8][15:0]};
        s2_req_2_gpaddr = {_RANDOM[9'hC9][31:20], _RANDOM[9'hCA][28:0]};
        s2_req_3_uop_exceptionVec_3 = _RANDOM[9'hD9][3];
        s2_req_3_uop_exceptionVec_6 = _RANDOM[9'hD9][6];
        s2_req_3_uop_exceptionVec_7 = _RANDOM[9'hD9][7];
        s2_req_3_uop_exceptionVec_15 = _RANDOM[9'hD9][15];
        s2_req_3_uop_exceptionVec_23 = _RANDOM[9'hD9][23];
        s2_req_3_uop_uopIdx = _RANDOM[9'hE5][14:8];
        s2_req_3_uop_robIdx_flag = _RANDOM[9'hE9][2];
        s2_req_3_uop_robIdx_value = _RANDOM[9'hE9][10:3];
        s2_req_3_vaddr = {_RANDOM[9'hFC][31:26], _RANDOM[9'hFD], _RANDOM[9'hFE][2:0]};
        s2_req_3_gpaddr = {_RANDOM[9'hFF][31:7], _RANDOM[9'h100][15:0]};
        s2_req_4_uop_exceptionVec_6 = _RANDOM[9'h10E][25];
        s2_req_4_uop_exceptionVec_7 = _RANDOM[9'h10E][26];
        s2_req_4_uop_exceptionVec_15 = _RANDOM[9'h10F][2];
        s2_req_4_uop_exceptionVec_23 = _RANDOM[9'h10F][10];
        s2_req_4_uop_uopIdx = {_RANDOM[9'h11A][31:27], _RANDOM[9'h11B][1:0]};
        s2_req_4_uop_robIdx_flag = _RANDOM[9'h11E][21];
        s2_req_4_uop_robIdx_value = _RANDOM[9'h11E][29:22];
        s2_req_4_vaddr = {_RANDOM[9'h132][31:13], _RANDOM[9'h133][21:0]};
        s2_req_5_uop_exceptionVec_6 = _RANDOM[9'h144][12];
        s2_req_5_uop_exceptionVec_7 = _RANDOM[9'h144][13];
        s2_req_5_uop_exceptionVec_15 = _RANDOM[9'h144][21];
        s2_req_5_uop_exceptionVec_23 = _RANDOM[9'h144][29];
        s2_req_5_uop_uopIdx = _RANDOM[9'h150][20:14];
        s2_req_5_uop_robIdx_flag = _RANDOM[9'h154][8];
        s2_req_5_uop_robIdx_value = _RANDOM[9'h154][16:9];
        s2_req_5_vaddr = {_RANDOM[9'h168], _RANDOM[9'h169][8:0]};
        s2_valid_REG = _RANDOM[9'h177][6];
        s2_valid_REG_1_valid = _RANDOM[9'h177][7];
        s2_valid_REG_1_bits_robIdx_flag = _RANDOM[9'h177][9];
        s2_valid_REG_1_bits_robIdx_value = _RANDOM[9'h177][17:10];
        s2_valid_REG_1_bits_level = _RANDOM[9'h177][29];
        s2_valid_REG_2 = _RANDOM[9'h185][31];
        s2_valid_REG_3_valid = _RANDOM[9'h186][0];
        s2_valid_REG_3_bits_robIdx_flag = _RANDOM[9'h186][2];
        s2_valid_REG_3_bits_robIdx_value = _RANDOM[9'h186][10:3];
        s2_valid_REG_3_bits_level = _RANDOM[9'h186][22];
        s2_valid_REG_4 = _RANDOM[9'h194][24];
        s2_valid_REG_5_valid = _RANDOM[9'h194][25];
        s2_valid_REG_5_bits_robIdx_flag = _RANDOM[9'h194][27];
        s2_valid_REG_5_bits_robIdx_value = {_RANDOM[9'h194][31:28], _RANDOM[9'h195][3:0]};
        s2_valid_REG_5_bits_level = _RANDOM[9'h195][15];
        s2_valid_REG_6 = _RANDOM[9'h1A3][17];
        s2_valid_REG_7_valid = _RANDOM[9'h1A3][18];
        s2_valid_REG_7_bits_robIdx_flag = _RANDOM[9'h1A3][20];
        s2_valid_REG_7_bits_robIdx_value = _RANDOM[9'h1A3][28:21];
        s2_valid_REG_7_bits_level = _RANDOM[9'h1A4][8];
        s2_valid_REG_8 = _RANDOM[9'h1B2][10];
        s2_valid_REG_9_valid = _RANDOM[9'h1B2][11];
        s2_valid_REG_9_bits_robIdx_flag = _RANDOM[9'h1B2][13];
        s2_valid_REG_9_bits_robIdx_value = _RANDOM[9'h1B2][21:14];
        s2_valid_REG_9_bits_level = _RANDOM[9'h1B3][1];
        s2_valid_REG_10 = _RANDOM[9'h1C1][3];
        s2_valid_REG_11_valid = _RANDOM[9'h1C1][4];
        s2_valid_REG_11_bits_robIdx_flag = _RANDOM[9'h1C1][6];
        s2_valid_REG_11_bits_robIdx_value = _RANDOM[9'h1C1][14:7];
        s2_valid_REG_11_bits_level = _RANDOM[9'h1C1][26];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        req_valid = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_exceptionAddr_vaddr = req_vaddr;
  assign io_exceptionAddr_gpaddr = req_gpaddr;
endmodule

