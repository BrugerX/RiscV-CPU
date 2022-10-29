import chisel3._
import chisel3.util._

class ProgramCounter extends Module {
  val io = IO(new Bundle {
    val stop = Input(Bool())
    val jump = Input(Bool())
    val run = Input(Bool())
    val programCounterJump = Input(UInt(16.W))
    val programCounter = Output(UInt(16.W))
  })

  //Implement this module here (respect the provided interface, since it used by the tester)
  val reg1 = RegInit(0.U(16.W)) //We can count up to instruction 2^16 > 65k, which is far beyond what we need, using a single register
  val run_and_stop = io.run && !(io.stop) //A change in either condition triggers the same reaction

  when(run_and_stop === true.B){ //Implicit muxiplexer
    reg1 := Mux(io.jump === true.B,io.programCounterJump,reg1 + 1.U)
  }

  io.programCounter := reg1

}