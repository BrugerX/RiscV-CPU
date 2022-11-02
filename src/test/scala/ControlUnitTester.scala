import chisel3._
import chisel3.iotesters.PeekPokeTester


class ControlUnitTester(dut: ControlUnit) extends PeekPokeTester(dut) {

  //Program Counter running for 5 clock cycles
  poke(dut.io.opcode_function, "b0000".U)
  peek(dut.io.control_signal)
  step(1)

  poke(dut.io.opcode_function, "b0001".U)
  peek(dut.io.control_signal)
  step(1)

  poke(dut.io.opcode_function, "b0010".U)
  peek(dut.io.control_signal)
  step(1)

  poke(dut.io.opcode_function, "b1111".U)
  peek(dut.io.control_signal)
  step(1)
}

object ControlUnitTester {
  def main(args: Array[String]): Unit = {
    println("Testing ALU")
    iotesters.Driver.execute(
      Array("--generate-vcd-output", "on",
        "--target-dir", "generated",
        "--top-name", "ProgramCounter"),
      () => new ControlUnit()) {
      c => new ControlUnitTester(c)
    }
  }
}
