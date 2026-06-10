`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:17:06
// Design Name: 
// Module Name: seq_detector_1110
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


module seq_detector_1110(input clk,rst,din,output reg detected);

parameter idle=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;

reg [1:0]ps,ns;

//present state logic

always@(posedge clk)
begin
    if(rst)
            ps<=idle;
    else
        ps<=ns;
    
end

//Next state Logic

always@(*)
begin
    case(ps)
    
        idle:begin
              detected=0;
            if(din==0)
                ns=idle;
            else
                ns=s1;
            end
            
          s1:begin
              detected=0;
            if(din==0)
                ns=idle;
            else
                ns=s2;
            end
            
            s2:begin
              detected=0;
            if(din==0)
                ns=idle;
            else
                ns=s3;
            end
            
            s3: begin
            if(din==0) begin
                detected = 1;  
                ns = idle;       
            end
            else begin
                detected = 0;  
                ns = s3;       
            end
        end
    endcase
end
endmodule
