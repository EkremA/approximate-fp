
module rshift_layer #(
    parameter MAXSHIFT = 4,
    parameter WIDTH = 8
)(
    input wire [WIDTH-1:0] in,
    input wire sel,
    output wire [WIDTH-1:0] out
);
        //functional description ("shift zeros in")
        //assign out = sel ? in << SHIFT : in >> SHIFT;
        genvar i;
        generate
            for(i = MAXSHIFT; i < WIDTH; i = i + 1) begin
                mux_2to1 muxlayer(.a(in[WIDTH-1-i]), .b(in[WIDTH-1-i+MAXSHIFT]), .sel(sel), .out(out[WIDTH-1-i]));
            end
            for (i = 0; i < MAXSHIFT; i = i + 1) begin
                mux_2to1 muxlayer(.a(in[WIDTH-1-i]), .b(0), .sel(sel), .out(out[WIDTH-1-i]));
            end
        endgenerate
endmodule