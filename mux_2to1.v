`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ekrem Altuntop
// 
// Create Date: 05/14/2024 09:02:21 PM
// Design Name: 
// Module Name: mux_2to1
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

module mux_2to1(
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);

    assign out = sel ? b : a;

endmodule
