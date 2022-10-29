import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)

    //A-operations
    val in_A = Input(UInt(32.W))
    val in_B = Input(UInt(32.W))
    val function_Select = Input(UInt(2.W))
    val ALU_Output = Output(UInt(32.W))
    val ALU_Equal = Output(Bool())
  })

  //Implement this module here
  val outputMux = Wire(Vec(3, UInt(32.W)))
  outputMux(0) := io.in_A + io.in_B
  outputMux(1) := io.in_A - io.in_B
  outputMux(2) := io.in_A * io.in_B

  io.ALU_Output := outputMux(io.function_Select)

  io.ALU_Equal := Mux(outputMux(0) === 0.U,true.B, false.B)

}
