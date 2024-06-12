//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ekrem Altuntop
// 
// Create Date: 05/28/2024 10:52:11 PM
// Design Name: 
// Module Name: mux_2Nto1N_1Sel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mux_2Nto1N_1Sel #(N=2) (
    input [N-1:0] word0,
    input [N-1:0] word1,
    input sel,
    output wire [N-1:0] output_word
);
    //if sel==1 then word1
    assign output_word = sel ? word1 : word0;

endmodule