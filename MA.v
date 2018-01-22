/*
MA:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 23/12/2017
*/

module MA(
          input [31:0] Op2,
          input [31:0] AluResult1,
          input IsLd,
          input IsSt,
          output [31:0] LdResult
          );         
wire [31:0] Op2,AluResult1;
wire IsLd,IsSt;
reg [31:0] LdResult;

//---------------------------------------

           always @(*)
           begin
                                       // waiting for aluresult to come.
           if (IsLd == 1)
           begin
           P.Am1    = AluResult1 ;
           LdResult = P.Dm1;
           P.RW     = 0;
          end
          else if ( IsSt == 1)
          begin
         
           P.RW  = 1;
           P.Am2 = AluResult1 ;
           P.Dm3 = Op2 ;
          end
          
          end
          endmodule 
         
