import chisel3._
import chisel3.util._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    //Data reading
    val out_A = Output(UInt(32.W))
    val out_B = Output(UInt(32.W))
    val sel_A = Input(UInt(4.W))
    val sel_B = Input(UInt(4.W))

    //Data writing
    val writeEnable = Input(Bool())
    val writeData = Input(UInt(32.W))
    val writeSelect = Input(UInt(4.W))
  })

  //Register initialization
  val registers = Reg(Vec(16, UInt(32.W)))

  io.out_A := registers(io.sel_A)
  io.out_B := registers(io.sel_B)


  registers(io.writeSelect) := Mux(io.writeEnable && true.B,io.writeData,registers(io.writeSelect))

  //Constants pre-defined in the RF: R0 =0, R1 = 19, R2 = 20
  registers(0.U) := 0.U(32.W)
  registers(1.U) := 19.U(32.W)
  registers(2.U) := 20.U(32.W)

}