;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip function_Select : UInt<2>, ALU_Output : UInt<32>, ALU_Equal : UInt<1>, part_of_bit : UInt<10>}
    
    wire outputMux : UInt<32>[3] @[ALU.scala 18:23]
    node _T = add(io.in_A, io.in_B) @[ALU.scala 19:27]
    node _T_1 = tail(_T, 1) @[ALU.scala 19:27]
    outputMux[0] <= _T_1 @[ALU.scala 19:16]
    node _T_2 = sub(io.in_A, io.in_B) @[ALU.scala 20:27]
    node _T_3 = tail(_T_2, 1) @[ALU.scala 20:27]
    outputMux[1] <= _T_3 @[ALU.scala 20:16]
    node _T_4 = mul(io.in_A, io.in_B) @[ALU.scala 21:27]
    outputMux[2] <= _T_4 @[ALU.scala 21:16]
    io.ALU_Output <= outputMux[io.function_Select] @[ALU.scala 23:17]
    node _T_5 = eq(outputMux[0], UInt<1>("h00")) @[ALU.scala 25:36]
    node _T_6 = mux(_T_5, UInt<1>("h01"), UInt<1>("h00")) @[ALU.scala 25:22]
    io.ALU_Equal <= _T_6 @[ALU.scala 25:16]
    io.part_of_bit <= UInt<9>("h0155") @[ALU.scala 26:18]
    
