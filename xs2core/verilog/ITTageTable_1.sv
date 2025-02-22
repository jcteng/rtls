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

module ITTageTable_1(
  input          clock,
  input          reset,
  input          io_req_valid,
  input  [40:0]  io_req_bits_pc,
  input  [7:0]   io_req_bits_folded_hist_hist_14_folded_hist,
  output         io_resp_valid,
  output [1:0]   io_resp_bits_ctr,
  output [1:0]   io_resp_bits_u,
  output [40:0]  io_resp_bits_target,
  input  [40:0]  io_update_pc,
  input  [255:0] io_update_ghist,
  input          io_update_valid,
  input          io_update_correct,
  input          io_update_alloc,
  input  [1:0]   io_update_oldCtr,
  input          io_update_uValid,
  input          io_update_u,
  input          io_update_reset_u,
  input  [40:0]  io_update_target,
  input  [40:0]  io_update_old_target
);

  wire        _wrbypass_io_hit;
  wire [1:0]  _wrbypass_io_hit_data_0_bits;
  wire        _table_io_r_resp_data_0_valid;
  wire [8:0]  _table_io_r_resp_data_0_tag;
  wire        _table_io_r_resp_data_0_useful;
  wire [7:0]  update_folded_hist_hist_11_folded_hist = 8'h0;
  wire [7:0]  update_folded_hist_hist_8_folded_hist = 8'h0;
  wire [7:0]  update_folded_hist_hist_4_folded_hist = 8'h0;
  wire [7:0]  update_folded_hist_hist_3_folded_hist = 8'h0;
  wire [7:0]  update_folded_hist_hist_2_folded_hist = 8'h0;
  wire [7:0]  update_folded_hist_hist_0_folded_hist = 8'h0;
  wire [8:0]  update_folded_hist_hist_13_folded_hist = 9'h0;
  wire [8:0]  update_folded_hist_hist_10_folded_hist = 9'h0;
  wire [8:0]  update_folded_hist_hist_6_folded_hist = 9'h0;
  wire [10:0] update_folded_hist_hist_17_folded_hist = 11'h0;
  wire [10:0] update_folded_hist_hist_16_folded_hist = 11'h0;
  wire [10:0] update_folded_hist_hist_1_folded_hist = 11'h0;
  wire [3:0]  update_folded_hist_hist_12_folded_hist = 4'h0;
  wire [6:0]  update_folded_hist_hist_15_folded_hist = 7'h0;
  wire [6:0]  update_folded_hist_hist_9_folded_hist = 7'h0;
  wire [6:0]  update_folded_hist_hist_7_folded_hist = 7'h0;
  wire [6:0]  update_folded_hist_hist_5_folded_hist = 7'h0;
  reg  [8:0]  s1_tag;
  reg         s1_valid;
  reg         s1_read_write_conflict;
  wire [7:0]  update_folded_hist_hist_14_folded_hist = io_update_ghist[7:0];
  wire [7:0]  update_idx = io_update_pc[8:1] ^ update_folded_hist_hist_14_folded_hist;
  reg         needReset;
  wire        useful_can_reset = ~(io_req_valid | io_update_valid) & needReset;
  reg  [7:0]  resetSet;
  wire [1:0]  old_ctr =
    _wrbypass_io_hit ? _wrbypass_io_hit_data_0_bits : io_update_oldCtr;
  wire        update_wdata_ctr_oldSatNotTaken = old_ctr == 2'h0;
  wire [1:0]  update_wdata_ctr =
    io_update_alloc
      ? 2'h2
      : (&old_ctr) & io_update_correct
          ? 2'h3
          : update_wdata_ctr_oldSatNotTaken & ~io_update_correct
              ? 2'h0
              : io_update_correct ? 2'(old_ctr + 2'h1) : 2'(old_ctr - 2'h1);
  always @(posedge clock) begin
    if (io_req_valid) begin
      s1_tag <=
        {io_req_bits_pc[17],
         io_req_bits_pc[16:9] ^ io_req_bits_folded_hist_hist_14_folded_hist}
        ^ {io_req_bits_folded_hist_hist_14_folded_hist, 1'h0};
      s1_read_write_conflict <= io_update_valid & io_req_valid;
    end
    s1_valid <= io_req_valid;
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      needReset <= 1'h0;
      resetSet <= 8'h0;
    end
    else begin
      needReset <= io_update_reset_u | ~(useful_can_reset & (&resetSet)) & needReset;
      if (useful_can_reset)
        resetSet <= 8'(resetSet + 8'h1);
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        s1_tag = _RANDOM[/*Zero width*/ 1'b0][16:8];
        s1_valid = _RANDOM[/*Zero width*/ 1'b0][17];
        s1_read_write_conflict = _RANDOM[/*Zero width*/ 1'b0][18];
        needReset = _RANDOM[/*Zero width*/ 1'b0][19];
        resetSet = _RANDOM[/*Zero width*/ 1'b0][27:20];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        needReset = 1'h0;
        resetSet = 8'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  FoldedSRAMTemplate_21 table_0 (
    .clock                       (clock),
    .reset                       (reset),
    .io_r_req_valid              (io_req_valid),
    .io_r_req_bits_setIdx
      (io_req_bits_pc[8:1] ^ io_req_bits_folded_hist_hist_14_folded_hist),
    .io_r_resp_data_0_valid      (_table_io_r_resp_data_0_valid),
    .io_r_resp_data_0_tag        (_table_io_r_resp_data_0_tag),
    .io_r_resp_data_0_ctr        (io_resp_bits_ctr),
    .io_r_resp_data_0_target     (io_resp_bits_target),
    .io_r_resp_data_0_useful     (_table_io_r_resp_data_0_useful),
    .io_w_req_valid              (io_update_valid | useful_can_reset),
    .io_w_req_bits_setIdx        (useful_can_reset ? resetSet : update_idx),
    .io_w_req_bits_data_0_tag
      ({io_update_pc[17], io_update_pc[16:9] ^ update_folded_hist_hist_14_folded_hist}
       ^ {update_folded_hist_hist_14_folded_hist, 1'h0}),
    .io_w_req_bits_data_0_ctr    (update_wdata_ctr),
    .io_w_req_bits_data_0_target
      (io_update_alloc | update_wdata_ctr_oldSatNotTaken
         ? io_update_target
         : io_update_old_target),
    .io_w_req_bits_data_0_useful (~useful_can_reset & io_update_u),
    .io_w_req_bits_bitmask
      (io_update_uValid & io_update_valid
         ? 54'h3FFFFFFFFFFFFF
         : io_update_valid ? 54'h3FFFFFFFFFFFFE : {53'h0, useful_can_reset})
  );
  WrBypass_41 wrbypass (
    .clock              (clock),
    .reset              (reset),
    .io_wen             (io_update_valid),
    .io_write_idx       (update_idx),
    .io_write_data_0    (update_wdata_ctr),
    .io_hit             (_wrbypass_io_hit),
    .io_hit_data_0_bits (_wrbypass_io_hit_data_0_bits)
  );
  assign io_resp_valid =
    _table_io_r_resp_data_0_valid & _table_io_r_resp_data_0_tag == s1_tag
    & ~s1_read_write_conflict & s1_valid;
  assign io_resp_bits_u = {1'h0, _table_io_r_resp_data_0_useful};
endmodule

