`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2026 15:31:52
// Design Name: 
// Module Name: RIPPLE_CARRY_ADDER
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RIPPLE_CARRY_ADDER(input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout);
wire w1,w2,w3;

fulladder FA1(a[0],b[0],cin,sum[0],w1);
fulladder FA2(a[1],b[1],w1,sum[1],w2);
fulladder FA3(a[2],b[2],w2,sum[2],w3);
fulladder FA4(a[3],b[3],w3,sum[3],cout);


endmodule
