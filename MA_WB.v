/*
MA_WB:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module MA_WB (
              input Clk
              );
              
wire Clk;
reg [31:0] Instruction,pc_current,BranchTarget,AluResult1,LdResult;
reg IsSt, IsLd, IsBeq, IsBgt, IsRet, IsImmediate, IsWb, IsUBranch, IsCall;
reg [4:0] AluSignal;
reg [3:0] Rd;

                   always @(negedge Clk)
                   begin
                   # 9.99
                   AluResult1     <= P.PR3.AluResult1;
                   Instruction   <= P.PR3.Instruction;
                   pc_current    <= P.PR3.pc_current;
                   BranchTarget  <= P.PR3.BranchTarget;
                   IsSt          <= P.PR3.IsSt;
                   IsLd          <= P.PR3.IsLd;
                   IsBeq         <= P.PR3.IsBeq;
                   IsBgt         <= P.PR3.IsBgt;
                   IsRet         <= P.PR3.IsRet;
                   IsImmediate   <= P.PR3.IsImmediate;
                   IsWb          <= P.PR3.IsWb;
                   IsUBranch     <= P.PR3.IsUBranch;
                   IsCall        <= P.PR3.IsCall;
                   AluSignal     <= P.PR3.AluSignal;
                   Rd            <= P.PR3.Instruction[25:22];
                   LdResult       = P.LdResult;
                   end
                   
                   endmodule

