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

module DretEventModule(
  input         valid,
  input         in_dcsr_V,
  input  [1:0]  in_dcsr_PRV,
  input  [62:0] in_dpc_epc,
  input         in_mstatus_MPRV,
  output        out_privState_valid,
  output [1:0]  out_privState_bits_PRVM,
  output        out_privState_bits_V,
  output        out_dcsr_valid,
  output [3:0]  out_dcsr_bits_DEBUGVER,
  output        out_dcsr_bits_EBREAKVS,
  output        out_dcsr_bits_EBREAKVU,
  output        out_dcsr_bits_EBREAKM,
  output        out_dcsr_bits_EBREAKS,
  output        out_dcsr_bits_EBREAKU,
  output        out_dcsr_bits_STEPIE,
  output        out_dcsr_bits_STOPCOUNT,
  output        out_dcsr_bits_STOPTIME,
  output [2:0]  out_dcsr_bits_CAUSE,
  output        out_dcsr_bits_V,
  output        out_dcsr_bits_MPRVEN,
  output        out_dcsr_bits_NMIP,
  output        out_dcsr_bits_STEP,
  output [1:0]  out_dcsr_bits_PRV,
  output        out_mstatus_valid,
  output        out_mstatus_bits_SIE,
  output        out_mstatus_bits_MIE,
  output        out_mstatus_bits_SPIE,
  output        out_mstatus_bits_UBE,
  output        out_mstatus_bits_MPIE,
  output        out_mstatus_bits_SPP,
  output [1:0]  out_mstatus_bits_VS,
  output [1:0]  out_mstatus_bits_MPP,
  output [1:0]  out_mstatus_bits_FS,
  output [1:0]  out_mstatus_bits_XS,
  output        out_mstatus_bits_MPRV,
  output        out_mstatus_bits_SUM,
  output        out_mstatus_bits_MXR,
  output        out_mstatus_bits_TVM,
  output        out_mstatus_bits_TW,
  output        out_mstatus_bits_TSR,
  output [1:0]  out_mstatus_bits_UXL,
  output [1:0]  out_mstatus_bits_SXL,
  output        out_mstatus_bits_SBE,
  output        out_mstatus_bits_MBE,
  output        out_mstatus_bits_GVA,
  output        out_mstatus_bits_MPV,
  output        out_mstatus_bits_SD,
  output        out_debugMode_valid,
  output        out_debugMode_bits,
  output        out_debugIntrEnable_valid,
  output        out_debugIntrEnable_bits,
  output        out_targetPc_valid,
  output [40:0] out_targetPc_bits
);

  wire [1:0] _out_privState_bits_PRVM_output = in_dcsr_PRV;
  wire       v_PrvmIsM = &_out_privState_bits_PRVM_output;
  wire       isModeM = v_PrvmIsM;
  assign out_privState_valid = valid;
  assign out_privState_bits_PRVM = _out_privState_bits_PRVM_output;
  assign out_privState_bits_V = in_dcsr_V;
  assign out_dcsr_valid = valid;
  assign out_dcsr_bits_DEBUGVER = 4'h0;
  assign out_dcsr_bits_EBREAKVS = 1'h0;
  assign out_dcsr_bits_EBREAKVU = 1'h0;
  assign out_dcsr_bits_EBREAKM = 1'h0;
  assign out_dcsr_bits_EBREAKS = 1'h0;
  assign out_dcsr_bits_EBREAKU = 1'h0;
  assign out_dcsr_bits_STEPIE = 1'h0;
  assign out_dcsr_bits_STOPCOUNT = 1'h0;
  assign out_dcsr_bits_STOPTIME = 1'h0;
  assign out_dcsr_bits_CAUSE = 3'h0;
  assign out_dcsr_bits_V = 1'h0;
  assign out_dcsr_bits_MPRVEN = 1'h0;
  assign out_dcsr_bits_NMIP = 1'h0;
  assign out_dcsr_bits_STEP = 1'h0;
  assign out_dcsr_bits_PRV = 2'h0;
  assign out_mstatus_valid = valid;
  assign out_mstatus_bits_SIE = 1'h0;
  assign out_mstatus_bits_MIE = 1'h0;
  assign out_mstatus_bits_SPIE = 1'h0;
  assign out_mstatus_bits_UBE = 1'h0;
  assign out_mstatus_bits_MPIE = 1'h0;
  assign out_mstatus_bits_SPP = 1'h0;
  assign out_mstatus_bits_VS = 2'h0;
  assign out_mstatus_bits_MPP = 2'h0;
  assign out_mstatus_bits_FS = 2'h0;
  assign out_mstatus_bits_XS = 2'h0;
  assign out_mstatus_bits_MPRV = isModeM & in_mstatus_MPRV;
  assign out_mstatus_bits_SUM = 1'h0;
  assign out_mstatus_bits_MXR = 1'h0;
  assign out_mstatus_bits_TVM = 1'h0;
  assign out_mstatus_bits_TW = 1'h0;
  assign out_mstatus_bits_TSR = 1'h0;
  assign out_mstatus_bits_UXL = 2'h0;
  assign out_mstatus_bits_SXL = 2'h0;
  assign out_mstatus_bits_SBE = 1'h0;
  assign out_mstatus_bits_MBE = 1'h0;
  assign out_mstatus_bits_GVA = 1'h0;
  assign out_mstatus_bits_MPV = 1'h0;
  assign out_mstatus_bits_SD = 1'h0;
  assign out_debugMode_valid = valid;
  assign out_debugMode_bits = 1'h0;
  assign out_debugIntrEnable_valid = valid;
  assign out_debugIntrEnable_bits = 1'h1;
  assign out_targetPc_valid = valid;
  assign out_targetPc_bits = {in_dpc_epc[39:0], 1'h0};
endmodule

