`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ekrem Altuntop
// 
// Create Date: 05/31/2024 06:34:44 PM
// Design Name: 
// Module Name: tb_lzc_2bitaligned_bigendian
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

module tb_lzc_2bitaligned_bigendian();
    parameter W = 28;
    reg [W-1:0] b;
    wire [$clog2(W)-1:0] p;
    wire v;
    
    lzc_2bitaligned_bigendian #(.WIDTH(28)) dut (.b(b),.p(p),.v(v));
    
    initial begin
        // Initialize inputs
        b = {{20{1'b1}},{8'b10101010}};
        #1;
        b = {{20{1'b1}},{8'b10101100}};
        #1;
        b = {{20{1'b1}},{8'b10101000}};
        #1;
        b = {{20{1'b1}},{8'b10101011}};
        #1;
        $finish;
    end
endmodule