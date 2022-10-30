import chisel3._
import chisel3.iotesters.PeekPokeTester


class RFTester(dut: RegisterFile) extends PeekPokeTester(dut) {


  poke(dut.io.sel_A,0.U(4.W))
  poke(dut.io.sel_B,2.U(4.W))
  peek(dut.io.out_A)
  peek(dut.io.out_B)
  poke(dut.io.writeEnable,false.B)
  poke(dut.io.writeSelect,0.U)
  poke(dut.io.writeData,25.U(32.W))
  step(1)



}

object RFTester {
  def main(args: Array[String]): Unit = {
    println("Testing RegisterFile")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ProgramCounter"),
      () => new RegisterFile) {
      c => new RFTester(c)
    }
  }
}
