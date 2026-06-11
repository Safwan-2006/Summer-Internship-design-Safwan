`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 14:04:20
// Design Name: 
// Module Name: block_memory_generator
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


module block_memory_generator(input clk,arstn,wrenb,
                              input [2:0] write_address,
                              input [2:0] read_address,
                              input [7:0] data_in,
                              output reg [7:0]data_out);
                              
            reg [7:0] ram [7:0];
            
always@(posedge clk or negedge arstn)
begin
    if(arstn==0)
    begin
        data_out<=8'b00000000;
    end  
    else
    begin
        if(wrenb==1)
        begin
            ram[write_address]<=data_in;
        end
        else
        begin
            data_out<=ram[read_address];
        end
    end  
end                      
endmodule
