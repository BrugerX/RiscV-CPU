import chisel3._
import chisel3.util._

class CPUTop extends Module {
  val io = IO(new Bundle {
    val done = Output(Bool ())
    val run = Input(Bool ())
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerDataMemEnable = Input(Bool ())
    val testerDataMemAddress = Input(UInt (16.W))
    val testerDataMemDataRead = Output(UInt (32.W))
    val testerDataMemWriteEnable = Input(Bool ())
    val testerDataMemDataWrite = Input(UInt (32.W))
    //This signals are used by the tester for loading and dumping the memory content, do not touch
    val testerProgMemEnable = Input(Bool ())
    val testerProgMemAddress = Input(UInt (16.W))
    val testerProgMemDataRead = Output(UInt (32.W))
    val testerProgMemWriteEnable = Input(Bool ())
    val testerProgMemDataWrite = Input(UInt (32.W))
  })

  //Creating components
  val programCounter = Module(new ProgramCounter())
  val dataMemory = Module(new DataMemory())
  val programMemory = Module(new ProgramMemory())
  val registerFile = Module(new RegisterFile())
  val controlUnit = Module(new ControlUnit())
  val alu = Module(new ALU())

  //Connecting the modules
  programMemory.io.address := programCounter.io.programCounter
  val instruction = programMemory.io.instructionRead
  val instruction_Constant = instruction(27,12) //Used in type C, I and D instructions
  //getting control signals
  controlUnit.io.opcode_function := instruction(3,0)
  val control_signal = controlUnit.io.control_signal

  //*ProgramCounter*
  //Programcounter control signals
  val CU_PCRun = control_signal(11)
  val CU_PCStop = control_signal(1)
  val CU_PCJump = control_signal(3,2)

  programCounter.io.run := CU_PCRun //Run
  programCounter.io.stop := CU_PCStop //Stop

  //Branch multiplexer - jump
  val branchMux = Wire(Vec(3, UInt(1.W)))
  branchMux(0) := false.B
  branchMux(1) := alu.io.ALU_Equal
  branchMux(2) := ~alu.io.ALU_Equal
  programCounter.io.jump := branchMux(CU_PCJump) //Jump

  //Jump size
  programCounter.io.programCounterJump := instruction_Constant

  //*ALU*
  //ALU control signals
  val CU_functionSelect = control_signal(5,4)
  val CU_ALUInB = control_signal(8,7)

  alu.io.in_A := registerFile.io.out_A
  alu.io.function_Select := CU_functionSelect //Function select

  //B multiplexer - ALU_in_B
  val ALU_in_BMux = Wire(Vec(4, UInt(32.W)))
  ALU_in_BMux(0) := registerFile.io.out_B
  ALU_in_BMux(1) := 1.U(32.W)
  ALU_in_BMux(2) := 0.U(32.W)
  ALU_in_BMux(3) := instruction_Constant //The ALU sign extends
  alu.io.in_B := CU_ALUInB //ALU_in_B

  //*REG FILE*
  //RegisterFile control signals
  val CU_RF_WriteEnable = control_signal(6)
  val CU_RF_Load = control_signal(11)
  val CU_RF_R0R2 = control_signal(10)

  registerFile.io.writeEnable := CU_RF_WriteEnable//WriteEnable
  registerFile.io.writeData := Mux(CU_RF_WriteEnable === 1.U,dataMemory.io.dataRead,alu.io.ALU_Output) //Load

  //Register selection
  val R0 = instruction(7,4)
  registerFile.io.writeSelect := R0 //R0
  registerFile.io.sel_A := instruction(11,8) //R1
  registerFile.io.sel_B := Mux(CU_RF_R0R2 === 1.U,R0,instruction(15,12)) //R0 = R2

  //*Data Memory*
  //Control signals
  val CU_DM_writeEnable = control_signal(9)

  dataMemory.io.dataWrite := alu.io.ALU_Output
  dataMemory.io.address := instruction_Constant
  dataMemory.io.writeEnable := CU_DM_writeEnable //Write enable

  io.done := false.B
  when(control_signal === "b110000000010".U(32.W)){
    io.done := true.B
  }


  //Inputting Instructions[
  ////////////////////////////////////////////
  //Continue here with your connections
  ////////////////////////////////////////////

  //This signals are used by the tester for loading the program to the program memory, do not touch
  programMemory.io.testerAddress := io.testerProgMemAddress
  io.testerProgMemDataRead := programMemory.io.testerDataRead
  programMemory.io.testerDataWrite := io.testerProgMemDataWrite
  programMemory.io.testerEnable := io.testerProgMemEnable
  programMemory.io.testerWriteEnable := io.testerProgMemWriteEnable
  //This signals are used by the tester for loading and dumping the data memory content, do not touch
  dataMemory.io.testerAddress := io.testerDataMemAddress
  io.testerDataMemDataRead := dataMemory.io.testerDataRead
  dataMemory.io.testerDataWrite := io.testerDataMemDataWrite
  dataMemory.io.testerEnable := io.testerDataMemEnable
  dataMemory.io.testerWriteEnable := io.testerDataMemWriteEnable
}