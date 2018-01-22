/*
Test_Pipeline:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/
`define  td 1000                   // Simulation time
`include "Pipeline.v"
`timescale 1 ns/ 1 ns

module Test_pipeline();

reg Clk;
integer ind1,i2,i3;
reg [64:0] Buffer[32'h1000:0];
integer File,Filem,Temp,count=0;
//--------------------------
 Pipeline  P (.Clk(Clk));

initial 
       begin
       $dumpfile("Pipeline.vcd");
       $dumpvars(0,P);
       Clk  = 0;
       i2=1;
       i3=0;
       P.Reset=1;
       
       
       
//$monitor("t=%t Cl=%b pc=%d In=%h %h %h %h %h",$time,Clk,P.pc_current,P.Instruction,P.PR1.Instruction,P.PR1.Instruction,P.PR1.Instruction,P.PR1.Instruction);
                   // $monitor ("in=%h R1=%h R2=%h R4=%h",P.Instruction,P.RF1.R[1],P.RF1.R[2],P.RF1.R[4]);
                    //---------------------------------------------------------------
                    $display ( "\n\n\t\t\t---------Welcome-to-My-Pipelined Processor---------\n");
                    $display ( "\t\t\t OUTPUT FILE : Updated_data\n");
                   
                    //---------------------------------------------------------------
                     Filem = $fopen("Input_Memory","r");
                     Temp = $fgetc(Filem);
                     while (!$feof(Filem))
                     begin
                     if (Temp == "\n")
                     count=count+1;
                     Temp = $fgetc(Filem); 
                     end       
                     $readmemh("Input_Memory",Buffer,0,count*2-1);
                     for(ind1 = 0;ind1 < 32'h1000;ind1 = ind1 + 1)
                     begin
                     if (i3 == 4)
                     begin      
                     i3 = 0;
                     i2 = i2 + 2 ;
                     end
                     P.M1.Mem[ind1] = Buffer [i2] [8*i3 +: 8];
                     i3 = i3 + 1;
                     
                     end
                     $display ("\t\t\t Total no. Of Instructions = %d\n \t\t\t Simulation Time = %d ns\n",count,`td);
                     
                     //----------------------------------------------------------------- 
       #1 P.Reset = 0;
       
       # `td
       $finish;
       
       end
       //----------------------------------------------------------------------
       initial 
       begin
       #`td
       File=$fopen("Updated_data","w");
       $fdisplay(File,"\t------------------REGISTERS-UPDATED-----------------\t\n");
       for (ind1=0;ind1<16;ind1=ind1+1)
       begin
       $fdisplay(File,"\tR=[%d] = %h\n",ind1,P.RF1.R[ind1]);
       end 
       $fdisplay(File,"\n\t------------------MEMORY-UPDATED-----------------\t\n");
       for(ind1 = 0;ind1 < 32'h1000;ind1 = ind1 + 1)
       begin
       $fdisplay(File,"\tA=%h D=%h \n",ind1,P.M1.Mem[ind1]);
       end
       //-------------------------------------------------------------------------
       $fclose(File);
       
       end
       
       always 
       begin
       # 5 Clk = ~Clk;
       end
       
       endmodule
       
