/*
WB:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module WB (
           input IsWb,
           input IsCall,
           input IsLd,
           input [3:0] Rd,
           input [31:0] AluResult1,
           input [31:0] LdResult,
           input [31:0] pc_current
           );       
wire IsWb,IsCall,IsLd;
wire [31:0] AluResult1,LdResult,pc_current;
wire [3:0] Rd;
//--------------------------------------------------

           always @(*)
           begin
           if (IsWb == 1)
           begin  
               
           if (IsCall == 1)
           begin
           P.A3 = 4'b1111;
           end
           
           else if ( IsCall==0)
           begin
           P.A3 = Rd;
           end
          
           if  (IsLd == 0 && IsCall == 0)
           begin
           P.D3 = AluResult1 ;
           end
           else if ( IsLd == 1 && IsCall == 0)
           begin
           P.D3 = LdResult;
           end
           else if (IsLd == 0 && IsCall == 1)
           begin
           P.D3 = pc_current + 4;
           end
           
           end
           end
           endmodule
           
           
     
