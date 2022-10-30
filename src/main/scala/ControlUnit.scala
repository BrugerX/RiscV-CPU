import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val opcode_function = Input(UInt(4.W))
    val control_signal = Output(UInt(12.W))
  })

  //Implement this module here
  switch (io.opcode_function){
    is ("b0000".U) {io.control_signal := "b100000100000".U} //Type A - add
    is ("b0001".U) {io.control_signal := "b100001100000".U} // - sub
    is ("b0010".U) {io.control_signal := "b100010100000".U} // - mul
  }

}