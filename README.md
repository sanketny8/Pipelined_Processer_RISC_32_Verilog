# Pipelined Processer

* It is pipelined version of single cycle processor.
---------------------------------------------------------------------------------------------------------------------
# Description
* It is 5 stage pipeline processor without forwarding path and data lock unit.
* The 5 stages are 

  1. Instruction fetch (IF)
  2. Operand fetch     (OF)
  3. Execute           (EX)
  4. Memory Access     (MA)
  5. Write Back        (WB)
  
* It has 4 Pipeline registers. All are negetive edge clock triggered.
  1. PR1 (IF_OF)
  2. PR2 (OF_EX)
  3. PR3 (EX_MA)
  4. PR4 (MA_WB)
  
  ----------------------------------------------------------------------------------------------------------------------------
   ![ Pipelined Processor](https://github.com/sanketny8/Pipelined_Processer_RISC_32_Verilog/blob/master/68747470733a2f2f756e646572677261642e6878696e672e6d652f56453337302f53696e676c652b4379636c652b536368656d61746963732e706e673f782d736f757263653d676974687562.png)

