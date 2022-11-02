;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit CPUTop : 
  module ProgramCounter : 
    input clock : Clock
    input reset : Reset
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
    
  module DataMemory : 
    input clock : Clock
    input reset : Reset
    output io : {flip address : UInt<16>, dataRead : UInt<32>, flip writeEnable : UInt<1>, flip dataWrite : UInt<32>, flip testerEnable : UInt<1>, flip testerAddress : UInt<16>, testerDataRead : UInt<32>, flip testerWriteEnable : UInt<1>, flip testerDataWrite : UInt<32>}
    
    cmem memory : UInt<32>[65536] @[DataMemory.scala 18:20]
    when io.testerEnable : @[DataMemory.scala 20:24]
      read mport _T = memory[io.testerAddress], clock @[DataMemory.scala 22:37]
      io.testerDataRead <= _T @[DataMemory.scala 22:23]
      io.dataRead <= UInt<32>("h00") @[DataMemory.scala 23:17]
      when io.testerWriteEnable : @[DataMemory.scala 24:32]
        write mport _T_1 = memory[io.testerAddress], clock
        _T_1 <= io.testerDataWrite
        io.testerDataRead <= io.testerDataWrite @[DataMemory.scala 26:25]
        skip @[DataMemory.scala 24:32]
      skip @[DataMemory.scala 20:24]
    else : @[DataMemory.scala 28:16]
      read mport _T_2 = memory[io.address], clock @[DataMemory.scala 30:31]
      io.dataRead <= _T_2 @[DataMemory.scala 30:17]
      io.testerDataRead <= UInt<32>("h00") @[DataMemory.scala 31:23]
      when io.writeEnable : @[DataMemory.scala 32:26]
        write mport _T_3 = memory[io.address], clock
        _T_3 <= io.dataWrite
        io.dataRead <= io.dataWrite @[DataMemory.scala 34:19]
        skip @[DataMemory.scala 32:26]
      skip @[DataMemory.scala 28:16]
    
  module ProgramMemory : 
    input clock : Clock
    input reset : Reset
    output io : {flip address : UInt<16>, instructionRead : UInt<32>, flip testerEnable : UInt<1>, flip testerAddress : UInt<16>, testerDataRead : UInt<32>, flip testerWriteEnable : UInt<1>, flip testerDataWrite : UInt<32>}
    
    cmem memory : UInt<32>[65536] @[ProgramMemory.scala 16:20]
    when io.testerEnable : @[ProgramMemory.scala 18:24]
      read mport _T = memory[io.testerAddress], clock @[ProgramMemory.scala 20:37]
      io.testerDataRead <= _T @[ProgramMemory.scala 20:23]
      io.instructionRead <= UInt<32>("h00") @[ProgramMemory.scala 21:24]
      when io.testerWriteEnable : @[ProgramMemory.scala 22:32]
        write mport _T_1 = memory[io.testerAddress], clock
        _T_1 <= io.testerDataWrite
        io.testerDataRead <= io.testerDataWrite @[ProgramMemory.scala 24:25]
        skip @[ProgramMemory.scala 22:32]
      skip @[ProgramMemory.scala 18:24]
    else : @[ProgramMemory.scala 26:16]
      read mport _T_2 = memory[io.address], clock @[ProgramMemory.scala 28:38]
      io.instructionRead <= _T_2 @[ProgramMemory.scala 28:24]
      io.testerDataRead <= UInt<32>("h00") @[ProgramMemory.scala 29:23]
      skip @[ProgramMemory.scala 26:16]
    
  module RegisterFile : 
    input clock : Clock
    input reset : Reset
    output io : {out_A : UInt<32>, out_B : UInt<32>, flip sel_A : UInt<4>, flip sel_B : UInt<4>, flip writeEnable : UInt<1>, flip writeData : UInt<32>, flip writeSelect : UInt<4>}
    
    reg registers : UInt<32>[16], clock @[RegisterFile.scala 19:22]
    io.out_A <= registers[io.sel_A] @[RegisterFile.scala 21:12]
    io.out_B <= registers[io.sel_B] @[RegisterFile.scala 22:12]
    node _T = and(io.writeEnable, UInt<1>("h01")) @[RegisterFile.scala 25:51]
    node _T_1 = mux(_T, io.writeData, registers[io.writeSelect]) @[RegisterFile.scala 25:35]
    registers[io.writeSelect] <= _T_1 @[RegisterFile.scala 25:29]
    registers[UInt<4>("h00")] <= UInt<32>("h00") @[RegisterFile.scala 28:23]
    registers[UInt<4>("h01")] <= UInt<32>("h013") @[RegisterFile.scala 29:23]
    registers[UInt<4>("h02")] <= UInt<32>("h014") @[RegisterFile.scala 30:23]
    
  module ControlUnit : 
    input clock : Clock
    input reset : Reset
    output io : {flip opcode_function : UInt<4>, control_signal : UInt<12>}
    
    io.control_signal <= UInt<12>("h0c02") @[ControlUnit.scala 12:21]
    node _T = eq(UInt<1>("h00"), io.opcode_function) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      io.control_signal <= UInt<12>("h0820") @[ControlUnit.scala 16:39]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), io.opcode_function) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        io.control_signal <= UInt<12>("h0860") @[ControlUnit.scala 17:39]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h02"), io.opcode_function) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          io.control_signal <= UInt<12>("h08a0") @[ControlUnit.scala 18:39]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_3 = eq(UInt<3>("h04"), io.opcode_function) @[Conditional.scala 37:30]
          when _T_3 : @[Conditional.scala 39:67]
            io.control_signal <= UInt<12>("h0833") @[ControlUnit.scala 20:39]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_4 = eq(UInt<3>("h05"), io.opcode_function) @[Conditional.scala 37:30]
            when _T_4 : @[Conditional.scala 39:67]
              io.control_signal <= UInt<12>("h0816") @[ControlUnit.scala 21:39]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_5 = eq(UInt<4>("h09"), io.opcode_function) @[Conditional.scala 37:30]
              when _T_5 : @[Conditional.scala 39:67]
                io.control_signal <= UInt<12>("h0902") @[ControlUnit.scala 23:39]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_6 = eq(UInt<4>("h0a"), io.opcode_function) @[Conditional.scala 37:30]
                when _T_6 : @[Conditional.scala 39:67]
                  io.control_signal <= UInt<12>("h0a02") @[ControlUnit.scala 24:39]
                  skip @[Conditional.scala 39:67]
                else : @[Conditional.scala 39:67]
                  node _T_7 = eq(UInt<4>("h08"), io.opcode_function) @[Conditional.scala 37:30]
                  when _T_7 : @[Conditional.scala 39:67]
                    io.control_signal <= UInt<12>("h0c02") @[ControlUnit.scala 25:39]
                    skip @[Conditional.scala 39:67]
                  else : @[Conditional.scala 39:67]
                    node _T_8 = eq(UInt<4>("h0c"), io.opcode_function) @[Conditional.scala 37:30]
                    when _T_8 : @[Conditional.scala 39:67]
                      io.control_signal <= UInt<12>("h0838") @[ControlUnit.scala 27:39]
                      skip @[Conditional.scala 39:67]
                    else : @[Conditional.scala 39:67]
                      node _T_9 = eq(UInt<4>("h0d"), io.opcode_function) @[Conditional.scala 37:30]
                      when _T_9 : @[Conditional.scala 39:67]
                        io.control_signal <= UInt<12>("h0878") @[ControlUnit.scala 28:39]
                        skip @[Conditional.scala 39:67]
                      else : @[Conditional.scala 39:67]
                        node _T_10 = eq(UInt<4>("h0e"), io.opcode_function) @[Conditional.scala 37:30]
                        when _T_10 : @[Conditional.scala 39:67]
                          io.control_signal <= UInt<12>("h08b8") @[ControlUnit.scala 29:39]
                          skip @[Conditional.scala 39:67]
    
  module ALU : 
    input clock : Clock
    input reset : Reset
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip function_Select : UInt<2>, ALU_Output : UInt<32>, ALU_Equal : UInt<1>}
    
    wire outputMux : UInt<32>[3] @[ALU.scala 17:23]
    node _T = add(io.in_A, io.in_B) @[ALU.scala 18:27]
    node _T_1 = tail(_T, 1) @[ALU.scala 18:27]
    outputMux[0] <= _T_1 @[ALU.scala 18:16]
    node _T_2 = sub(io.in_A, io.in_B) @[ALU.scala 19:27]
    node _T_3 = tail(_T_2, 1) @[ALU.scala 19:27]
    outputMux[1] <= _T_3 @[ALU.scala 19:16]
    node _T_4 = mul(io.in_A, io.in_B) @[ALU.scala 20:27]
    outputMux[2] <= _T_4 @[ALU.scala 20:16]
    io.ALU_Output <= outputMux[io.function_Select] @[ALU.scala 22:17]
    node _T_5 = eq(outputMux[1], UInt<1>("h00")) @[ALU.scala 24:36]
    node _T_6 = mux(_T_5, UInt<1>("h01"), UInt<1>("h00")) @[ALU.scala 24:22]
    io.ALU_Equal <= _T_6 @[ALU.scala 24:16]
    
  module CPUTop : 
    input clock : Clock
    input reset : UInt<1>
    output io : {done : UInt<1>, flip run : UInt<1>, flip testerDataMemEnable : UInt<1>, flip testerDataMemAddress : UInt<16>, testerDataMemDataRead : UInt<32>, flip testerDataMemWriteEnable : UInt<1>, flip testerDataMemDataWrite : UInt<32>, flip testerProgMemEnable : UInt<1>, flip testerProgMemAddress : UInt<16>, testerProgMemDataRead : UInt<32>, flip testerProgMemWriteEnable : UInt<1>, flip testerProgMemDataWrite : UInt<32>}
    
    inst programCounter of ProgramCounter @[CPUTop.scala 23:30]
    programCounter.clock <= clock
    programCounter.reset <= reset
    inst dataMemory of DataMemory @[CPUTop.scala 24:26]
    dataMemory.clock <= clock
    dataMemory.reset <= reset
    inst programMemory of ProgramMemory @[CPUTop.scala 25:29]
    programMemory.clock <= clock
    programMemory.reset <= reset
    inst registerFile of RegisterFile @[CPUTop.scala 26:28]
    registerFile.clock <= clock
    registerFile.reset <= reset
    inst controlUnit of ControlUnit @[CPUTop.scala 27:27]
    controlUnit.clock <= clock
    controlUnit.reset <= reset
    inst alu of ALU @[CPUTop.scala 28:19]
    alu.clock <= clock
    alu.reset <= reset
    programMemory.io.address <= programCounter.io.programCounter @[CPUTop.scala 32:28]
    node DM_dataWrite = bits(programMemory.io.instructionRead, 19, 4) @[CPUTop.scala 34:41]
    node _T = bits(programMemory.io.instructionRead, 31, 28) @[CPUTop.scala 36:48]
    controlUnit.io.opcode_function <= _T @[CPUTop.scala 36:34]
    node _T_1 = bits(controlUnit.io.control_signal, 11, 11) @[CPUTop.scala 41:46]
    node _T_2 = eq(_T_1, UInt<1>("h01")) @[CPUTop.scala 41:51]
    node _T_3 = mux(_T_2, UInt<1>("h01"), UInt<1>("h00")) @[CPUTop.scala 41:31]
    node CU_PCRun = and(io.run, _T_3) @[CPUTop.scala 41:25]
    node CU_PCStop = bits(controlUnit.io.control_signal, 10, 10) @[CPUTop.scala 42:33]
    node CU_PCJump = bits(controlUnit.io.control_signal, 9, 8) @[CPUTop.scala 43:33]
    programCounter.io.run <= CU_PCRun @[CPUTop.scala 45:25]
    programCounter.io.stop <= CU_PCStop @[CPUTop.scala 46:26]
    wire branchMux : UInt<1>[3] @[CPUTop.scala 49:23]
    branchMux[0] <= UInt<1>("h00") @[CPUTop.scala 50:16]
    branchMux[1] <= alu.io.ALU_Equal @[CPUTop.scala 51:16]
    node _T_4 = not(alu.io.ALU_Equal) @[CPUTop.scala 52:19]
    branchMux[2] <= _T_4 @[CPUTop.scala 52:16]
    programCounter.io.jump <= branchMux[CU_PCJump] @[CPUTop.scala 53:26]
    node _T_5 = sub(DM_dataWrite, UInt<16>("h01")) @[CPUTop.scala 56:64]
    node _T_6 = tail(_T_5, 1) @[CPUTop.scala 56:64]
    programCounter.io.programCounterJump <= _T_6 @[CPUTop.scala 56:40]
    node CU_functionSelect = bits(controlUnit.io.control_signal, 7, 6) @[CPUTop.scala 60:41]
    node CU_ALUInB = bits(controlUnit.io.control_signal, 4, 3) @[CPUTop.scala 61:33]
    alu.io.in_A <= registerFile.io.out_A @[CPUTop.scala 63:15]
    alu.io.function_Select <= CU_functionSelect @[CPUTop.scala 64:26]
    wire ALU_in_BMux : UInt<32>[4] @[CPUTop.scala 67:25]
    ALU_in_BMux[0] <= registerFile.io.out_B @[CPUTop.scala 68:18]
    ALU_in_BMux[1] <= UInt<32>("h01") @[CPUTop.scala 69:18]
    ALU_in_BMux[2] <= UInt<32>("h00") @[CPUTop.scala 70:18]
    ALU_in_BMux[3] <= DM_dataWrite @[CPUTop.scala 71:18]
    alu.io.in_B <= ALU_in_BMux[CU_ALUInB] @[CPUTop.scala 72:15]
    node CU_RF_WriteEnable = bits(controlUnit.io.control_signal, 5, 5) @[CPUTop.scala 76:41]
    node CU_RF_Load = bits(controlUnit.io.control_signal, 0, 0) @[CPUTop.scala 77:34]
    node CU_RF_R0R2 = bits(controlUnit.io.control_signal, 1, 1) @[CPUTop.scala 78:34]
    registerFile.io.writeEnable <= CU_RF_WriteEnable @[CPUTop.scala 80:31]
    node _T_7 = eq(CU_RF_Load, UInt<1>("h01")) @[CPUTop.scala 81:47]
    node _T_8 = mux(_T_7, dataMemory.io.dataRead, alu.io.ALU_Output) @[CPUTop.scala 81:35]
    registerFile.io.writeData <= _T_8 @[CPUTop.scala 81:29]
    node R0 = bits(programMemory.io.instructionRead, 27, 24) @[CPUTop.scala 84:23]
    node R1 = bits(programMemory.io.instructionRead, 23, 20) @[CPUTop.scala 85:23]
    node R2 = bits(programMemory.io.instructionRead, 19, 16) @[CPUTop.scala 86:23]
    registerFile.io.writeSelect <= R0 @[CPUTop.scala 87:31]
    registerFile.io.sel_A <= R1 @[CPUTop.scala 88:25]
    node _T_9 = eq(CU_RF_R0R2, UInt<1>("h01")) @[CPUTop.scala 89:43]
    node _T_10 = mux(_T_9, R0, R2) @[CPUTop.scala 89:31]
    registerFile.io.sel_B <= _T_10 @[CPUTop.scala 89:25]
    node CU_DM_writeEnable = bits(controlUnit.io.control_signal, 2, 2) @[CPUTop.scala 93:41]
    node DM_Adress = bits(alu.io.ALU_Output, 15, 0) @[CPUTop.scala 94:36]
    dataMemory.io.dataWrite <= DM_dataWrite @[CPUTop.scala 97:27]
    dataMemory.io.address <= DM_Adress @[CPUTop.scala 98:25]
    dataMemory.io.writeEnable <= CU_DM_writeEnable @[CPUTop.scala 99:29]
    io.done <= UInt<1>("h00") @[CPUTop.scala 101:11]
    node _T_11 = eq(controlUnit.io.control_signal, UInt<32>("h0c02")) @[CPUTop.scala 102:23]
    when _T_11 : @[CPUTop.scala 102:51]
      io.done <= UInt<1>("h01") @[CPUTop.scala 103:13]
      skip @[CPUTop.scala 102:51]
    programMemory.io.testerAddress <= io.testerProgMemAddress @[CPUTop.scala 113:34]
    io.testerProgMemDataRead <= programMemory.io.testerDataRead @[CPUTop.scala 114:28]
    programMemory.io.testerDataWrite <= io.testerProgMemDataWrite @[CPUTop.scala 115:36]
    programMemory.io.testerEnable <= io.testerProgMemEnable @[CPUTop.scala 116:33]
    programMemory.io.testerWriteEnable <= io.testerProgMemWriteEnable @[CPUTop.scala 117:38]
    dataMemory.io.testerAddress <= io.testerDataMemAddress @[CPUTop.scala 119:31]
    io.testerDataMemDataRead <= dataMemory.io.testerDataRead @[CPUTop.scala 120:28]
    dataMemory.io.testerDataWrite <= io.testerDataMemDataWrite @[CPUTop.scala 121:33]
    dataMemory.io.testerEnable <= io.testerDataMemEnable @[CPUTop.scala 122:30]
    dataMemory.io.testerWriteEnable <= io.testerDataMemWriteEnable @[CPUTop.scala 123:35]
    
