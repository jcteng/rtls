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

module VFMA(
  input          clock,
  input          reset,
  input          io_flush_valid,
  input          io_flush_bits_robIdx_flag,
  input  [7:0]   io_flush_bits_robIdx_value,
  input          io_flush_bits_level,
  input          io_in_valid,
  input  [8:0]   io_in_bits_ctrl_fuOpType,
  input          io_in_bits_ctrl_robIdx_flag,
  input  [7:0]   io_in_bits_ctrl_robIdx_value,
  input  [7:0]   io_in_bits_ctrl_pdest,
  input          io_in_bits_ctrl_vecWen,
  input          io_in_bits_ctrl_v0Wen,
  input          io_in_bits_ctrl_fpu_wflags,
  input          io_in_bits_ctrl_vpu_vma,
  input          io_in_bits_ctrl_vpu_vta,
  input  [1:0]   io_in_bits_ctrl_vpu_vsew,
  input  [2:0]   io_in_bits_ctrl_vpu_vlmul,
  input          io_in_bits_ctrl_vpu_vm,
  input  [7:0]   io_in_bits_ctrl_vpu_vstart,
  input  [6:0]   io_in_bits_ctrl_vpu_vuopIdx,
  input          io_in_bits_ctrl_vpu_isNarrow,
  input          io_in_bits_ctrl_vpu_isDstMask,
  input  [7:0]   io_in_bits_data_src_4,
  input  [127:0] io_in_bits_data_src_3,
  input  [127:0] io_in_bits_data_src_2,
  input  [127:0] io_in_bits_data_src_1,
  input  [127:0] io_in_bits_data_src_0,
  output         io_out_valid,
  output         io_out_bits_ctrl_robIdx_flag,
  output [7:0]   io_out_bits_ctrl_robIdx_value,
  output [7:0]   io_out_bits_ctrl_pdest,
  output         io_out_bits_ctrl_vecWen,
  output         io_out_bits_ctrl_v0Wen,
  output         io_out_bits_ctrl_fpu_wflags,
  output [127:0] io_out_bits_res_data,
  output [4:0]   io_out_bits_res_fflags,
  input  [2:0]   io_frm
);

  wire [63:0]  _oldVdSplit_io_outVec64b_0;
  wire [63:0]  _oldVdSplit_io_outVec64b_1;
  wire [31:0]  _vs1Split_io_outVec32b_0;
  wire [31:0]  _vs1Split_io_outVec32b_1;
  wire [31:0]  _vs1Split_io_outVec32b_2;
  wire [31:0]  _vs1Split_io_outVec32b_3;
  wire [63:0]  _vs1Split_io_outVec64b_0;
  wire [63:0]  _vs1Split_io_outVec64b_1;
  wire [31:0]  _vs2Split_io_outVec32b_0;
  wire [31:0]  _vs2Split_io_outVec32b_1;
  wire [31:0]  _vs2Split_io_outVec32b_2;
  wire [31:0]  _vs2Split_io_outVec32b_3;
  wire [63:0]  _vs2Split_io_outVec64b_0;
  wire [63:0]  _vs2Split_io_outVec64b_1;
  wire [63:0]  _vfmas_1_io_fp_result;
  wire [19:0]  _vfmas_1_io_fflags;
  wire [63:0]  _vfmas_0_io_fp_result;
  wire [19:0]  _vfmas_0_io_fflags;
  reg          validVec_1;
  reg          validVec_2;
  reg          validVec_3;
  reg  [8:0]   ctrlVec_1_fuOpType;
  reg          ctrlVec_1_robIdx_flag;
  reg  [7:0]   ctrlVec_1_robIdx_value;
  reg  [7:0]   ctrlVec_1_pdest;
  reg          ctrlVec_1_vecWen;
  reg          ctrlVec_1_v0Wen;
  reg          ctrlVec_1_fpu_wflags;
  reg          ctrlVec_1_vpu_vma;
  reg          ctrlVec_1_vpu_vta;
  reg  [1:0]   ctrlVec_1_vpu_vsew;
  reg  [2:0]   ctrlVec_1_vpu_vlmul;
  reg          ctrlVec_1_vpu_vm;
  reg  [7:0]   ctrlVec_1_vpu_vstart;
  reg  [6:0]   ctrlVec_1_vpu_vuopIdx;
  reg          ctrlVec_1_vpu_isNarrow;
  reg          ctrlVec_1_vpu_isDstMask;
  reg  [8:0]   ctrlVec_2_fuOpType;
  reg          ctrlVec_2_robIdx_flag;
  reg  [7:0]   ctrlVec_2_robIdx_value;
  reg  [7:0]   ctrlVec_2_pdest;
  reg          ctrlVec_2_vecWen;
  reg          ctrlVec_2_v0Wen;
  reg          ctrlVec_2_fpu_wflags;
  reg          ctrlVec_2_vpu_vma;
  reg          ctrlVec_2_vpu_vta;
  reg  [1:0]   ctrlVec_2_vpu_vsew;
  reg  [2:0]   ctrlVec_2_vpu_vlmul;
  reg          ctrlVec_2_vpu_vm;
  reg  [7:0]   ctrlVec_2_vpu_vstart;
  reg  [6:0]   ctrlVec_2_vpu_vuopIdx;
  reg          ctrlVec_2_vpu_isNarrow;
  reg          ctrlVec_2_vpu_isDstMask;
  reg  [8:0]   ctrlVec_3_fuOpType;
  reg          ctrlVec_3_robIdx_flag;
  reg  [7:0]   ctrlVec_3_robIdx_value;
  reg  [7:0]   ctrlVec_3_pdest;
  reg          ctrlVec_3_vecWen;
  reg          ctrlVec_3_v0Wen;
  reg          ctrlVec_3_fpu_wflags;
  reg          ctrlVec_3_vpu_vma;
  reg          ctrlVec_3_vpu_vta;
  reg  [1:0]   ctrlVec_3_vpu_vsew;
  reg  [2:0]   ctrlVec_3_vpu_vlmul;
  reg          ctrlVec_3_vpu_vm;
  reg  [7:0]   ctrlVec_3_vpu_vstart;
  reg  [6:0]   ctrlVec_3_vpu_vuopIdx;
  reg          ctrlVec_3_vpu_isNarrow;
  reg          ctrlVec_3_vpu_isDstMask;
  reg  [7:0]   dataVec_1_src_4;
  reg  [127:0] dataVec_1_src_3;
  reg  [127:0] dataVec_1_src_2;
  reg  [7:0]   dataVec_2_src_4;
  reg  [127:0] dataVec_2_src_3;
  reg  [127:0] dataVec_2_src_2;
  reg  [7:0]   dataVec_3_src_4;
  reg  [127:0] dataVec_3_src_3;
  reg  [127:0] dataVec_3_src_2;
  wire [8:0]   _fixflushVec_flushItself_T_2 =
    {io_flush_bits_robIdx_flag, io_flush_bits_robIdx_value};
  wire         _GEN =
    io_in_valid
    & ~(io_in_valid & io_flush_valid
        & (io_flush_bits_level
           & {io_in_bits_ctrl_robIdx_flag,
              io_in_bits_ctrl_robIdx_value} == _fixflushVec_flushItself_T_2
           | io_in_bits_ctrl_robIdx_flag ^ io_flush_bits_robIdx_flag
           ^ io_in_bits_ctrl_robIdx_value > io_flush_bits_robIdx_value));
  wire         _GEN_0 =
    validVec_1
    & ~(validVec_1 & io_flush_valid
        & (io_flush_bits_level
           & {ctrlVec_1_robIdx_flag,
              ctrlVec_1_robIdx_value} == _fixflushVec_flushItself_T_2
           | ctrlVec_1_robIdx_flag ^ io_flush_bits_robIdx_flag
           ^ ctrlVec_1_robIdx_value > io_flush_bits_robIdx_value));
  wire         _GEN_1 =
    validVec_2
    & ~(validVec_2 & io_flush_valid
        & (io_flush_bits_level
           & {ctrlVec_2_robIdx_flag,
              ctrlVec_2_robIdx_value} == _fixflushVec_flushItself_T_2
           | ctrlVec_2_robIdx_flag ^ io_flush_bits_robIdx_flag
           ^ ctrlVec_2_robIdx_value > io_flush_bits_robIdx_value));
  wire [1:0]   _vfmas_1_io_fp_format_T = 2'(io_in_bits_ctrl_vpu_vsew + 2'h1);
  wire [1:0]   outEew =
    ctrlVec_3_fuOpType[4] ? 2'(ctrlVec_3_vpu_vsew + 2'h1) : ctrlVec_3_vpu_vsew;
  wire [4:0]   vlMax = 5'h10 >> outEew;
  wire [2:0]   outVlmulFix =
    ctrlVec_3_fuOpType[4] ? 3'(ctrlVec_3_vpu_vlmul + 3'h1) : ctrlVec_3_vpu_vlmul;
  wire [4:0]   vlMaxThisUop =
    ctrlVec_3_vpu_vlmul[2]
      ? vlMax >> (outVlmulFix[2] ? 2'(~(outVlmulFix[1:0]) + 2'h1) : outVlmulFix[1:0])
      : vlMax;
  wire [7:0]   _GEN_2 = {5'h0, ctrlVec_3_vpu_vuopIdx[2:0]};
  wire [7:0]   _GEN_3 = {3'h0, vlMaxThisUop};
  wire [7:0]   _vlSetThisUop_T_2 = 8'(_GEN_2 * _GEN_3);
  wire [7:0]   vlSetThisUop =
    dataVec_3_src_4 > _vlSetThisUop_T_2 ? 8'(dataVec_3_src_4 - _vlSetThisUop_T_2) : 8'h0;
  wire [7:0]   vlMaskRShift =
    8'hFF
    >> 4'(4'h8 - {1'h0, vlSetThisUop < _GEN_3 ? vlSetThisUop[2:0] : vlMaxThisUop[2:0]});
  wire [127:0] maskToMgu =
    ctrlVec_3_vpu_vm ? 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF : dataVec_3_src_3;
  wire [127:0] _outSrcMaskRShift_T_2 = maskToMgu >> 8'(_GEN_2 * {3'h0, vlMax});
  wire         _vlMaskEn_T = outEew == 2'h1;
  wire         _vlMaskEn_T_1 = outEew == 2'h2;
  wire [7:0]   _GEN_4 =
    ((_vlMaskEn_T ? _outSrcMaskRShift_T_2[7:0] : 8'h0)
     | (_vlMaskEn_T_1
          ? {2'h0, _outSrcMaskRShift_T_2[3:2], 2'h0, _outSrcMaskRShift_T_2[1:0]}
          : 8'h0)
     | ((&outEew)
          ? {3'h0, _outSrcMaskRShift_T_2[1], 3'h0, _outSrcMaskRShift_T_2[0]}
          : 8'h0))
    & ((_vlMaskEn_T ? vlMaskRShift : 8'h0)
       | (_vlMaskEn_T_1 ? {2'h0, vlMaskRShift[3:2], 2'h0, vlMaskRShift[1:0]} : 8'h0)
       | ((&outEew) ? {3'h0, vlMaskRShift[1], 3'h0, vlMaskRShift[0]} : 8'h0));
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      validVec_1 <= 1'h0;
      validVec_2 <= 1'h0;
      validVec_3 <= 1'h0;
    end
    else begin
      validVec_1 <= _GEN & io_in_valid;
      validVec_2 <= _GEN_0 & validVec_1;
      validVec_3 <= _GEN_1 & validVec_2;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (_GEN) begin
      ctrlVec_1_fuOpType <= io_in_bits_ctrl_fuOpType;
      ctrlVec_1_robIdx_flag <= io_in_bits_ctrl_robIdx_flag;
      ctrlVec_1_robIdx_value <= io_in_bits_ctrl_robIdx_value;
      ctrlVec_1_pdest <= io_in_bits_ctrl_pdest;
      ctrlVec_1_vecWen <= io_in_bits_ctrl_vecWen;
      ctrlVec_1_v0Wen <= io_in_bits_ctrl_v0Wen;
      ctrlVec_1_fpu_wflags <= io_in_bits_ctrl_fpu_wflags;
      ctrlVec_1_vpu_vma <= io_in_bits_ctrl_vpu_vma;
      ctrlVec_1_vpu_vta <= io_in_bits_ctrl_vpu_vta;
      ctrlVec_1_vpu_vsew <= io_in_bits_ctrl_vpu_vsew;
      ctrlVec_1_vpu_vlmul <= io_in_bits_ctrl_vpu_vlmul;
      ctrlVec_1_vpu_vm <= io_in_bits_ctrl_vpu_vm;
      ctrlVec_1_vpu_vstart <= io_in_bits_ctrl_vpu_vstart;
      ctrlVec_1_vpu_vuopIdx <= io_in_bits_ctrl_vpu_vuopIdx;
      ctrlVec_1_vpu_isNarrow <= io_in_bits_ctrl_vpu_isNarrow;
      ctrlVec_1_vpu_isDstMask <= io_in_bits_ctrl_vpu_isDstMask;
      dataVec_1_src_4 <= io_in_bits_data_src_4;
      dataVec_1_src_3 <= io_in_bits_data_src_3;
      dataVec_1_src_2 <= io_in_bits_data_src_2;
    end
    if (_GEN_0) begin
      ctrlVec_2_fuOpType <= ctrlVec_1_fuOpType;
      ctrlVec_2_robIdx_flag <= ctrlVec_1_robIdx_flag;
      ctrlVec_2_robIdx_value <= ctrlVec_1_robIdx_value;
      ctrlVec_2_pdest <= ctrlVec_1_pdest;
      ctrlVec_2_vecWen <= ctrlVec_1_vecWen;
      ctrlVec_2_v0Wen <= ctrlVec_1_v0Wen;
      ctrlVec_2_fpu_wflags <= ctrlVec_1_fpu_wflags;
      ctrlVec_2_vpu_vma <= ctrlVec_1_vpu_vma;
      ctrlVec_2_vpu_vta <= ctrlVec_1_vpu_vta;
      ctrlVec_2_vpu_vsew <= ctrlVec_1_vpu_vsew;
      ctrlVec_2_vpu_vlmul <= ctrlVec_1_vpu_vlmul;
      ctrlVec_2_vpu_vm <= ctrlVec_1_vpu_vm;
      ctrlVec_2_vpu_vstart <= ctrlVec_1_vpu_vstart;
      ctrlVec_2_vpu_vuopIdx <= ctrlVec_1_vpu_vuopIdx;
      ctrlVec_2_vpu_isNarrow <= ctrlVec_1_vpu_isNarrow;
      ctrlVec_2_vpu_isDstMask <= ctrlVec_1_vpu_isDstMask;
      dataVec_2_src_4 <= dataVec_1_src_4;
      dataVec_2_src_3 <= dataVec_1_src_3;
      dataVec_2_src_2 <= dataVec_1_src_2;
    end
    if (_GEN_1) begin
      ctrlVec_3_fuOpType <= ctrlVec_2_fuOpType;
      ctrlVec_3_robIdx_flag <= ctrlVec_2_robIdx_flag;
      ctrlVec_3_robIdx_value <= ctrlVec_2_robIdx_value;
      ctrlVec_3_pdest <= ctrlVec_2_pdest;
      ctrlVec_3_vecWen <= ctrlVec_2_vecWen;
      ctrlVec_3_v0Wen <= ctrlVec_2_v0Wen;
      ctrlVec_3_fpu_wflags <= ctrlVec_2_fpu_wflags;
      ctrlVec_3_vpu_vma <= ctrlVec_2_vpu_vma;
      ctrlVec_3_vpu_vta <= ctrlVec_2_vpu_vta;
      ctrlVec_3_vpu_vsew <= ctrlVec_2_vpu_vsew;
      ctrlVec_3_vpu_vlmul <= ctrlVec_2_vpu_vlmul;
      ctrlVec_3_vpu_vm <= ctrlVec_2_vpu_vm;
      ctrlVec_3_vpu_vstart <= ctrlVec_2_vpu_vstart;
      ctrlVec_3_vpu_vuopIdx <= ctrlVec_2_vpu_vuopIdx;
      ctrlVec_3_vpu_isNarrow <= ctrlVec_2_vpu_isNarrow;
      ctrlVec_3_vpu_isDstMask <= ctrlVec_2_vpu_isDstMask;
      dataVec_3_src_4 <= dataVec_2_src_4;
      dataVec_3_src_3 <= dataVec_2_src_3;
      dataVec_3_src_2 <= dataVec_2_src_2;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:71];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [6:0] i = 7'h0; i < 7'h48; i += 7'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        validVec_1 = _RANDOM[7'h0][0];
        validVec_2 = _RANDOM[7'h0][1];
        validVec_3 = _RANDOM[7'h0][2];
        ctrlVec_1_fuOpType = _RANDOM[7'h0][11:3];
        ctrlVec_1_robIdx_flag = _RANDOM[7'h0][12];
        ctrlVec_1_robIdx_value = _RANDOM[7'h0][20:13];
        ctrlVec_1_pdest = _RANDOM[7'h0][28:21];
        ctrlVec_1_vecWen = _RANDOM[7'h0][29];
        ctrlVec_1_v0Wen = _RANDOM[7'h0][30];
        ctrlVec_1_fpu_wflags = _RANDOM[7'h1][3];
        ctrlVec_1_vpu_vma = _RANDOM[7'h1][19];
        ctrlVec_1_vpu_vta = _RANDOM[7'h1][20];
        ctrlVec_1_vpu_vsew = _RANDOM[7'h1][22:21];
        ctrlVec_1_vpu_vlmul = _RANDOM[7'h1][25:23];
        ctrlVec_1_vpu_vm = _RANDOM[7'h2][2];
        ctrlVec_1_vpu_vstart = _RANDOM[7'h2][10:3];
        ctrlVec_1_vpu_vuopIdx = _RANDOM[7'h2][29:23];
        ctrlVec_1_vpu_isNarrow = _RANDOM[7'h7][14];
        ctrlVec_1_vpu_isDstMask = _RANDOM[7'h7][15];
        ctrlVec_2_fuOpType = _RANDOM[7'h7][28:20];
        ctrlVec_2_robIdx_flag = _RANDOM[7'h7][29];
        ctrlVec_2_robIdx_value = {_RANDOM[7'h7][31:30], _RANDOM[7'h8][5:0]};
        ctrlVec_2_pdest = _RANDOM[7'h8][13:6];
        ctrlVec_2_vecWen = _RANDOM[7'h8][14];
        ctrlVec_2_v0Wen = _RANDOM[7'h8][15];
        ctrlVec_2_fpu_wflags = _RANDOM[7'h8][20];
        ctrlVec_2_vpu_vma = _RANDOM[7'h9][4];
        ctrlVec_2_vpu_vta = _RANDOM[7'h9][5];
        ctrlVec_2_vpu_vsew = _RANDOM[7'h9][7:6];
        ctrlVec_2_vpu_vlmul = _RANDOM[7'h9][10:8];
        ctrlVec_2_vpu_vm = _RANDOM[7'h9][19];
        ctrlVec_2_vpu_vstart = _RANDOM[7'h9][27:20];
        ctrlVec_2_vpu_vuopIdx = _RANDOM[7'hA][14:8];
        ctrlVec_2_vpu_isNarrow = _RANDOM[7'hE][31];
        ctrlVec_2_vpu_isDstMask = _RANDOM[7'hF][0];
        ctrlVec_3_fuOpType = _RANDOM[7'hF][13:5];
        ctrlVec_3_robIdx_flag = _RANDOM[7'hF][14];
        ctrlVec_3_robIdx_value = _RANDOM[7'hF][22:15];
        ctrlVec_3_pdest = _RANDOM[7'hF][30:23];
        ctrlVec_3_vecWen = _RANDOM[7'hF][31];
        ctrlVec_3_v0Wen = _RANDOM[7'h10][0];
        ctrlVec_3_fpu_wflags = _RANDOM[7'h10][5];
        ctrlVec_3_vpu_vma = _RANDOM[7'h10][21];
        ctrlVec_3_vpu_vta = _RANDOM[7'h10][22];
        ctrlVec_3_vpu_vsew = _RANDOM[7'h10][24:23];
        ctrlVec_3_vpu_vlmul = _RANDOM[7'h10][27:25];
        ctrlVec_3_vpu_vm = _RANDOM[7'h11][4];
        ctrlVec_3_vpu_vstart = _RANDOM[7'h11][12:5];
        ctrlVec_3_vpu_vuopIdx = _RANDOM[7'h11][31:25];
        ctrlVec_3_vpu_isNarrow = _RANDOM[7'h16][16];
        ctrlVec_3_vpu_isDstMask = _RANDOM[7'h16][17];
        dataVec_1_src_4 = _RANDOM[7'h16][29:22];
        dataVec_1_src_3 =
          {_RANDOM[7'h16][31:30],
           _RANDOM[7'h17],
           _RANDOM[7'h18],
           _RANDOM[7'h19],
           _RANDOM[7'h1A][29:0]};
        dataVec_1_src_2 =
          {_RANDOM[7'h1A][31:30],
           _RANDOM[7'h1B],
           _RANDOM[7'h1C],
           _RANDOM[7'h1D],
           _RANDOM[7'h1E][29:0]};
        dataVec_2_src_4 = {_RANDOM[7'h2A][31:30], _RANDOM[7'h2B][5:0]};
        dataVec_2_src_3 =
          {_RANDOM[7'h2B][31:6],
           _RANDOM[7'h2C],
           _RANDOM[7'h2D],
           _RANDOM[7'h2E],
           _RANDOM[7'h2F][5:0]};
        dataVec_2_src_2 =
          {_RANDOM[7'h2F][31:6],
           _RANDOM[7'h30],
           _RANDOM[7'h31],
           _RANDOM[7'h32],
           _RANDOM[7'h33][5:0]};
        dataVec_3_src_4 = _RANDOM[7'h3F][13:6];
        dataVec_3_src_3 =
          {_RANDOM[7'h3F][31:14],
           _RANDOM[7'h40],
           _RANDOM[7'h41],
           _RANDOM[7'h42],
           _RANDOM[7'h43][13:0]};
        dataVec_3_src_2 =
          {_RANDOM[7'h43][31:14],
           _RANDOM[7'h44],
           _RANDOM[7'h45],
           _RANDOM[7'h46],
           _RANDOM[7'h47][13:0]};
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        validVec_1 = 1'h0;
        validVec_2 = 1'h0;
        validVec_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  VectorFloatFMA vfmas_0 (
    .clock           (clock),
    .reset           (reset),
    .io_fire         (io_in_valid),
    .io_fp_a         (_vs2Split_io_outVec64b_0),
    .io_fp_b         (_vs1Split_io_outVec64b_0),
    .io_fp_c         (_oldVdSplit_io_outVec64b_0),
    .io_uop_idx      (io_in_bits_ctrl_vpu_vuopIdx[0]),
    .io_widen_a      ({_vs2Split_io_outVec32b_2, _vs2Split_io_outVec32b_0}),
    .io_widen_b      ({_vs1Split_io_outVec32b_2, _vs1Split_io_outVec32b_0}),
    .io_round_mode   (io_frm),
    .io_fp_format
      (io_in_bits_ctrl_fuOpType[4] ? _vfmas_1_io_fp_format_T : io_in_bits_ctrl_vpu_vsew),
    .io_op_code      (io_in_bits_ctrl_fuOpType[3:0]),
    .io_res_widening (io_in_bits_ctrl_fuOpType[4]),
    .io_fp_result    (_vfmas_0_io_fp_result),
    .io_fflags       (_vfmas_0_io_fflags)
  );
  VectorFloatFMA vfmas_1 (
    .clock           (clock),
    .reset           (reset),
    .io_fire         (io_in_valid),
    .io_fp_a         (_vs2Split_io_outVec64b_1),
    .io_fp_b         (_vs1Split_io_outVec64b_1),
    .io_fp_c         (_oldVdSplit_io_outVec64b_1),
    .io_uop_idx      (io_in_bits_ctrl_vpu_vuopIdx[0]),
    .io_widen_a      ({_vs2Split_io_outVec32b_3, _vs2Split_io_outVec32b_1}),
    .io_widen_b      ({_vs1Split_io_outVec32b_3, _vs1Split_io_outVec32b_1}),
    .io_round_mode   (io_frm),
    .io_fp_format
      (io_in_bits_ctrl_fuOpType[4] ? _vfmas_1_io_fp_format_T : io_in_bits_ctrl_vpu_vsew),
    .io_op_code      (io_in_bits_ctrl_fuOpType[3:0]),
    .io_res_widening (io_in_bits_ctrl_fuOpType[4]),
    .io_fp_result    (_vfmas_1_io_fp_result),
    .io_fflags       (_vfmas_1_io_fflags)
  );
  VecDataSplitModule vs2Split (
    .io_inVecData   (io_in_bits_data_src_1),
    .io_outVec8b_0  (/* unused */),
    .io_outVec8b_1  (/* unused */),
    .io_outVec8b_2  (/* unused */),
    .io_outVec8b_3  (/* unused */),
    .io_outVec8b_4  (/* unused */),
    .io_outVec8b_5  (/* unused */),
    .io_outVec8b_6  (/* unused */),
    .io_outVec8b_7  (/* unused */),
    .io_outVec8b_8  (/* unused */),
    .io_outVec8b_9  (/* unused */),
    .io_outVec8b_10 (/* unused */),
    .io_outVec8b_11 (/* unused */),
    .io_outVec8b_12 (/* unused */),
    .io_outVec8b_13 (/* unused */),
    .io_outVec8b_14 (/* unused */),
    .io_outVec8b_15 (/* unused */),
    .io_outVec16b_0 (/* unused */),
    .io_outVec16b_1 (/* unused */),
    .io_outVec16b_2 (/* unused */),
    .io_outVec16b_3 (/* unused */),
    .io_outVec16b_4 (/* unused */),
    .io_outVec16b_5 (/* unused */),
    .io_outVec16b_6 (/* unused */),
    .io_outVec16b_7 (/* unused */),
    .io_outVec32b_0 (_vs2Split_io_outVec32b_0),
    .io_outVec32b_1 (_vs2Split_io_outVec32b_1),
    .io_outVec32b_2 (_vs2Split_io_outVec32b_2),
    .io_outVec32b_3 (_vs2Split_io_outVec32b_3),
    .io_outVec64b_0 (_vs2Split_io_outVec64b_0),
    .io_outVec64b_1 (_vs2Split_io_outVec64b_1)
  );
  VecDataSplitModule vs1Split (
    .io_inVecData   (io_in_bits_data_src_0),
    .io_outVec8b_0  (/* unused */),
    .io_outVec8b_1  (/* unused */),
    .io_outVec8b_2  (/* unused */),
    .io_outVec8b_3  (/* unused */),
    .io_outVec8b_4  (/* unused */),
    .io_outVec8b_5  (/* unused */),
    .io_outVec8b_6  (/* unused */),
    .io_outVec8b_7  (/* unused */),
    .io_outVec8b_8  (/* unused */),
    .io_outVec8b_9  (/* unused */),
    .io_outVec8b_10 (/* unused */),
    .io_outVec8b_11 (/* unused */),
    .io_outVec8b_12 (/* unused */),
    .io_outVec8b_13 (/* unused */),
    .io_outVec8b_14 (/* unused */),
    .io_outVec8b_15 (/* unused */),
    .io_outVec16b_0 (/* unused */),
    .io_outVec16b_1 (/* unused */),
    .io_outVec16b_2 (/* unused */),
    .io_outVec16b_3 (/* unused */),
    .io_outVec16b_4 (/* unused */),
    .io_outVec16b_5 (/* unused */),
    .io_outVec16b_6 (/* unused */),
    .io_outVec16b_7 (/* unused */),
    .io_outVec32b_0 (_vs1Split_io_outVec32b_0),
    .io_outVec32b_1 (_vs1Split_io_outVec32b_1),
    .io_outVec32b_2 (_vs1Split_io_outVec32b_2),
    .io_outVec32b_3 (_vs1Split_io_outVec32b_3),
    .io_outVec64b_0 (_vs1Split_io_outVec64b_0),
    .io_outVec64b_1 (_vs1Split_io_outVec64b_1)
  );
  VecDataSplitModule oldVdSplit (
    .io_inVecData   (io_in_bits_data_src_2),
    .io_outVec8b_0  (/* unused */),
    .io_outVec8b_1  (/* unused */),
    .io_outVec8b_2  (/* unused */),
    .io_outVec8b_3  (/* unused */),
    .io_outVec8b_4  (/* unused */),
    .io_outVec8b_5  (/* unused */),
    .io_outVec8b_6  (/* unused */),
    .io_outVec8b_7  (/* unused */),
    .io_outVec8b_8  (/* unused */),
    .io_outVec8b_9  (/* unused */),
    .io_outVec8b_10 (/* unused */),
    .io_outVec8b_11 (/* unused */),
    .io_outVec8b_12 (/* unused */),
    .io_outVec8b_13 (/* unused */),
    .io_outVec8b_14 (/* unused */),
    .io_outVec8b_15 (/* unused */),
    .io_outVec16b_0 (/* unused */),
    .io_outVec16b_1 (/* unused */),
    .io_outVec16b_2 (/* unused */),
    .io_outVec16b_3 (/* unused */),
    .io_outVec16b_4 (/* unused */),
    .io_outVec16b_5 (/* unused */),
    .io_outVec16b_6 (/* unused */),
    .io_outVec16b_7 (/* unused */),
    .io_outVec32b_0 (/* unused */),
    .io_outVec32b_1 (/* unused */),
    .io_outVec32b_2 (/* unused */),
    .io_outVec32b_3 (/* unused */),
    .io_outVec64b_0 (_oldVdSplit_io_outVec64b_0),
    .io_outVec64b_1 (_oldVdSplit_io_outVec64b_1)
  );
  Mgu mgu (
    .io_in_vd           ({_vfmas_1_io_fp_result, _vfmas_0_io_fp_result}),
    .io_in_oldVd        (dataVec_3_src_2),
    .io_in_mask         (maskToMgu),
    .io_in_info_ta      (ctrlVec_3_vpu_vta),
    .io_in_info_ma      (ctrlVec_3_vpu_vma),
    .io_in_info_vl      (dataVec_3_src_4),
    .io_in_info_vstart  (ctrlVec_3_vpu_vstart),
    .io_in_info_eew     (outEew),
    .io_in_info_vdIdx   (ctrlVec_3_vpu_vuopIdx[2:0]),
    .io_in_info_narrow  (ctrlVec_3_vpu_isNarrow),
    .io_in_info_dstMask (ctrlVec_3_vpu_isDstMask),
    .io_out_vd          (io_out_bits_res_data),
    .io_out_active      (/* unused */)
  );
  assign io_out_valid = validVec_3;
  assign io_out_bits_ctrl_robIdx_flag = ctrlVec_3_robIdx_flag;
  assign io_out_bits_ctrl_robIdx_value = ctrlVec_3_robIdx_value;
  assign io_out_bits_ctrl_pdest = ctrlVec_3_pdest;
  assign io_out_bits_ctrl_vecWen = ctrlVec_3_vecWen;
  assign io_out_bits_ctrl_v0Wen = ctrlVec_3_v0Wen;
  assign io_out_bits_ctrl_fpu_wflags = ctrlVec_3_fpu_wflags;
  assign io_out_bits_res_fflags =
    (_GEN_4[0] ? _vfmas_0_io_fflags[4:0] : 5'h0)
    | (_GEN_4[1] ? _vfmas_0_io_fflags[9:5] : 5'h0)
    | (_GEN_4[2] ? _vfmas_0_io_fflags[14:10] : 5'h0)
    | (_GEN_4[3] ? _vfmas_0_io_fflags[19:15] : 5'h0)
    | (_GEN_4[4] ? _vfmas_1_io_fflags[4:0] : 5'h0)
    | (_GEN_4[5] ? _vfmas_1_io_fflags[9:5] : 5'h0)
    | (_GEN_4[6] ? _vfmas_1_io_fflags[14:10] : 5'h0)
    | (_GEN_4[7] ? _vfmas_1_io_fflags[19:15] : 5'h0);
endmodule

