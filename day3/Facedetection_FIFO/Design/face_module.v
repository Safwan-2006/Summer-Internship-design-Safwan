`timescale 1ns / 1ps

module face_module(
    input [7:0] s_in,
    input clk,
    input fifo_full,
    output reg [7:0] s_out,
    output reg wr_en
);
    
    always @(posedge clk) begin 
        if (!fifo_full) begin
            s_out <= s_in;
            wr_en <= 1'b1;
        end else begin
            wr_en <= 1'b0;
        end
    end 
    
endmodule


