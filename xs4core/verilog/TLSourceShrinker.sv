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

module TLSourceShrinker(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_size,
  input  [7:0]   auto_in_a_bits_source,
  input  [35:0]  auto_in_a_bits_address,
  input  [31:0]  auto_in_a_bits_mask,
  input  [255:0] auto_in_a_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [2:0]   auto_in_d_bits_size,
  output [7:0]   auto_in_d_bits_source,
  output         auto_in_d_bits_denied,
  output [255:0] auto_in_d_bits_data,
  output         auto_in_d_bits_corrupt,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
  output [2:0]   auto_out_a_bits_size,
  output [5:0]   auto_out_a_bits_source,
  output [35:0]  auto_out_a_bits_address,
  output [31:0]  auto_out_a_bits_mask,
  output [255:0] auto_out_a_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [2:0]   auto_out_d_bits_size,
  input  [5:0]   auto_out_d_bits_source,
  input          auto_out_d_bits_denied,
  input  [255:0] auto_out_d_bits_data,
  input          auto_out_d_bits_corrupt
);

  wire        nodeIn_a_ready;
  reg  [63:0] allocated;
  wire [63:0] _nextFreeOH_T_22 = ~allocated;
  wire [62:0] _nextFreeOH_T_3 = _nextFreeOH_T_22[62:0] | {_nextFreeOH_T_22[61:0], 1'h0};
  wire [62:0] _nextFreeOH_T_6 = _nextFreeOH_T_3 | {_nextFreeOH_T_3[60:0], 2'h0};
  wire [62:0] _nextFreeOH_T_9 = _nextFreeOH_T_6 | {_nextFreeOH_T_6[58:0], 4'h0};
  wire [62:0] _nextFreeOH_T_12 = _nextFreeOH_T_9 | {_nextFreeOH_T_9[54:0], 8'h0};
  wire [62:0] _nextFreeOH_T_15 = _nextFreeOH_T_12 | {_nextFreeOH_T_12[46:0], 16'h0};
  wire [63:0] nextFree_lo =
    {~(_nextFreeOH_T_15 | {_nextFreeOH_T_15[30:0], 32'h0}), 1'h1} & _nextFreeOH_T_22;
  wire [30:0] _nextFree_T_3 = nextFree_lo[63:33] | nextFree_lo[31:1];
  wire [14:0] _nextFree_T_5 = _nextFree_T_3[30:16] | _nextFree_T_3[14:0];
  wire [6:0]  _nextFree_T_7 = _nextFree_T_5[14:8] | _nextFree_T_5[6:0];
  wire [2:0]  _nextFree_T_9 = _nextFree_T_7[6:4] | _nextFree_T_7[2:0];
  wire        _nextFree_T_11 = _nextFree_T_9[2] | _nextFree_T_9[0];
  wire        _alloc_T = nodeIn_a_ready & auto_in_a_valid;
  reg         a_first_counter;
  reg         d_last_counter;
  wire        block = ~a_first_counter & (&allocated);
  assign nodeIn_a_ready = auto_out_a_ready & ~block;
  reg  [6:0]  nodeOut_a_bits_source_r;
  wire [5:0]  _GEN =
    {|(nextFree_lo[63:32]),
     |(_nextFree_T_3[30:15]),
     |(_nextFree_T_5[14:7]),
     |(_nextFree_T_7[6:3]),
     |(_nextFree_T_9[2:1]),
     _nextFree_T_11};
  wire [12:0] _a_first_beats1_decode_T = 13'h3F << auto_in_a_bits_size;
  wire        _free_T = auto_in_d_ready & auto_out_d_valid;
  wire [12:0] _d_last_beats1_decode_T = 13'h3F << auto_out_d_bits_size;
  wire        d_last_beats1 = auto_out_d_bits_opcode[0] & ~(_d_last_beats1_decode_T[5]);
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      allocated <= 64'h0;
      a_first_counter <= 1'h0;
      d_last_counter <= 1'h0;
    end
    else begin
      allocated <=
        (allocated | (~a_first_counter & _alloc_T ? nextFree_lo : 64'h0))
        & ~((d_last_counter | ~d_last_beats1) & _free_T
              ? 64'h1 << auto_out_d_bits_source
              : 64'h0);
      if (_alloc_T) begin
        if (a_first_counter)
          a_first_counter <= 1'(a_first_counter - 1'h1);
        else
          a_first_counter <= ~(auto_in_a_bits_opcode[2]) & ~(_a_first_beats1_decode_T[5]);
      end
      if (_free_T) begin
        if (d_last_counter)
          d_last_counter <= 1'(d_last_counter - 1'h1);
        else
          d_last_counter <= d_last_beats1;
      end
    end
  end // always @(posedge, posedge)
  always @(posedge clock) begin
    if (a_first_counter) begin
    end
    else
      nodeOut_a_bits_source_r <=
        {1'h0,
         |(nextFree_lo[63:32]),
         |(_nextFree_T_3[30:15]),
         |(_nextFree_T_5[14:7]),
         |(_nextFree_T_7[6:3]),
         |(_nextFree_T_9[2:1]),
         _nextFree_T_11};
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:2];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        allocated = {_RANDOM[2'h0], _RANDOM[2'h1]};
        a_first_counter = _RANDOM[2'h2][0];
        d_last_counter = _RANDOM[2'h2][1];
        nodeOut_a_bits_source_r = _RANDOM[2'h2][8:2];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        allocated = 64'h0;
        a_first_counter = 1'h0;
        d_last_counter = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  sourceIdMap_64x8 sourceIdMap_ext (
    .R0_addr (auto_out_d_bits_source),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (auto_in_d_bits_source),
    .W0_addr (_GEN),
    .W0_en   (~a_first_counter & _alloc_T),
    .W0_clk  (clock),
    .W0_data (auto_in_a_bits_source)
  );
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_d_valid = auto_out_d_valid;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_d_bits_data = auto_out_d_bits_data;
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign auto_out_a_valid = auto_in_a_valid & ~block;
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_a_bits_size = auto_in_a_bits_size;
  assign auto_out_a_bits_source = a_first_counter ? nodeOut_a_bits_source_r[5:0] : _GEN;
  assign auto_out_a_bits_address = auto_in_a_bits_address;
  assign auto_out_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_a_bits_data = auto_in_a_bits_data;
  assign auto_out_d_ready = auto_in_d_ready;
endmodule

