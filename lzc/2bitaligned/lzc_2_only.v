//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ekrem Altuntop
// 
// Create Date: 05/28/2024 05:53:32 PM
// Design Name: 
// Module Name: lzc_2_only
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


module lzc_2_only(
    input [1:0] b,
    output p,
    output v
);
    assign p = !b[0];
    assign v = b[0] || b[1];
endmodule
