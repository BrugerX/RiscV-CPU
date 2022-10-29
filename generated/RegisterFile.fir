;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit RegisterFile : 
  module RegisterFile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out_A : UInt<32>, out_B : UInt<32>, flip sel_A : UInt<4>, flip sel_B : UInt<4>, flip writeEnable : UInt<1>, flip writeData : UInt<32>, flip writeSelect : UInt<4>}
    
    reg registers : UInt<32>[16], clock @[RegisterFile.scala 19:22]
    registers[UInt<1>("h00")] <= UInt<32>("h00") @[RegisterFile.scala 22:18]
    registers[UInt<1>("h01")] <= UInt<32>("h013") @[RegisterFile.scala 23:18]
    registers[UInt<2>("h02")] <= UInt<32>("h014") @[RegisterFile.scala 24:18]
    io.out_A <= registers[io.sel_A] @[RegisterFile.scala 26:12]
    io.out_B <= registers[io.sel_B] @[RegisterFile.scala 27:12]
    node _T = and(io.writeEnable, UInt<1>("h01")) @[RegisterFile.scala 30:51]
    node _T_1 = mux(_T, io.writeData, registers[io.writeSelect]) @[RegisterFile.scala 30:35]
    registers[io.writeSelect] <= _T_1 @[RegisterFile.scala 30:29]
    
