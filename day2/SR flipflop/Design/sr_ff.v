`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 12:24:28
// Design Name: 
// Module Name: sr_ff
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 11:55:08
// Design Name: 
// Module Name: sr_latch
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

module sr_ff (
    input s,
    input r,
    input rst,
    input clk,
    output reg q,
    output reg qbar
);

always@(*)
begin
    if (rst)begin
        q <= 1'b1 ;qbar <= 1'b0;
    end
end

always @(posedge clk) begin
        if (s == 0 && r == 0) begin
            q    <= q;
            qbar <= qbar;
        end 
        else if (s == 0 && r == 1) begin
            q    <= 1'b0;
            qbar <= 1'b1;
        end 
        else if (s == 1 && r == 0) begin
            q<= 1'b1;
            qbar <= 1'b0;
        end 
        else if (s == 1 && r == 1) begin
            q    <= 1'bx;
            qbar <= 1'bx;
        end
    end

endmodule

