`timescale 1ns / 1ps


module dff(input d,rst,clk,output reg q,qbar

    );
    always@(*)
    begin 
     if(rst)
        begin
            q<=1'b0;
            qbar<=1'b1;
        end
    end
    
    always@(posedge clk)
    begin
       q<=d;
       qbar<=~d;
  end 
    
endmodule