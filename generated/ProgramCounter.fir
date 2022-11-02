;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ProgramCounter : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip stop : UInt<1>, flip jump : UInt<1>, flip run : UInt<1>, flip programCounterJump : UInt<16>, programCounter : UInt<16>}
    
    reg currentLine : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ProgramCounter.scala 14:28]
    node _T = eq(io.stop, UInt<1>("h00")) @[ProgramCounter.scala 15:32]
    node run_and_stop = and(io.run, _T) @[ProgramCounter.scala 15:29]
    node _T_1 = eq(run_and_stop, UInt<1>("h01")) @[ProgramCounter.scala 17:21]
    when _T_1 : @[ProgramCounter.scala 17:32]
      node _T_2 = eq(io.jump, UInt<1>("h01")) @[ProgramCounter.scala 18:32]
      node _T_3 = add(currentLine, UInt<16>("h01")) @[ProgramCounter.scala 18:77]
      node _T_4 = tail(_T_3, 1) @[ProgramCounter.scala 18:77]
      node _T_5 = mux(_T_2, io.programCounterJump, _T_4) @[ProgramCounter.scala 18:23]
      currentLine <= _T_5 @[ProgramCounter.scala 18:17]
      skip @[ProgramCounter.scala 17:32]
    io.programCounter <= currentLine @[ProgramCounter.scala 21:21]
    
