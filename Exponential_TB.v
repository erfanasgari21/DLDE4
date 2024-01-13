`timescale 1ns/1ns
module Exponential_TB();
    reg clk, rst, engStart;
    reg [15:0]engX;
    wire engDone;
    wire [15:0]frac;
    wire [1:0]int;

    exponential exponential_instance(clk, rst, engStart, engX, engDone, int, frac);
    initial begin
        clk = 0;
        rst = 1;
        #100 rst = 0;
        #100 engX = 16'b1000000000000000;
        #100 engStart = 1'b1;
        #100 engStart = 1'b0;
        #1000
        #100 engX = 16'b1100000000000000;
        #100 engStart = 1'b1;
        #100 engStart = 1'b0;
        #100000
        $stop;
    end
    always begin
        #10 clk = ~clk;
    end
endmodule