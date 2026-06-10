`timescale 1ns / 1ps

module top_module_tb;

reg clk;
reg rst;
reg [7:0] sin;

wire [7:0] dout;

top_module dut(
    clk,
    rst,
    sin,
    dout
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset
initial
begin
    rst = 1'b1;
    sin = 8'd0;
   #10;
    rst = 1'b0;
end

integer i;

initial
begin
   wait(rst == 0);

    for(i=1; i<=30; i=i+1)
    begin
        @(posedge clk);
        sin <= i;
    end

end

initial
begin
    #500;
    $finish;
end

endmodule


