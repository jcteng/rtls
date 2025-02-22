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

module Prefetcher(
  input         clock,
  input         reset,
  output        io_train_ready,
  input         io_train_valid,
  input  [20:0] io_train_bits_tag,
  input  [8:0]  io_train_bits_set,
  input         io_train_bits_needT,
  input  [6:0]  io_train_bits_source,
  input  [32:0] io_train_bits_vaddr,
  input  [3:0]  io_train_bits_reqsource,
  output        io_tlb_req_req_valid,
  output [44:0] io_tlb_req_req_bits_vaddr,
  output [2:0]  io_tlb_req_req_bits_cmd,
  output        io_tlb_req_req_bits_kill,
  output        io_tlb_req_req_bits_no_translate,
  input         io_tlb_req_resp_valid,
  input  [35:0] io_tlb_req_resp_bits_paddr_0,
  input         io_tlb_req_resp_bits_miss,
  input         io_tlb_req_resp_bits_excp_0_pf_ld,
  input         io_tlb_req_resp_bits_excp_0_pf_st,
  input         io_tlb_req_resp_bits_excp_0_af_ld,
  input         io_tlb_req_resp_bits_excp_0_af_st,
  input         io_tlb_req_pmp_resp_mmio,
  input         io_req_ready,
  output        io_req_valid,
  output [20:0] io_req_bits_tag,
  output [8:0]  io_req_bits_set,
  output [32:0] io_req_bits_vaddr,
  output        io_req_bits_needT,
  output [6:0]  io_req_bits_source,
  output [3:0]  io_req_bits_pfSource,
  input         io_recv_addr_valid,
  input  [63:0] io_recv_addr_bits_addr,
  input  [3:0]  io_recv_addr_bits_pfSource,
  input         tpio_tpmeta_port_req_ready,
  output        tpio_tpmeta_port_req_valid,
  output [5:0]  tpio_tpmeta_port_req_bits_hartid,
  output [31:0] tpio_tpmeta_port_req_bits_set,
  output [3:0]  tpio_tpmeta_port_req_bits_way,
  output        tpio_tpmeta_port_req_bits_wmode,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_0,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_1,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_2,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_3,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_4,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_5,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_6,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_7,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_8,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_9,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_10,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_11,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_12,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_13,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_14,
  output [29:0] tpio_tpmeta_port_req_bits_rawData_15,
  input         tpio_tpmeta_port_resp_valid,
  input  [5:0]  tpio_tpmeta_port_resp_bits_hartid,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_0,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_1,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_2,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_3,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_4,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_5,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_6,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_7,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_8,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_9,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_10,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_11,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_12,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_13,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_14,
  input  [29:0] tpio_tpmeta_port_resp_bits_rawData_15,
  input  [5:0]  hartId,
  input         io_l2_pf_en
);

  wire        _pipe_io_in_ready;
  wire        _pftQueue_io_deq_valid;
  wire [20:0] _pftQueue_io_deq_bits_tag;
  wire [8:0]  _pftQueue_io_deq_bits_set;
  wire [32:0] _pftQueue_io_deq_bits_vaddr;
  wire        _pftQueue_io_deq_bits_needT;
  wire [6:0]  _pftQueue_io_deq_bits_source;
  wire [3:0]  _pftQueue_io_deq_bits_pfSource;
  wire        _pfRcv_io_req_valid;
  wire [20:0] _pfRcv_io_req_bits_tag;
  wire [8:0]  _pfRcv_io_req_bits_set;
  wire [3:0]  _pfRcv_io_req_bits_pfSource;
  wire        _tp_io_req_valid;
  wire [20:0] _tp_io_req_bits_tag;
  wire [8:0]  _tp_io_req_bits_set;
  wire        _vbop_io_req_valid;
  wire [20:0] _vbop_io_req_bits_tag;
  wire [8:0]  _vbop_io_req_bits_set;
  wire [32:0] _vbop_io_req_bits_vaddr;
  wire        _vbop_io_req_bits_needT;
  wire [6:0]  _vbop_io_req_bits_source;
  wire        _pbop_io_req_valid;
  wire [20:0] _pbop_io_req_bits_tag;
  wire [8:0]  _pbop_io_req_bits_set;
  wire [32:0] _pbop_io_req_bits_vaddr;
  wire        _pbop_io_req_bits_needT;
  wire [6:0]  _pbop_io_req_bits_source;
  reg         l2_pf_en_REG;
  reg         l2_pf_en;
  wire        _pbop_io_train_valid_T = io_train_bits_reqsource != 4'h6;
  reg         pfRcv_io_recv_addr_v_last_REG;
  reg  [63:0] pfRcv_io_recv_addr_d_addr;
  reg  [3:0]  pfRcv_io_recv_addr_d_pfSource;
  reg         pfRcv_io_recv_addr_v_last_REG_1;
  reg  [63:0] pfRcv_io_recv_addr_d_1_addr;
  reg  [3:0]  pfRcv_io_recv_addr_d_1_pfSource;
  wire        _pftQueue_io_enq_bits_T = _pfRcv_io_req_valid | _vbop_io_req_valid;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      l2_pf_en_REG <= 1'h1;
      l2_pf_en <= 1'h1;
      pfRcv_io_recv_addr_v_last_REG <= 1'h0;
      pfRcv_io_recv_addr_v_last_REG_1 <= 1'h0;
    end
    else begin
      l2_pf_en_REG <= io_l2_pf_en;
      l2_pf_en <= l2_pf_en_REG;
      pfRcv_io_recv_addr_v_last_REG <= io_recv_addr_valid;
      pfRcv_io_recv_addr_v_last_REG_1 <= pfRcv_io_recv_addr_v_last_REG;
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (io_recv_addr_valid) begin
      pfRcv_io_recv_addr_d_addr <= io_recv_addr_bits_addr;
      pfRcv_io_recv_addr_d_pfSource <= io_recv_addr_bits_pfSource;
    end
    if (pfRcv_io_recv_addr_v_last_REG) begin
      pfRcv_io_recv_addr_d_1_addr <= pfRcv_io_recv_addr_d_addr;
      pfRcv_io_recv_addr_d_1_pfSource <= pfRcv_io_recv_addr_d_pfSource;
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:4];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h5; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        l2_pf_en_REG = _RANDOM[3'h0][0];
        l2_pf_en = _RANDOM[3'h0][1];
        pfRcv_io_recv_addr_v_last_REG = _RANDOM[3'h0][2];
        pfRcv_io_recv_addr_d_addr =
          {_RANDOM[3'h0][31:3], _RANDOM[3'h1], _RANDOM[3'h2][2:0]};
        pfRcv_io_recv_addr_d_pfSource = _RANDOM[3'h2][6:3];
        pfRcv_io_recv_addr_v_last_REG_1 = _RANDOM[3'h2][7];
        pfRcv_io_recv_addr_d_1_addr =
          {_RANDOM[3'h2][31:8], _RANDOM[3'h3], _RANDOM[3'h4][7:0]};
        pfRcv_io_recv_addr_d_1_pfSource = _RANDOM[3'h4][11:8];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        l2_pf_en_REG = 1'h1;
        l2_pf_en = 1'h1;
        pfRcv_io_recv_addr_v_last_REG = 1'h0;
        pfRcv_io_recv_addr_v_last_REG_1 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  PBestOffsetPrefetch pbop (
    .clock                (clock),
    .reset                (reset),
    .io_train_valid       (io_train_valid & _pbop_io_train_valid_T),
    .io_train_bits_tag    (io_train_bits_tag),
    .io_train_bits_set    (io_train_bits_set),
    .io_train_bits_needT  (io_train_bits_needT),
    .io_train_bits_source (io_train_bits_source),
    .io_req_valid         (_pbop_io_req_valid),
    .io_req_bits_tag      (_pbop_io_req_bits_tag),
    .io_req_bits_set      (_pbop_io_req_bits_set),
    .io_req_bits_vaddr    (_pbop_io_req_bits_vaddr),
    .io_req_bits_needT    (_pbop_io_req_bits_needT),
    .io_req_bits_source   (_pbop_io_req_bits_source)
  );
  VBestOffsetPrefetch vbop (
    .clock                             (clock),
    .reset                             (reset),
    .io_train_valid                    (io_train_valid & _pbop_io_train_valid_T),
    .io_train_bits_needT               (io_train_bits_needT),
    .io_train_bits_source              (io_train_bits_source),
    .io_train_bits_vaddr               (io_train_bits_vaddr),
    .io_tlb_req_req_valid              (io_tlb_req_req_valid),
    .io_tlb_req_req_bits_vaddr         (io_tlb_req_req_bits_vaddr),
    .io_tlb_req_req_bits_cmd           (io_tlb_req_req_bits_cmd),
    .io_tlb_req_req_bits_kill          (io_tlb_req_req_bits_kill),
    .io_tlb_req_req_bits_no_translate  (io_tlb_req_req_bits_no_translate),
    .io_tlb_req_resp_valid             (io_tlb_req_resp_valid),
    .io_tlb_req_resp_bits_paddr_0      (io_tlb_req_resp_bits_paddr_0),
    .io_tlb_req_resp_bits_miss         (io_tlb_req_resp_bits_miss),
    .io_tlb_req_resp_bits_excp_0_pf_ld (io_tlb_req_resp_bits_excp_0_pf_ld),
    .io_tlb_req_resp_bits_excp_0_pf_st (io_tlb_req_resp_bits_excp_0_pf_st),
    .io_tlb_req_resp_bits_excp_0_af_ld (io_tlb_req_resp_bits_excp_0_af_ld),
    .io_tlb_req_resp_bits_excp_0_af_st (io_tlb_req_resp_bits_excp_0_af_st),
    .io_tlb_req_pmp_resp_mmio          (io_tlb_req_pmp_resp_mmio),
    .io_req_valid                      (_vbop_io_req_valid),
    .io_req_bits_tag                   (_vbop_io_req_bits_tag),
    .io_req_bits_set                   (_vbop_io_req_bits_set),
    .io_req_bits_vaddr                 (_vbop_io_req_bits_vaddr),
    .io_req_bits_needT                 (_vbop_io_req_bits_needT),
    .io_req_bits_source                (_vbop_io_req_bits_source)
  );
  TemporalPrefetch tp (
    .clock                               (clock),
    .reset                               (reset),
    .io_train_ready                      (io_train_ready),
    .io_train_valid                      (io_train_valid),
    .io_train_bits_tag                   (io_train_bits_tag),
    .io_train_bits_set                   (io_train_bits_set),
    .io_train_bits_vaddr                 (io_train_bits_vaddr),
    .io_train_bits_reqsource             (io_train_bits_reqsource),
    .io_req_ready
      (~_pfRcv_io_req_valid & ~_vbop_io_req_valid & ~_pbop_io_req_valid),
    .io_req_valid                        (_tp_io_req_valid),
    .io_req_bits_tag                     (_tp_io_req_bits_tag),
    .io_req_bits_set                     (_tp_io_req_bits_set),
    .io_tpmeta_port_req_ready            (tpio_tpmeta_port_req_ready),
    .io_tpmeta_port_req_valid            (tpio_tpmeta_port_req_valid),
    .io_tpmeta_port_req_bits_hartid      (tpio_tpmeta_port_req_bits_hartid),
    .io_tpmeta_port_req_bits_set         (tpio_tpmeta_port_req_bits_set),
    .io_tpmeta_port_req_bits_way         (tpio_tpmeta_port_req_bits_way),
    .io_tpmeta_port_req_bits_wmode       (tpio_tpmeta_port_req_bits_wmode),
    .io_tpmeta_port_req_bits_rawData_0   (tpio_tpmeta_port_req_bits_rawData_0),
    .io_tpmeta_port_req_bits_rawData_1   (tpio_tpmeta_port_req_bits_rawData_1),
    .io_tpmeta_port_req_bits_rawData_2   (tpio_tpmeta_port_req_bits_rawData_2),
    .io_tpmeta_port_req_bits_rawData_3   (tpio_tpmeta_port_req_bits_rawData_3),
    .io_tpmeta_port_req_bits_rawData_4   (tpio_tpmeta_port_req_bits_rawData_4),
    .io_tpmeta_port_req_bits_rawData_5   (tpio_tpmeta_port_req_bits_rawData_5),
    .io_tpmeta_port_req_bits_rawData_6   (tpio_tpmeta_port_req_bits_rawData_6),
    .io_tpmeta_port_req_bits_rawData_7   (tpio_tpmeta_port_req_bits_rawData_7),
    .io_tpmeta_port_req_bits_rawData_8   (tpio_tpmeta_port_req_bits_rawData_8),
    .io_tpmeta_port_req_bits_rawData_9   (tpio_tpmeta_port_req_bits_rawData_9),
    .io_tpmeta_port_req_bits_rawData_10  (tpio_tpmeta_port_req_bits_rawData_10),
    .io_tpmeta_port_req_bits_rawData_11  (tpio_tpmeta_port_req_bits_rawData_11),
    .io_tpmeta_port_req_bits_rawData_12  (tpio_tpmeta_port_req_bits_rawData_12),
    .io_tpmeta_port_req_bits_rawData_13  (tpio_tpmeta_port_req_bits_rawData_13),
    .io_tpmeta_port_req_bits_rawData_14  (tpio_tpmeta_port_req_bits_rawData_14),
    .io_tpmeta_port_req_bits_rawData_15  (tpio_tpmeta_port_req_bits_rawData_15),
    .io_tpmeta_port_resp_valid           (tpio_tpmeta_port_resp_valid),
    .io_tpmeta_port_resp_bits_hartid     (tpio_tpmeta_port_resp_bits_hartid),
    .io_tpmeta_port_resp_bits_rawData_0  (tpio_tpmeta_port_resp_bits_rawData_0),
    .io_tpmeta_port_resp_bits_rawData_1  (tpio_tpmeta_port_resp_bits_rawData_1),
    .io_tpmeta_port_resp_bits_rawData_2  (tpio_tpmeta_port_resp_bits_rawData_2),
    .io_tpmeta_port_resp_bits_rawData_3  (tpio_tpmeta_port_resp_bits_rawData_3),
    .io_tpmeta_port_resp_bits_rawData_4  (tpio_tpmeta_port_resp_bits_rawData_4),
    .io_tpmeta_port_resp_bits_rawData_5  (tpio_tpmeta_port_resp_bits_rawData_5),
    .io_tpmeta_port_resp_bits_rawData_6  (tpio_tpmeta_port_resp_bits_rawData_6),
    .io_tpmeta_port_resp_bits_rawData_7  (tpio_tpmeta_port_resp_bits_rawData_7),
    .io_tpmeta_port_resp_bits_rawData_8  (tpio_tpmeta_port_resp_bits_rawData_8),
    .io_tpmeta_port_resp_bits_rawData_9  (tpio_tpmeta_port_resp_bits_rawData_9),
    .io_tpmeta_port_resp_bits_rawData_10 (tpio_tpmeta_port_resp_bits_rawData_10),
    .io_tpmeta_port_resp_bits_rawData_11 (tpio_tpmeta_port_resp_bits_rawData_11),
    .io_tpmeta_port_resp_bits_rawData_12 (tpio_tpmeta_port_resp_bits_rawData_12),
    .io_tpmeta_port_resp_bits_rawData_13 (tpio_tpmeta_port_resp_bits_rawData_13),
    .io_tpmeta_port_resp_bits_rawData_14 (tpio_tpmeta_port_resp_bits_rawData_14),
    .io_tpmeta_port_resp_bits_rawData_15 (tpio_tpmeta_port_resp_bits_rawData_15),
    .io_hartid                           (hartId)
  );
  PrefetchReceiver pfRcv (
    .io_req_valid               (_pfRcv_io_req_valid),
    .io_req_bits_tag            (_pfRcv_io_req_bits_tag),
    .io_req_bits_set            (_pfRcv_io_req_bits_set),
    .io_req_bits_pfSource       (_pfRcv_io_req_bits_pfSource),
    .io_recv_addr_valid         (pfRcv_io_recv_addr_v_last_REG_1),
    .io_recv_addr_bits_addr     (pfRcv_io_recv_addr_d_1_addr),
    .io_recv_addr_bits_pfSource (pfRcv_io_recv_addr_d_1_pfSource)
  );
  PrefetchQueue pftQueue (
    .clock                (clock),
    .reset                (reset),
    .io_enq_valid
      (_pfRcv_io_req_valid | l2_pf_en
       & (_vbop_io_req_valid | _pbop_io_req_valid | _tp_io_req_valid)),
    .io_enq_bits_tag
      (_pftQueue_io_enq_bits_T
         ? (_pfRcv_io_req_valid ? _pfRcv_io_req_bits_tag : _vbop_io_req_bits_tag)
         : _pbop_io_req_valid ? _pbop_io_req_bits_tag : _tp_io_req_bits_tag),
    .io_enq_bits_set
      (_pftQueue_io_enq_bits_T
         ? (_pfRcv_io_req_valid ? _pfRcv_io_req_bits_set : _vbop_io_req_bits_set)
         : _pbop_io_req_valid ? _pbop_io_req_bits_set : _tp_io_req_bits_set),
    .io_enq_bits_vaddr
      (_pftQueue_io_enq_bits_T
         ? (_pfRcv_io_req_valid ? 33'h0 : _vbop_io_req_bits_vaddr)
         : _pbop_io_req_valid ? _pbop_io_req_bits_vaddr : 33'h0),
    .io_enq_bits_needT
      (_pftQueue_io_enq_bits_T
         ? ~_pfRcv_io_req_valid & _vbop_io_req_bits_needT
         : ~_pbop_io_req_valid | _pbop_io_req_bits_needT),
    .io_enq_bits_source
      (_pftQueue_io_enq_bits_T
         ? (_pfRcv_io_req_valid ? 7'h0 : _vbop_io_req_bits_source)
         : _pbop_io_req_valid ? _pbop_io_req_bits_source : 7'h0),
    .io_enq_bits_pfSource
      (_pftQueue_io_enq_bits_T
         ? (_pfRcv_io_req_valid ? _pfRcv_io_req_bits_pfSource : 4'h8)
         : {1'h1, ~_pbop_io_req_valid, 2'h1}),
    .io_deq_ready         (_pipe_io_in_ready),
    .io_deq_valid         (_pftQueue_io_deq_valid),
    .io_deq_bits_tag      (_pftQueue_io_deq_bits_tag),
    .io_deq_bits_set      (_pftQueue_io_deq_bits_set),
    .io_deq_bits_vaddr    (_pftQueue_io_deq_bits_vaddr),
    .io_deq_bits_needT    (_pftQueue_io_deq_bits_needT),
    .io_deq_bits_source   (_pftQueue_io_deq_bits_source),
    .io_deq_bits_pfSource (_pftQueue_io_deq_bits_pfSource)
  );
  Pipeline_1 pipe (
    .clock                (clock),
    .reset                (reset),
    .io_in_ready          (_pipe_io_in_ready),
    .io_in_valid          (_pftQueue_io_deq_valid),
    .io_in_bits_tag       (_pftQueue_io_deq_bits_tag),
    .io_in_bits_set       (_pftQueue_io_deq_bits_set),
    .io_in_bits_vaddr     (_pftQueue_io_deq_bits_vaddr),
    .io_in_bits_needT     (_pftQueue_io_deq_bits_needT),
    .io_in_bits_source    (_pftQueue_io_deq_bits_source),
    .io_in_bits_pfSource  (_pftQueue_io_deq_bits_pfSource),
    .io_out_ready         (io_req_ready),
    .io_out_valid         (io_req_valid),
    .io_out_bits_tag      (io_req_bits_tag),
    .io_out_bits_set      (io_req_bits_set),
    .io_out_bits_vaddr    (io_req_bits_vaddr),
    .io_out_bits_needT    (io_req_bits_needT),
    .io_out_bits_source   (io_req_bits_source),
    .io_out_bits_pfSource (io_req_bits_pfSource)
  );
endmodule

