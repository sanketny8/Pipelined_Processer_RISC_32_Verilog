/*
Pipeline:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/
`timescale 1 ns/ 1 ns
`include "IF.v"
`include "OF.v"
`include "EX.v"
`include "MA.v"
`include "WB.v"
`include "Control.v"
`include "Register_File.v"
`include "Memory.v"
`include "Alu.v"
`include "IF_OF.v"
`include "OF_EX.v"
`include "EX_MA.v"
`include "MA_WB.v"
module Pipeline (
                   input Clk
                   );
 
wire Clk;
wire IsLd,IsSt,IsBeq,IsBgt,IsRet,IsImmediate,IsWb,IsUBranch,IsCall,I,IsBranchTaken;
wire [31:0] BranchPC,pc_current,Instruction,Immx,Op1,Op2,BranchTarget,AluResult,AluResult1,LdResult,Dm1,Dm2,D1,D2;
reg [31:0]A,B,Am1,Am2,Dm3,D3,PC;
reg [3:0] A1,A2,A3;
wire [4:0] AluSignal;
wire [4:0]Opcode;
wire [1:0] Flags;
wire [3:0] Rd;
integer ind1,i2,i3;
reg RW,Reset;
//-------------------------------------------

// ---------CREATING--INSTANCES--------------

     
     IF                    IF1(.Clk(Clk),.IsBranchTaken(IsBranchTaken),.BranchPC(BranchPC),.pc_current(pc_current),.Instruction(Instruction) );
     IF_OF                 PR1( .Clk(Clk));
     
     OF                    OF1(.Instruction(PR1.Instruction),.pc_current(PR1.pc_current),.IsRet(IsRet),.IsSt(IsSt),.Opcode(Opcode),.I(I),.Immx(Immx),
                                   .BranchTarget(BranchTarget),.Op1(Op1),.Op2(Op2),.Rd(Rd));
                                   
     OF_EX                 PR2 (.Clk (Clk));                              
     EX                    EX1(.IsRet(PR2.IsRet),.IsBeq(PR2.IsBeq),.IsBgt(PR2.IsBgt),.IsUBranch(PR2.IsUBranch)
                                    ,.IsImmediate(PR2.IsImmediate),.BranchTarget(PR2.BranchTarget),
                                    .AluSignal(PR2.AluSignal),.Op1(PR2.Op1),.Op2(PR2.Op2),.Immx(PR2.Immx),.AluResult1(AluResult1),
                                     .BranchPC(BranchPC),.IsBranchTaken(IsBranchTaken));
                                     
     EX_MA                 PR3 (.Clk(Clk));                                
     MA                    MA1(.Op2(PR3.Op2),.AluResult1(PR3.AluResult1),.IsLd(PR3.IsLd),.IsSt(PR3.IsSt),.LdResult(LdResult));
     
     MA_WB                 PR4 (.Clk(Clk));
     
     WB                    WB1(.IsWb(PR4.IsWb),.IsCall(PR4.IsCall),.IsLd(PR4.IsLd),.Rd(PR4.Rd),
                                      .AluResult1(PR4.AluResult1),.LdResult(PR4.LdResult),.pc_current(PR4.pc_current));
     Control               C1 (.Opcode(Opcode),.I(I),.IsSt(IsSt),.IsLd(IsLd),.IsBeq(IsBeq),.IsBgt(IsBgt),.IsRet(IsRet),.IsImmediate(IsImmediate),
                                     .IsWb(IsWb),.IsUBranch(IsUBranch),.IsCall(IsCall),.AluSignal(AluSignal));
     Register_File         RF1 (.A1(A1),.A2(A2),.A3(A3),.D3(D3),.Reset(Reset),.Clk(Clk),.IsWb(IsWb),.D1(D1),.D2(D2) );
     Memory                M1  (.Am1(Am1),.Am2(Am2),.Dm3(Dm3),.RW(RW),.Dm1(Dm1),.Dm2(Dm2));
     Alu                   ALU1 (.AluSignal(AluSignal),.A(A),.B(B),.AluResult(AluResult),.Flags(Flags));                  
                 
                     
                    
                     
 endmodule                     
                   
                   
                   
