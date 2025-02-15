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

module SyncDataModuleTemplate__64entry_4(
  input         clock,
  input         reset,
  input         io_ren_0,
  input  [5:0]  io_raddr_0,
  output [40:0] io_rdata_0,
  input         io_wen_0,
  input  [5:0]  io_waddr_0,
  input  [40:0] io_wdata_0
);

  wire [40:0] _dataBanks_3_io_rdata_0;
  wire [40:0] _dataBanks_2_io_rdata_0;
  wire [40:0] _dataBanks_1_io_rdata_0;
  wire [40:0] _dataBanks_0_io_rdata_0;
  reg  [5:0]  raddr_dup_0;
  reg         wen_dup_last_REG;
  reg  [5:0]  waddr_dup_0;
  reg  [40:0] r;
  reg  [5:0]  raddr_dup_0_1;
  reg         wen_dup_last_REG_1;
  reg  [5:0]  waddr_dup_0_1;
  reg  [40:0] r_1;
  reg  [5:0]  raddr_dup_0_2;
  reg         wen_dup_last_REG_2;
  reg  [5:0]  waddr_dup_0_2;
  reg  [40:0] r_2;
  reg  [5:0]  raddr_dup_0_3;
  reg         wen_dup_last_REG_3;
  reg  [5:0]  waddr_dup_0_3;
  reg  [40:0] r_3;
  reg  [5:0]  raddr_dup;
  always @(posedge clock) begin
    if (io_ren_0) begin
      raddr_dup_0 <= io_raddr_0;
      raddr_dup_0_1 <= io_raddr_0;
      raddr_dup_0_2 <= io_raddr_0;
      raddr_dup_0_3 <= io_raddr_0;
      raddr_dup <= io_raddr_0;
    end
    if (io_wen_0) begin
      waddr_dup_0 <= io_waddr_0;
      r <= io_wdata_0;
      waddr_dup_0_1 <= io_waddr_0;
      r_1 <= io_wdata_0;
      waddr_dup_0_2 <= io_waddr_0;
      r_2 <= io_wdata_0;
      waddr_dup_0_3 <= io_waddr_0;
      r_3 <= io_wdata_0;
    end
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wen_dup_last_REG <= 1'h0;
      wen_dup_last_REG_1 <= 1'h0;
      wen_dup_last_REG_2 <= 1'h0;
      wen_dup_last_REG_3 <= 1'h0;
    end
    else begin
      wen_dup_last_REG <= io_wen_0;
      wen_dup_last_REG_1 <= io_wen_0;
      wen_dup_last_REG_2 <= io_wen_0;
      wen_dup_last_REG_3 <= io_wen_0;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:6];
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [2:0] i = 3'h0; i < 3'h7; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        raddr_dup_0 = _RANDOM[3'h0][5:0];
        wen_dup_last_REG = _RANDOM[3'h0][6];
        waddr_dup_0 = _RANDOM[3'h0][12:7];
        r = {_RANDOM[3'h0][31:13], _RANDOM[3'h1][21:0]};
        raddr_dup_0_1 = _RANDOM[3'h1][27:22];
        wen_dup_last_REG_1 = _RANDOM[3'h1][28];
        waddr_dup_0_1 = {_RANDOM[3'h1][31:29], _RANDOM[3'h2][2:0]};
        r_1 = {_RANDOM[3'h2][31:3], _RANDOM[3'h3][11:0]};
        raddr_dup_0_2 = _RANDOM[3'h3][17:12];
        wen_dup_last_REG_2 = _RANDOM[3'h3][18];
        waddr_dup_0_2 = _RANDOM[3'h3][24:19];
        r_2 = {_RANDOM[3'h3][31:25], _RANDOM[3'h4], _RANDOM[3'h5][1:0]};
        raddr_dup_0_3 = _RANDOM[3'h5][7:2];
        wen_dup_last_REG_3 = _RANDOM[3'h5][8];
        waddr_dup_0_3 = _RANDOM[3'h5][14:9];
        r_3 = {_RANDOM[3'h5][31:15], _RANDOM[3'h6][23:0]};
        raddr_dup = _RANDOM[3'h6][29:24];
      `endif // RANDOMIZE_REG_INIT
      if (reset) begin
        wen_dup_last_REG = 1'h0;
        wen_dup_last_REG_1 = 1'h0;
        wen_dup_last_REG_2 = 1'h0;
        wen_dup_last_REG_3 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  NegedgeDataModule__16entry_16 dataBanks_0 (
    .clock      (clock),
    .io_raddr_0 (raddr_dup_0[3:0]),
    .io_rdata_0 (_dataBanks_0_io_rdata_0),
    .io_wen_0   (wen_dup_last_REG & waddr_dup_0[5:4] == 2'h0),
    .io_waddr_0 (waddr_dup_0[3:0]),
    .io_wdata_0 (r)
  );
  NegedgeDataModule__16entry_16 dataBanks_1 (
    .clock      (clock),
    .io_raddr_0 (raddr_dup_0_1[3:0]),
    .io_rdata_0 (_dataBanks_1_io_rdata_0),
    .io_wen_0   (wen_dup_last_REG_1 & waddr_dup_0_1[5:4] == 2'h1),
    .io_waddr_0 (waddr_dup_0_1[3:0]),
    .io_wdata_0 (r_1)
  );
  NegedgeDataModule__16entry_16 dataBanks_2 (
    .clock      (clock),
    .io_raddr_0 (raddr_dup_0_2[3:0]),
    .io_rdata_0 (_dataBanks_2_io_rdata_0),
    .io_wen_0   (wen_dup_last_REG_2 & waddr_dup_0_2[5:4] == 2'h2),
    .io_waddr_0 (waddr_dup_0_2[3:0]),
    .io_wdata_0 (r_2)
  );
  NegedgeDataModule__16entry_16 dataBanks_3 (
    .clock      (clock),
    .io_raddr_0 (raddr_dup_0_3[3:0]),
    .io_rdata_0 (_dataBanks_3_io_rdata_0),
    .io_wen_0   (wen_dup_last_REG_3 & (&(waddr_dup_0_3[5:4]))),
    .io_waddr_0 (waddr_dup_0_3[3:0]),
    .io_wdata_0 (r_3)
  );
  assign io_rdata_0 =
    (raddr_dup[5:4] == 2'h0 ? _dataBanks_0_io_rdata_0 : 41'h0)
    | (raddr_dup[5:4] == 2'h1 ? _dataBanks_1_io_rdata_0 : 41'h0)
    | (raddr_dup[5:4] == 2'h2 ? _dataBanks_2_io_rdata_0 : 41'h0)
    | ((&(raddr_dup[5:4])) ? _dataBanks_3_io_rdata_0 : 41'h0);
endmodule

