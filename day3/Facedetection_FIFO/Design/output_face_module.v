`timescale 1ns / 1ps

module output_face_module(
    input clk,
    input rst,
    input empty,
    output reg rdenb,
    input [7:0] din,
    output reg [7:0] dout
);

parameter IDLE = 2'b00;
parameter S1   = 2'b01;
parameter S2   = 2'b10;

reg [1:0] ps, ns;


always @(*) begin
    if (!empty && ps == S1) 
        rdenb = 1'b1; 
    else 
        rdenb = 1'b0;
end

// Sequential State and Output Registers
always @(posedge clk) begin
    if (rst) begin
        ps   <= IDLE;
        dout <= 8'b0;
    end
    else begin
        ps <= ns;
        if (ps == S2)
            dout <= din; 
    end
end

// Next State Decoder
always @(*) begin
    case(ps)
        IDLE    : ns = (!empty) ? S1 : IDLE; 
        S1      : ns = S2;
        S2      : ns = IDLE;
        default : ns = IDLE;
    endcase
end

endmodule