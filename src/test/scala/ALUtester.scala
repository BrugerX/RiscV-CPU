import chisel3._
import chisel3.iotesters.PeekPokeTester


class ALUtester(dut: ALU) extends PeekPokeTester(dut) {

  //Program Counter running for 5 clock cycles
  poke(dut.io.in_A, 0.U(32.W))
  poke(dut.io.in_B, 1.U(32.W))
  poke(dut.io.function_Select,0.U(2.W))
  peek(dut.io.ALU_Output)
  peek(dut.io.ALU_Equal)
  step(1)

  //Program Counter running for 5 clock cycles
  poke(dut.io.in_A, 50.U(32.W))
  poke(dut.io.in_B, 1.U(32.W))
  poke(dut.io.function_Select, 0.U(2.W))
  peek(dut.io.ALU_Output)
  peek(dut.io.ALU_Equal)
}

object ALUtester {
  def main(args: Array[String]): Unit = {
    println("Testing ALU")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ProgramCounter"),
      () => new ALU()) {
      c => new ALUtester(c)
    }
  }
}
