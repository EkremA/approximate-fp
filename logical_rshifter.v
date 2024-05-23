
module logical_rshifter #(
    WIDTH=8
)(
    input wire [WIDTH-1:0] in, 
    input wire [$clog2(WIDTH)-1:0] sel,
    output wire [WIDTH-1:0] outwire
);
    // This module expects that WIDTH is of form 2^n with n being a natural number
    wire [WIDTH-1:0] inputBuses [$clog2(WIDTH)-1:0];  // [layer] [inputBit]
    wire [WIDTH-1:0] outputBuses [$clog2(WIDTH)-1:0]; // [layer] [outputBit]
    genvar i;
    generate 
        //generate all layers and connect to interconnects for pipelining
        for(i = $clog2(WIDTH)-1; i >= 0; i = i - 1) begin
                parameter I = (1<<i);
                if(i==$clog2(WIDTH)-1) begin 
                    rshift_layer #(.MAXSHIFT(I), .WIDTH(WIDTH)) layerObj(.in(in), .sel(sel[i]), .out(outputBuses[i]));
                end else if (i==0) begin
                    assign inputBuses[i] = outputBuses[i+1];
                    rshift_layer #(.MAXSHIFT(I), .WIDTH(WIDTH)) layerObj(.in(inputBuses[i]), .sel(sel[i]), .out(outwire));
                end else begin 
                    assign inputBuses[i] = outputBuses[i+1];
                    rshift_layer #(.MAXSHIFT(I), .WIDTH(WIDTH)) layerObj(.in(inputBuses[i]), .sel(sel[i]), .out(outputBuses[i]));
                end
        end
    endgenerate
endmodule