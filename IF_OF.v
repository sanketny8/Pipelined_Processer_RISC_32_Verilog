/*
Pipeline Register:
Author: 2016eeb1087(sanket Nyayadhish)
Date: 26/12/2017
*/

module IF_OF (
              input Clk
               );

wire Clk;
reg [31:0] Instruction,pc_current;

                     always @( negedge Clk)
                     begin
                     # 9.99
                     Instruction  <=  P.Instruction;
                     pc_current   <=  P.pc_current;
                     end
                     
                     endmodule
                 
