/*
OF_EX:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module OF_EX (
              input Clk
              );
              
wire Clk;
reg [31:0] Instruction,pc_current,BranchTarget,Op2,Op1,Immx;
reg IsSt, IsLd, IsBeq, IsBgt, IsRet, IsImmediate, IsWb, IsUBranch, IsCall;
reg [4:0] AluSignal;

                   always @(negedge Clk )
                   begin
                   # 9.99
                   Instruction   <= P.PR1.Instruction;
                   pc_current    <= P.PR1.pc_current;
                   BranchTarget  = P.BranchTarget;
                   Op1           = P.Op1;
                   Op2           = P.Op2;
                   IsSt          = P.IsSt;
                   IsLd          = P.IsLd;
                   IsBeq         = P.IsBeq;
                   IsBgt         = P.IsBgt;
                   IsRet         = P.IsRet;
                   IsImmediate   = P.IsImmediate;
                   IsWb          = P.IsWb;
                   IsUBranch     = P.IsUBranch;
                   IsCall        = P.IsCall;
                   AluSignal     = P.AluSignal;
                   Immx          = P.Immx;
                   
                   end
                   
                   endmodule
