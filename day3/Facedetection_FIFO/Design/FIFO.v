`timescale 1ns / 1ps

module FIFO(
    input clk, 
    input rst, 
    input wrenb, 
    input rdenb,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg full, 
    output reg empty
);
            
    reg [7:0] mem[7:0];
    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;
    reg [3:0] count; 
            
    integer i;
            
    always @(posedge clk) begin
        if (rst) begin
            wr_ptr   <= 3'b0;
            rd_ptr   <= 3'b0;
            count    <= 4'b0;
            data_out <= 8'b0;
            for(i=0; i<8; i=i+1) begin
                mem[i] <= 8'b0;
            end
        end 
        else begin
            if (wrenb && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr      <= wr_ptr + 1'b1;
            end
            
            if (rdenb && !empty) begin 
                data_out <= mem[rd_ptr];
                rd_ptr   <= rd_ptr + 1'b1;
            end

            if ((wrenb && !full) && !(rdenb && !empty))
                count <= count + 1'b1;
            else if (!(wrenb && !full) && (rdenb && !empty))
                count <= count - 1'b1;
        end
    end

    always @(*) begin
        full  = (count == 4'd8);
        empty = (count == 4'd0);
    end
                
endmodule