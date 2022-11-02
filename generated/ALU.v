module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_in_A,
  input  [31:0] io_in_B,
  input  [1:0]  io_function_Select,
  output [31:0] io_ALU_Output,
  output        io_ALU_Equal,
  output [9:0]  io_part_of_bit
);
  wire [31:0] outputMux_0 = io_in_A + io_in_B; // @[ALU.scala 19:27]
  wire [31:0] outputMux_1 = io_in_A - io_in_B; // @[ALU.scala 20:27]
  wire [63:0] _T_4 = io_in_A * io_in_B; // @[ALU.scala 21:27]
  wire [31:0] _GEN_1 = 2'h1 == io_function_Select ? outputMux_1 : outputMux_0; // @[ALU.scala 23:17]
  wire [31:0] outputMux_2 = _T_4[31:0]; // @[ALU.scala 18:23 ALU.scala 21:16]
  assign io_ALU_Output = 2'h2 == io_function_Select ? outputMux_2 : _GEN_1; // @[ALU.scala 23:17]
  assign io_ALU_Equal = outputMux_0 == 32'h0; // @[ALU.scala 25:16]
  assign io_part_of_bit = 10'h155; // @[ALU.scala 26:18]
endmodule
