
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ekrem Altuntop
// 
// Create Date: 05/28/2024 10:31:38 PM
// Design Name: 
// Module Name: lzc_bigendian
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Parametrised LZC based on algorithm by Oklobdzija et al. 1994, takes any word of width WIDTH in Big Endian format
//              and returns a count of leading zeros as well as a validity bit.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module lzc_bigendian #(
    WIDTH=8
) (
    input wire [WIDTH-1:0] b,
    output wire [$clog2(WIDTH)-1:0] p,
    output wire v  
);
    //Assume WIDTH is 2^n
    //Big Endian
    wire [WIDTH/2-1:0] v_values [$clog2(WIDTH)-1:0];
    wire [WIDTH/2-1:0] p_values [$clog2(WIDTH)-1:0];
    genvar i;
    genvar lidx;
    generate
        for(lidx = 0; lidx < $clog2(WIDTH); lidx = lidx + 1) begin
            if (lidx==0) begin
                for (i = 0; i<WIDTH/2; i = i+1) begin
                    lzc_2_only lzc2_obj(.b(b[2*i+1:2*i]), .p(p_values[0][i]), .v(v_values[0][i]));
                end
            end else if (lidx==$clog2(WIDTH)-1 && lidx>0 && WIDTH%2==0) begin
                parameter C = $clog2(WIDTH)-1;
                mux_2Nto1N_1Sel #(.N($clog2(WIDTH))) mux_obj(.word0({1'b1,{p_values[lidx-1][C+C-1:C]}}), 
                                                             .word1({1'b0,{p_values[lidx-1][C-1:0]}}),
                                                             .sel(v_values[lidx-1][0]),
                                                             .output_word(p));
                assign v = v_values[lidx-1][1];
            end else if (lidx==$clog2(WIDTH)-1 && lidx>0 && WIDTH%2!=0) begin
                parameter C = $clog2(WIDTH)-1;
                mux_2Nto1N_1Sel #(.N($clog2(WIDTH))) mux_obj(.word0({1'b1,{p_values[lidx-1][C+C-1:C]}}), 
                                                             .word1({1'b0,{p_values[lidx-1][C-1:0]}}),
                                                             .sel(v_values[lidx-1][0]),
                                                             .output_word(p_values[lidx][(i+1)*(lidx+1)-1:i*(lidx+1)]));
                
                mux_2Nto1N_1Sel #(.N($clog2(WIDTH))) mux_obj(.word0({$clog2(WIDTH)'b1}), 
                                                             .word1(p_values[lidx][(i+1)*(lidx+1)-1:i*(lidx+1)]),
                                                             .sel(v_values[lidx-1][1]),
                                                             .output_word(p));
                assign v = v_values[lidx-1][1] || b[WIDTH-1];
            end
            else begin
                for(i = 0; i < WIDTH/lidx/4; i = i + 1) begin
                    mux_2Nto1N_1Sel #(.N(lidx+1)) mux_obj(.word0({1'b1,{p_values[lidx-1][(i+2)*lidx-1:(i+1)*lidx]}}), 
                                                          .word1({1'b0,{p_values[lidx-1][(i+1)*lidx-1:i*lidx]}}),
                                                          .sel(v_values[lidx-1][i]),
                                                          .output_word(p_values[lidx][(i+1)*(lidx+1)-1:i*(lidx+1)]));
                    assign v_values[lidx][i] = v_values[lidx-1][i+1];                                       
                end
            end
        end
    endgenerate
endmodule
