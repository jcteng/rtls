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

module CSRCacheOpDecoder(
  input         clock,
  input         io_csr_distribute_csr_w_valid,
  input  [11:0] io_csr_distribute_csr_w_bits_addr,
  input  [63:0] io_csr_distribute_csr_w_bits_data,
  output [63:0] io_cache_req_bits_wayNum,
  output [63:0] io_cache_req_bits_index,
  output [63:0] io_cache_req_bits_write_tag_low,
  output [63:0] io_cache_req_bits_write_data_vec_0,
  output [63:0] io_cache_req_bits_write_data_vec_1,
  output [63:0] io_cache_req_bits_write_data_vec_2,
  output [63:0] io_cache_req_bits_write_data_vec_3,
  output [63:0] io_cache_req_bits_write_data_vec_4,
  output [63:0] io_cache_req_bits_write_data_vec_5,
  output [63:0] io_cache_req_bits_write_data_vec_6,
  output [63:0] io_cache_req_bits_write_data_vec_7,
  output        io_cache_req_dup_0_valid,
  output        io_cache_req_dup_1_valid,
  output        io_cache_req_dup_2_valid,
  output        io_cache_req_dup_3_valid,
  output        io_cache_req_dup_6_valid,
  output        io_cache_req_dup_7_valid,
  output        io_cache_req_dup_8_valid,
  output        io_cache_req_dup_9_valid,
  output        io_cache_req_dup_10_valid,
  output        io_cache_req_dup_11_valid,
  output [63:0] io_cacheOp_req_bits_opCode_dup_0,
  output [63:0] io_cacheOp_req_bits_opCode_dup_1,
  output [63:0] io_cacheOp_req_bits_opCode_dup_2,
  output [63:0] io_cacheOp_req_bits_opCode_dup_3,
  output [63:0] io_cacheOp_req_bits_opCode_dup_6,
  output [63:0] io_cacheOp_req_bits_opCode_dup_7,
  output [63:0] io_cacheOp_req_bits_opCode_dup_8,
  output [63:0] io_cacheOp_req_bits_opCode_dup_9,
  output [63:0] io_cacheOp_req_bits_opCode_dup_10,
  output [63:0] io_cacheOp_req_bits_opCode_dup_11
);

  reg  [63:0] translated_cache_req_level;
  reg  [63:0] translated_cache_req_wayNum;
  reg  [63:0] translated_cache_req_index;
  reg  [63:0] translated_cache_req_write_tag_low;
  reg  [63:0] translated_cache_req_write_data_vec_0;
  reg  [63:0] translated_cache_req_write_data_vec_1;
  reg  [63:0] translated_cache_req_write_data_vec_2;
  reg  [63:0] translated_cache_req_write_data_vec_3;
  reg  [63:0] translated_cache_req_write_data_vec_4;
  reg  [63:0] translated_cache_req_write_data_vec_5;
  reg  [63:0] translated_cache_req_write_data_vec_6;
  reg  [63:0] translated_cache_req_write_data_vec_7;
  reg  [63:0] translated_cache_req_opCode_dup_0;
  reg  [63:0] translated_cache_req_opCode_dup_1;
  reg  [63:0] translated_cache_req_opCode_dup_2;
  reg  [63:0] translated_cache_req_opCode_dup_3;
  reg  [63:0] translated_cache_req_opCode_dup_6;
  reg  [63:0] translated_cache_req_opCode_dup_7;
  reg  [63:0] translated_cache_req_opCode_dup_8;
  reg  [63:0] translated_cache_req_opCode_dup_9;
  reg  [63:0] translated_cache_req_opCode_dup_10;
  reg  [63:0] translated_cache_req_opCode_dup_11;
  reg         io_cache_req_dup_0_valid_REG;
  reg         io_cache_req_dup_1_valid_REG;
  reg         io_cache_req_dup_2_valid_REG;
  reg         io_cache_req_dup_3_valid_REG;
  reg         io_cache_req_dup_6_valid_REG;
  reg         io_cache_req_dup_7_valid_REG;
  reg         io_cache_req_dup_8_valid_REG;
  reg         io_cache_req_dup_9_valid_REG;
  reg         io_cache_req_dup_10_valid_REG;
  reg         io_cache_req_dup_11_valid_REG;
  wire        _cache_op_start_T = io_csr_distribute_csr_w_bits_addr == 12'h5C5;
  wire        cache_op_start =
    _cache_op_start_T & io_csr_distribute_csr_w_valid
    & translated_cache_req_level == 64'h1;
  always @(posedge clock) begin
    if (io_csr_distribute_csr_w_bits_addr == 12'h5C7 & io_csr_distribute_csr_w_valid)
      translated_cache_req_level <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5C8 & io_csr_distribute_csr_w_valid)
      translated_cache_req_wayNum <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5C9 & io_csr_distribute_csr_w_valid)
      translated_cache_req_index <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5CD & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_tag_low <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D1 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_0 <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D2 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_1 <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D3 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_2 <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D4 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_3 <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D5 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_4 <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D6 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_5 <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D7 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_6 <= io_csr_distribute_csr_w_bits_data;
    if (io_csr_distribute_csr_w_bits_addr == 12'h5D8 & io_csr_distribute_csr_w_valid)
      translated_cache_req_write_data_vec_7 <= io_csr_distribute_csr_w_bits_data;
    if (_cache_op_start_T & io_csr_distribute_csr_w_valid) begin
      translated_cache_req_opCode_dup_0 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_1 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_2 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_3 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_6 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_7 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_8 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_9 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_10 <= io_csr_distribute_csr_w_bits_data;
      translated_cache_req_opCode_dup_11 <= io_csr_distribute_csr_w_bits_data;
    end
    io_cache_req_dup_0_valid_REG <= cache_op_start;
    io_cache_req_dup_1_valid_REG <= cache_op_start;
    io_cache_req_dup_2_valid_REG <= cache_op_start;
    io_cache_req_dup_3_valid_REG <= cache_op_start;
    io_cache_req_dup_6_valid_REG <= cache_op_start;
    io_cache_req_dup_7_valid_REG <= cache_op_start;
    io_cache_req_dup_8_valid_REG <= cache_op_start;
    io_cache_req_dup_9_valid_REG <= cache_op_start;
    io_cache_req_dup_10_valid_REG <= cache_op_start;
    io_cache_req_dup_11_valid_REG <= cache_op_start;
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:66];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [6:0] i = 7'h0; i < 7'h43; i += 7'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        translated_cache_req_level =
          {_RANDOM[7'h0][31:7], _RANDOM[7'h1], _RANDOM[7'h2][6:0]};
        translated_cache_req_wayNum =
          {_RANDOM[7'h2][31:7], _RANDOM[7'h3], _RANDOM[7'h4][6:0]};
        translated_cache_req_index =
          {_RANDOM[7'h4][31:7], _RANDOM[7'h5], _RANDOM[7'h6][6:0]};
        translated_cache_req_write_tag_low =
          {_RANDOM[7'hA][31:7], _RANDOM[7'hB], _RANDOM[7'hC][6:0]};
        translated_cache_req_write_data_vec_0 =
          {_RANDOM[7'hE][31:7], _RANDOM[7'hF], _RANDOM[7'h10][6:0]};
        translated_cache_req_write_data_vec_1 =
          {_RANDOM[7'h10][31:7], _RANDOM[7'h11], _RANDOM[7'h12][6:0]};
        translated_cache_req_write_data_vec_2 =
          {_RANDOM[7'h12][31:7], _RANDOM[7'h13], _RANDOM[7'h14][6:0]};
        translated_cache_req_write_data_vec_3 =
          {_RANDOM[7'h14][31:7], _RANDOM[7'h15], _RANDOM[7'h16][6:0]};
        translated_cache_req_write_data_vec_4 =
          {_RANDOM[7'h16][31:7], _RANDOM[7'h17], _RANDOM[7'h18][6:0]};
        translated_cache_req_write_data_vec_5 =
          {_RANDOM[7'h18][31:7], _RANDOM[7'h19], _RANDOM[7'h1A][6:0]};
        translated_cache_req_write_data_vec_6 =
          {_RANDOM[7'h1A][31:7], _RANDOM[7'h1B], _RANDOM[7'h1C][6:0]};
        translated_cache_req_write_data_vec_7 =
          {_RANDOM[7'h1C][31:7], _RANDOM[7'h1D], _RANDOM[7'h1E][6:0]};
        translated_cache_req_opCode_dup_0 =
          {_RANDOM[7'h22][31:7], _RANDOM[7'h23], _RANDOM[7'h24][6:0]};
        translated_cache_req_opCode_dup_1 =
          {_RANDOM[7'h24][31:7], _RANDOM[7'h25], _RANDOM[7'h26][6:0]};
        translated_cache_req_opCode_dup_2 =
          {_RANDOM[7'h26][31:7], _RANDOM[7'h27], _RANDOM[7'h28][6:0]};
        translated_cache_req_opCode_dup_3 =
          {_RANDOM[7'h28][31:7], _RANDOM[7'h29], _RANDOM[7'h2A][6:0]};
        translated_cache_req_opCode_dup_6 =
          {_RANDOM[7'h2E][31:7], _RANDOM[7'h2F], _RANDOM[7'h30][6:0]};
        translated_cache_req_opCode_dup_7 =
          {_RANDOM[7'h30][31:7], _RANDOM[7'h31], _RANDOM[7'h32][6:0]};
        translated_cache_req_opCode_dup_8 =
          {_RANDOM[7'h32][31:7], _RANDOM[7'h33], _RANDOM[7'h34][6:0]};
        translated_cache_req_opCode_dup_9 =
          {_RANDOM[7'h34][31:7], _RANDOM[7'h35], _RANDOM[7'h36][6:0]};
        translated_cache_req_opCode_dup_10 =
          {_RANDOM[7'h36][31:7], _RANDOM[7'h37], _RANDOM[7'h38][6:0]};
        translated_cache_req_opCode_dup_11 =
          {_RANDOM[7'h38][31:7], _RANDOM[7'h39], _RANDOM[7'h3A][6:0]};
        io_cache_req_dup_0_valid_REG = _RANDOM[7'h42][8];
        io_cache_req_dup_1_valid_REG = _RANDOM[7'h42][9];
        io_cache_req_dup_2_valid_REG = _RANDOM[7'h42][10];
        io_cache_req_dup_3_valid_REG = _RANDOM[7'h42][11];
        io_cache_req_dup_6_valid_REG = _RANDOM[7'h42][14];
        io_cache_req_dup_7_valid_REG = _RANDOM[7'h42][15];
        io_cache_req_dup_8_valid_REG = _RANDOM[7'h42][16];
        io_cache_req_dup_9_valid_REG = _RANDOM[7'h42][17];
        io_cache_req_dup_10_valid_REG = _RANDOM[7'h42][18];
        io_cache_req_dup_11_valid_REG = _RANDOM[7'h42][19];
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_cache_req_bits_wayNum = translated_cache_req_wayNum;
  assign io_cache_req_bits_index = translated_cache_req_index;
  assign io_cache_req_bits_write_tag_low = translated_cache_req_write_tag_low;
  assign io_cache_req_bits_write_data_vec_0 = translated_cache_req_write_data_vec_0;
  assign io_cache_req_bits_write_data_vec_1 = translated_cache_req_write_data_vec_1;
  assign io_cache_req_bits_write_data_vec_2 = translated_cache_req_write_data_vec_2;
  assign io_cache_req_bits_write_data_vec_3 = translated_cache_req_write_data_vec_3;
  assign io_cache_req_bits_write_data_vec_4 = translated_cache_req_write_data_vec_4;
  assign io_cache_req_bits_write_data_vec_5 = translated_cache_req_write_data_vec_5;
  assign io_cache_req_bits_write_data_vec_6 = translated_cache_req_write_data_vec_6;
  assign io_cache_req_bits_write_data_vec_7 = translated_cache_req_write_data_vec_7;
  assign io_cache_req_dup_0_valid = io_cache_req_dup_0_valid_REG;
  assign io_cache_req_dup_1_valid = io_cache_req_dup_1_valid_REG;
  assign io_cache_req_dup_2_valid = io_cache_req_dup_2_valid_REG;
  assign io_cache_req_dup_3_valid = io_cache_req_dup_3_valid_REG;
  assign io_cache_req_dup_6_valid = io_cache_req_dup_6_valid_REG;
  assign io_cache_req_dup_7_valid = io_cache_req_dup_7_valid_REG;
  assign io_cache_req_dup_8_valid = io_cache_req_dup_8_valid_REG;
  assign io_cache_req_dup_9_valid = io_cache_req_dup_9_valid_REG;
  assign io_cache_req_dup_10_valid = io_cache_req_dup_10_valid_REG;
  assign io_cache_req_dup_11_valid = io_cache_req_dup_11_valid_REG;
  assign io_cacheOp_req_bits_opCode_dup_0 = translated_cache_req_opCode_dup_0;
  assign io_cacheOp_req_bits_opCode_dup_1 = translated_cache_req_opCode_dup_1;
  assign io_cacheOp_req_bits_opCode_dup_2 = translated_cache_req_opCode_dup_2;
  assign io_cacheOp_req_bits_opCode_dup_3 = translated_cache_req_opCode_dup_3;
  assign io_cacheOp_req_bits_opCode_dup_6 = translated_cache_req_opCode_dup_6;
  assign io_cacheOp_req_bits_opCode_dup_7 = translated_cache_req_opCode_dup_7;
  assign io_cacheOp_req_bits_opCode_dup_8 = translated_cache_req_opCode_dup_8;
  assign io_cacheOp_req_bits_opCode_dup_9 = translated_cache_req_opCode_dup_9;
  assign io_cacheOp_req_bits_opCode_dup_10 = translated_cache_req_opCode_dup_10;
  assign io_cacheOp_req_bits_opCode_dup_11 = translated_cache_req_opCode_dup_11;
endmodule

