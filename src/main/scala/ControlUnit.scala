import chisel3._
import chisel3.util._

class ControlUnit extends Module {
  val io = IO(new Bundle {
    //Define the module interface here (inputs/outputs)
    val opcode_function = Input(UInt(4.W))
    val control_signal = Output(UInt(12.W))
  })

  //Implement this module here
  io.control_signal := "b110000000010".U //In case of wrong opcode_function we terminate - this is the CU signal for END

  switch (io.opcode_function){
    //Type A
    is ("b0000".U) {io.control_signal := "b100000100000".U} //Add
    is ("b0001".U) {io.control_signal := "b100001100000".U} //Sub
    is ("b0010".U) {io.control_signal := "b100010100000".U} //Mul
    //Type D
    is ("b0100".U) {io.control_signal := "b100000110011".U} //Load
    is ("b0101".U) {io.control_signal := "b100000010110".U} //SAVE
    //TYPE C
    is ("b1001".U) {io.control_signal := "b100100000010".U} //BEQ = BNC
    is ("b1010".U) {io.control_signal := "b101000000010".U} //BNQ
    is ("b1000".U) {io.control_signal := "b110000000010".U} //END
    //TYPE I
    is ("b1100".U) {io.control_signal := "b100000111000".U} //ADDI
    is ("b1101".U) {io.control_signal := "b100001111000".U} //SUBI
    is ("b1110".U) {io.control_signal := "b100010111000".U} //MULI
  }
}