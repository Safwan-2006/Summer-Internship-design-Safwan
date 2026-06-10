`timescale 1ns / 1ps
module top_module(
    input clk,
    input rst,
    input [7:0] sin,
    output [7:0] dout
);

wire [7:0] fifo_in;
wire [7:0] fifo_out;

wire wr_en;
wire full;
wire empty;
wire rdenb; 

// Input Instance
face_module U1(
    sin,
    clk,
    full,
    fifo_in,
    wr_en
);

// FIFO Instance
FIFO U2 (
    clk,
    rst,
    wr_en,
    rdenb,
    fifo_in,
    fifo_out,
    full,
    empty
);

// Output Instance
output_face_module U3 (
    clk,
    rst,
    empty,
    rdenb,
    fifo_out,
    dout
);
endmodule