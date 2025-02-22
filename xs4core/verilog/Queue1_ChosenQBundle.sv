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

module Queue1_ChosenQBundle(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_bits_valid,
  input         io_enq_bits_bits_rdy,
  input  [2:0]  io_enq_bits_bits_task_channel,
  input  [8:0]  io_enq_bits_bits_task_set,
  input  [18:0] io_enq_bits_bits_task_tag,
  input  [5:0]  io_enq_bits_bits_task_off,
  input         io_enq_bits_bits_task_alias,
  input  [32:0] io_enq_bits_bits_task_vaddr,
  input         io_enq_bits_bits_task_isKeyword,
  input  [2:0]  io_enq_bits_bits_task_opcode,
  input  [2:0]  io_enq_bits_bits_task_param,
  input  [2:0]  io_enq_bits_bits_task_size,
  input  [6:0]  io_enq_bits_bits_task_sourceId,
  input         io_enq_bits_bits_task_fromL2pft,
  input         io_enq_bits_bits_task_needHint,
  input  [3:0]  io_enq_bits_bits_task_reqSource,
  input  [3:0]  io_enq_bits_bits_waitMP,
  input  [15:0] io_enq_bits_bits_waitMS,
  input  [1:0]  io_enq_bits_id,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_bits_task_channel,
  output [2:0]  io_deq_bits_bits_task_txChannel,
  output [8:0]  io_deq_bits_bits_task_set,
  output [18:0] io_deq_bits_bits_task_tag,
  output [5:0]  io_deq_bits_bits_task_off,
  output        io_deq_bits_bits_task_alias,
  output [32:0] io_deq_bits_bits_task_vaddr,
  output        io_deq_bits_bits_task_isKeyword,
  output [2:0]  io_deq_bits_bits_task_opcode,
  output [2:0]  io_deq_bits_bits_task_param,
  output [2:0]  io_deq_bits_bits_task_size,
  output [6:0]  io_deq_bits_bits_task_sourceId,
  output [1:0]  io_deq_bits_bits_task_bufIdx,
  output        io_deq_bits_bits_task_needProbeAckData,
  output        io_deq_bits_bits_task_mshrTask,
  output [7:0]  io_deq_bits_bits_task_mshrId,
  output        io_deq_bits_bits_task_aliasTask,
  output        io_deq_bits_bits_task_useProbeData,
  output        io_deq_bits_bits_task_mshrRetry,
  output        io_deq_bits_bits_task_fromL2pft,
  output        io_deq_bits_bits_task_needHint,
  output        io_deq_bits_bits_task_dirty,
  output [2:0]  io_deq_bits_bits_task_way,
  output        io_deq_bits_bits_task_meta_dirty,
  output [1:0]  io_deq_bits_bits_task_meta_state,
  output        io_deq_bits_bits_task_meta_clients,
  output        io_deq_bits_bits_task_meta_alias,
  output        io_deq_bits_bits_task_meta_prefetch,
  output [2:0]  io_deq_bits_bits_task_meta_prefetchSrc,
  output        io_deq_bits_bits_task_meta_accessed,
  output        io_deq_bits_bits_task_metaWen,
  output        io_deq_bits_bits_task_tagWen,
  output        io_deq_bits_bits_task_dsWen,
  output        io_deq_bits_bits_task_replTask,
  output [3:0]  io_deq_bits_bits_task_reqSource,
  output        io_deq_bits_bits_task_mergeA,
  output [5:0]  io_deq_bits_bits_task_aMergeTask_off,
  output        io_deq_bits_bits_task_aMergeTask_alias,
  output [32:0] io_deq_bits_bits_task_aMergeTask_vaddr,
  output        io_deq_bits_bits_task_aMergeTask_isKeyword,
  output [2:0]  io_deq_bits_bits_task_aMergeTask_opcode,
  output [2:0]  io_deq_bits_bits_task_aMergeTask_param,
  output [6:0]  io_deq_bits_bits_task_aMergeTask_sourceId,
  output        io_deq_bits_bits_task_aMergeTask_meta_dirty,
  output [1:0]  io_deq_bits_bits_task_aMergeTask_meta_state,
  output        io_deq_bits_bits_task_aMergeTask_meta_clients,
  output        io_deq_bits_bits_task_aMergeTask_meta_alias,
  output        io_deq_bits_bits_task_aMergeTask_meta_prefetch,
  output [2:0]  io_deq_bits_bits_task_aMergeTask_meta_prefetchSrc,
  output        io_deq_bits_bits_task_aMergeTask_meta_accessed,
  output        io_deq_bits_bits_task_snpHitRelease,
  output        io_deq_bits_bits_task_snpHitReleaseWithData,
  output [7:0]  io_deq_bits_bits_task_snpHitReleaseIdx,
  output [1:0]  io_deq_bits_id
);

  wire         io_enq_ready_0;
  reg  [236:0] ram;
  reg          full;
  wire         do_enq = io_enq_ready_0 & io_enq_valid;
  assign io_enq_ready_0 = io_deq_ready | ~full;
  always @(posedge clock) begin
    if (do_enq)
      ram <=
        {io_enq_bits_id,
         io_enq_bits_bits_waitMS,
         io_enq_bits_bits_waitMP,
         75'h0,
         io_enq_bits_bits_task_reqSource,
         26'h0,
         io_enq_bits_bits_task_needHint,
         io_enq_bits_bits_task_fromL2pft,
         15'h0,
         io_enq_bits_bits_task_sourceId,
         io_enq_bits_bits_task_size,
         io_enq_bits_bits_task_param,
         io_enq_bits_bits_task_opcode,
         io_enq_bits_bits_task_isKeyword,
         io_enq_bits_bits_task_vaddr,
         io_enq_bits_bits_task_alias,
         io_enq_bits_bits_task_off,
         io_enq_bits_bits_task_tag,
         io_enq_bits_bits_task_set,
         3'h0,
         io_enq_bits_bits_task_channel,
         io_enq_bits_bits_rdy,
         io_enq_bits_bits_valid};
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:7];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [3:0] i = 4'h0; i < 4'h8; i += 4'h1) begin
          _RANDOM[i[2:0]] = `RANDOM;
        end
        ram =
          {_RANDOM[3'h0][31:1],
           _RANDOM[3'h1],
           _RANDOM[3'h2],
           _RANDOM[3'h3],
           _RANDOM[3'h4],
           _RANDOM[3'h5],
           _RANDOM[3'h6],
           _RANDOM[3'h7][13:0]};
        full = _RANDOM[3'h0][0];
      `endif // RANDOMIZE_REG_INIT
      if (reset)
        full = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_enq_ready = io_enq_ready_0;
  assign io_deq_valid = full;
  assign io_deq_bits_bits_task_channel = ram[4:2];
  assign io_deq_bits_bits_task_txChannel = ram[7:5];
  assign io_deq_bits_bits_task_set = ram[16:8];
  assign io_deq_bits_bits_task_tag = ram[35:17];
  assign io_deq_bits_bits_task_off = ram[41:36];
  assign io_deq_bits_bits_task_alias = ram[42];
  assign io_deq_bits_bits_task_vaddr = ram[75:43];
  assign io_deq_bits_bits_task_isKeyword = ram[76];
  assign io_deq_bits_bits_task_opcode = ram[79:77];
  assign io_deq_bits_bits_task_param = ram[82:80];
  assign io_deq_bits_bits_task_size = ram[85:83];
  assign io_deq_bits_bits_task_sourceId = ram[92:86];
  assign io_deq_bits_bits_task_bufIdx = ram[94:93];
  assign io_deq_bits_bits_task_needProbeAckData = ram[95];
  assign io_deq_bits_bits_task_mshrTask = ram[96];
  assign io_deq_bits_bits_task_mshrId = ram[104:97];
  assign io_deq_bits_bits_task_aliasTask = ram[105];
  assign io_deq_bits_bits_task_useProbeData = ram[106];
  assign io_deq_bits_bits_task_mshrRetry = ram[107];
  assign io_deq_bits_bits_task_fromL2pft = ram[108];
  assign io_deq_bits_bits_task_needHint = ram[109];
  assign io_deq_bits_bits_task_dirty = ram[110];
  assign io_deq_bits_bits_task_way = ram[113:111];
  assign io_deq_bits_bits_task_meta_dirty = ram[114];
  assign io_deq_bits_bits_task_meta_state = ram[116:115];
  assign io_deq_bits_bits_task_meta_clients = ram[117];
  assign io_deq_bits_bits_task_meta_alias = ram[118];
  assign io_deq_bits_bits_task_meta_prefetch = ram[119];
  assign io_deq_bits_bits_task_meta_prefetchSrc = ram[122:120];
  assign io_deq_bits_bits_task_meta_accessed = ram[123];
  assign io_deq_bits_bits_task_metaWen = ram[124];
  assign io_deq_bits_bits_task_tagWen = ram[125];
  assign io_deq_bits_bits_task_dsWen = ram[126];
  assign io_deq_bits_bits_task_replTask = ram[135];
  assign io_deq_bits_bits_task_reqSource = ram[139:136];
  assign io_deq_bits_bits_task_mergeA = ram[140];
  assign io_deq_bits_bits_task_aMergeTask_off = ram[146:141];
  assign io_deq_bits_bits_task_aMergeTask_alias = ram[147];
  assign io_deq_bits_bits_task_aMergeTask_vaddr = ram[180:148];
  assign io_deq_bits_bits_task_aMergeTask_isKeyword = ram[181];
  assign io_deq_bits_bits_task_aMergeTask_opcode = ram[184:182];
  assign io_deq_bits_bits_task_aMergeTask_param = ram[187:185];
  assign io_deq_bits_bits_task_aMergeTask_sourceId = ram[194:188];
  assign io_deq_bits_bits_task_aMergeTask_meta_dirty = ram[195];
  assign io_deq_bits_bits_task_aMergeTask_meta_state = ram[197:196];
  assign io_deq_bits_bits_task_aMergeTask_meta_clients = ram[198];
  assign io_deq_bits_bits_task_aMergeTask_meta_alias = ram[199];
  assign io_deq_bits_bits_task_aMergeTask_meta_prefetch = ram[200];
  assign io_deq_bits_bits_task_aMergeTask_meta_prefetchSrc = ram[203:201];
  assign io_deq_bits_bits_task_aMergeTask_meta_accessed = ram[204];
  assign io_deq_bits_bits_task_snpHitRelease = ram[205];
  assign io_deq_bits_bits_task_snpHitReleaseWithData = ram[206];
  assign io_deq_bits_bits_task_snpHitReleaseIdx = ram[214:207];
  assign io_deq_bits_id = ram[236:235];
endmodule

