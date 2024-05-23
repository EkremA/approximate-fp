`timescale 1ns / 1ps

module tb_logical_rshifter #(parameter WIDTH=32);
    reg [WIDTH-1:0] in;
    reg [$clog2(WIDTH)-1:0] sel;
    wire [WIDTH-1:0] out;

    logical_rshifter #(.WIDTH(WIDTH)) dut(.in(in), .sel(sel), .outwire(out));

    initial begin
        // Initialize inputs
        in = {WIDTH{1'b1}};
        sel = 4;
        #1;
        in = {WIDTH{1'b1}};
        sel = 2;
        #1;
        in = {WIDTH{1'b1}};
        sel = 1;
        #1;


        
        
        // Display the inputs and outputs
        $display("in = %b", in);
        $display("sel = %b", sel);
        $display("out = %b", out);
        $display("##############");
        
        $finish;
    end
endmodule