module RegisterFile(
  input         clock,
  input         reset,
  output [31:0] io_out_A,
  output [31:0] io_out_B,
  input  [3:0]  io_sel_A,
  input  [3:0]  io_sel_B,
  input         io_writeEnable,
  input  [31:0] io_writeData,
  input  [3:0]  io_writeSelect
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] registers_3; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_4; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_5; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_6; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_7; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_8; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_9; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_10; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_11; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_12; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_13; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_14; // @[RegisterFile.scala 19:22]
  reg [31:0] registers_15; // @[RegisterFile.scala 19:22]
  wire [31:0] _GEN_1 = 4'h1 == io_sel_A ? 32'h13 : 32'h0; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_2 = 4'h2 == io_sel_A ? 32'h14 : _GEN_1; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_3 = 4'h3 == io_sel_A ? registers_3 : _GEN_2; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_4 = 4'h4 == io_sel_A ? registers_4 : _GEN_3; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_5 = 4'h5 == io_sel_A ? registers_5 : _GEN_4; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_6 = 4'h6 == io_sel_A ? registers_6 : _GEN_5; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_7 = 4'h7 == io_sel_A ? registers_7 : _GEN_6; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_8 = 4'h8 == io_sel_A ? registers_8 : _GEN_7; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_9 = 4'h9 == io_sel_A ? registers_9 : _GEN_8; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_10 = 4'ha == io_sel_A ? registers_10 : _GEN_9; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_11 = 4'hb == io_sel_A ? registers_11 : _GEN_10; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_12 = 4'hc == io_sel_A ? registers_12 : _GEN_11; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_13 = 4'hd == io_sel_A ? registers_13 : _GEN_12; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_14 = 4'he == io_sel_A ? registers_14 : _GEN_13; // @[RegisterFile.scala 21:12]
  wire [31:0] _GEN_17 = 4'h1 == io_sel_B ? 32'h13 : 32'h0; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_18 = 4'h2 == io_sel_B ? 32'h14 : _GEN_17; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_19 = 4'h3 == io_sel_B ? registers_3 : _GEN_18; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_20 = 4'h4 == io_sel_B ? registers_4 : _GEN_19; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_21 = 4'h5 == io_sel_B ? registers_5 : _GEN_20; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_22 = 4'h6 == io_sel_B ? registers_6 : _GEN_21; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_23 = 4'h7 == io_sel_B ? registers_7 : _GEN_22; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_24 = 4'h8 == io_sel_B ? registers_8 : _GEN_23; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_25 = 4'h9 == io_sel_B ? registers_9 : _GEN_24; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_26 = 4'ha == io_sel_B ? registers_10 : _GEN_25; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_27 = 4'hb == io_sel_B ? registers_11 : _GEN_26; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_28 = 4'hc == io_sel_B ? registers_12 : _GEN_27; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_29 = 4'hd == io_sel_B ? registers_13 : _GEN_28; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_30 = 4'he == io_sel_B ? registers_14 : _GEN_29; // @[RegisterFile.scala 22:12]
  wire [31:0] _GEN_33 = 4'h1 == io_writeSelect ? 32'h13 : 32'h0; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_34 = 4'h2 == io_writeSelect ? 32'h14 : _GEN_33; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_35 = 4'h3 == io_writeSelect ? registers_3 : _GEN_34; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_36 = 4'h4 == io_writeSelect ? registers_4 : _GEN_35; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_37 = 4'h5 == io_writeSelect ? registers_5 : _GEN_36; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_38 = 4'h6 == io_writeSelect ? registers_6 : _GEN_37; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_39 = 4'h7 == io_writeSelect ? registers_7 : _GEN_38; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_40 = 4'h8 == io_writeSelect ? registers_8 : _GEN_39; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_41 = 4'h9 == io_writeSelect ? registers_9 : _GEN_40; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_42 = 4'ha == io_writeSelect ? registers_10 : _GEN_41; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_43 = 4'hb == io_writeSelect ? registers_11 : _GEN_42; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_44 = 4'hc == io_writeSelect ? registers_12 : _GEN_43; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_45 = 4'hd == io_writeSelect ? registers_13 : _GEN_44; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_46 = 4'he == io_writeSelect ? registers_14 : _GEN_45; // @[RegisterFile.scala 25:35]
  wire [31:0] _GEN_47 = 4'hf == io_writeSelect ? registers_15 : _GEN_46; // @[RegisterFile.scala 25:35]
  wire [31:0] _T_1 = io_writeEnable ? io_writeData : _GEN_47; // @[RegisterFile.scala 25:35]
  assign io_out_A = 4'hf == io_sel_A ? registers_15 : _GEN_14; // @[RegisterFile.scala 21:12]
  assign io_out_B = 4'hf == io_sel_B ? registers_15 : _GEN_30; // @[RegisterFile.scala 22:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  registers_3 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  registers_4 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  registers_5 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  registers_6 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  registers_7 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  registers_8 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  registers_9 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  registers_10 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  registers_11 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  registers_12 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  registers_13 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  registers_14 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  registers_15 = _RAND_12[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (4'h3 == io_writeSelect) begin
      if (io_writeEnable) begin
        registers_3 <= io_writeData;
      end else if (4'hf == io_writeSelect) begin
        registers_3 <= registers_15;
      end else if (4'he == io_writeSelect) begin
        registers_3 <= registers_14;
      end else if (4'hd == io_writeSelect) begin
        registers_3 <= registers_13;
      end else if (4'hc == io_writeSelect) begin
        registers_3 <= registers_12;
      end else if (4'hb == io_writeSelect) begin
        registers_3 <= registers_11;
      end else if (4'ha == io_writeSelect) begin
        registers_3 <= registers_10;
      end else if (4'h9 == io_writeSelect) begin
        registers_3 <= registers_9;
      end else if (4'h8 == io_writeSelect) begin
        registers_3 <= registers_8;
      end else if (4'h7 == io_writeSelect) begin
        registers_3 <= registers_7;
      end else if (4'h6 == io_writeSelect) begin
        registers_3 <= registers_6;
      end else if (4'h5 == io_writeSelect) begin
        registers_3 <= registers_5;
      end else if (4'h4 == io_writeSelect) begin
        registers_3 <= registers_4;
      end else if (!(4'h3 == io_writeSelect)) begin
        if (4'h2 == io_writeSelect) begin
          registers_3 <= 32'h14;
        end else if (4'h1 == io_writeSelect) begin
          registers_3 <= 32'h13;
        end else begin
          registers_3 <= 32'h0;
        end
      end
    end
    if (4'h4 == io_writeSelect) begin
      if (io_writeEnable) begin
        registers_4 <= io_writeData;
      end else if (4'hf == io_writeSelect) begin
        registers_4 <= registers_15;
      end else if (4'he == io_writeSelect) begin
        registers_4 <= registers_14;
      end else if (4'hd == io_writeSelect) begin
        registers_4 <= registers_13;
      end else if (4'hc == io_writeSelect) begin
        registers_4 <= registers_12;
      end else if (4'hb == io_writeSelect) begin
        registers_4 <= registers_11;
      end else if (4'ha == io_writeSelect) begin
        registers_4 <= registers_10;
      end else if (4'h9 == io_writeSelect) begin
        registers_4 <= registers_9;
      end else if (4'h8 == io_writeSelect) begin
        registers_4 <= registers_8;
      end else if (4'h7 == io_writeSelect) begin
        registers_4 <= registers_7;
      end else if (4'h6 == io_writeSelect) begin
        registers_4 <= registers_6;
      end else if (4'h5 == io_writeSelect) begin
        registers_4 <= registers_5;
      end else if (!(4'h4 == io_writeSelect)) begin
        if (4'h3 == io_writeSelect) begin
          registers_4 <= registers_3;
        end else if (4'h2 == io_writeSelect) begin
          registers_4 <= 32'h14;
        end else if (4'h1 == io_writeSelect) begin
          registers_4 <= 32'h13;
        end else begin
          registers_4 <= 32'h0;
        end
      end
    end
    if (4'h5 == io_writeSelect) begin
      if (io_writeEnable) begin
        registers_5 <= io_writeData;
      end else if (4'hf == io_writeSelect) begin
        registers_5 <= registers_15;
      end else if (4'he == io_writeSelect) begin
        registers_5 <= registers_14;
      end else if (4'hd == io_writeSelect) begin
        registers_5 <= registers_13;
      end else if (4'hc == io_writeSelect) begin
        registers_5 <= registers_12;
      end else if (4'hb == io_writeSelect) begin
        registers_5 <= registers_11;
      end else if (4'ha == io_writeSelect) begin
        registers_5 <= registers_10;
      end else if (4'h9 == io_writeSelect) begin
        registers_5 <= registers_9;
      end else if (4'h8 == io_writeSelect) begin
        registers_5 <= registers_8;
      end else if (4'h7 == io_writeSelect) begin
        registers_5 <= registers_7;
      end else if (4'h6 == io_writeSelect) begin
        registers_5 <= registers_6;
      end else if (!(4'h5 == io_writeSelect)) begin
        if (4'h4 == io_writeSelect) begin
          registers_5 <= registers_4;
        end else if (4'h3 == io_writeSelect) begin
          registers_5 <= registers_3;
        end else if (4'h2 == io_writeSelect) begin
          registers_5 <= 32'h14;
        end else if (4'h1 == io_writeSelect) begin
          registers_5 <= 32'h13;
        end else begin
          registers_5 <= 32'h0;
        end
      end
    end
    if (4'h6 == io_writeSelect) begin
      if (io_writeEnable) begin
        registers_6 <= io_writeData;
      end else if (4'hf == io_writeSelect) begin
        registers_6 <= registers_15;
      end else if (4'he == io_writeSelect) begin
        registers_6 <= registers_14;
      end else if (4'hd == io_writeSelect) begin
        registers_6 <= registers_13;
      end else if (4'hc == io_writeSelect) begin
        registers_6 <= registers_12;
      end else if (4'hb == io_writeSelect) begin
        registers_6 <= registers_11;
      end else if (4'ha == io_writeSelect) begin
        registers_6 <= registers_10;
      end else if (4'h9 == io_writeSelect) begin
        registers_6 <= registers_9;
      end else if (4'h8 == io_writeSelect) begin
        registers_6 <= registers_8;
      end else if (4'h7 == io_writeSelect) begin
        registers_6 <= registers_7;
      end else if (!(4'h6 == io_writeSelect)) begin
        if (4'h5 == io_writeSelect) begin
          registers_6 <= registers_5;
        end else if (4'h4 == io_writeSelect) begin
          registers_6 <= registers_4;
        end else if (4'h3 == io_writeSelect) begin
          registers_6 <= registers_3;
        end else if (4'h2 == io_writeSelect) begin
          registers_6 <= 32'h14;
        end else if (4'h1 == io_writeSelect) begin
          registers_6 <= 32'h13;
        end else begin
          registers_6 <= 32'h0;
        end
      end
    end
    if (4'h7 == io_writeSelect) begin
      registers_7 <= _T_1;
    end
    if (4'h8 == io_writeSelect) begin
      registers_8 <= _T_1;
    end
    if (4'h9 == io_writeSelect) begin
      registers_9 <= _T_1;
    end
    if (4'ha == io_writeSelect) begin
      registers_10 <= _T_1;
    end
    if (4'hb == io_writeSelect) begin
      registers_11 <= _T_1;
    end
    if (4'hc == io_writeSelect) begin
      registers_12 <= _T_1;
    end
    if (4'hd == io_writeSelect) begin
      registers_13 <= _T_1;
    end
    if (4'he == io_writeSelect) begin
      registers_14 <= _T_1;
    end
    if (4'hf == io_writeSelect) begin
      registers_15 <= _T_1;
    end
  end
endmodule
