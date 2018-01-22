/*
EX_MA:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module EX_MA (
              input Clk
              );
              
wire Clk;
reg [31:0] Instruction,pc_current,BranchTarget,Op2,AluResult1;
reg IsSt, IsLd, IsBeq, IsBgt, IsRet, IsImmediate, IsWb, IsUBranch, IsCall;
reg [4:0] AluSignal;

                   always @(negedge Clk)
                   begin
                   # 9.99
                   Instruction   <= P.PR2.Instruction;
                   pc_current    <= P.PR2.pc_current;
                   BranchTarget  <= P.PR2.BranchTarget;
                   Op2           <= P.PR2.Op2;
                   IsSt          <= P.PR2.IsSt;
                   IsLd          <= P.PR2.IsLd;
                   IsBeq         <= P.PR2.IsBeq;
                   IsBgt         <= P.PR2.IsBgt;
                   IsRet         <= P.PR2.IsRet;
                   IsImmediate   <= P.PR2.IsImmediate;
                   IsWb          <= P.PR2.IsWb;
                   IsUBranch     <= P.PR2.IsUBranch;
                   IsCall        <= P.PR2.IsCall;
                   AluSignal     <= P.PR2.AluSignal;
                   AluResult1    <= P.AluResult1;
                   end
                   
                   endmodule


