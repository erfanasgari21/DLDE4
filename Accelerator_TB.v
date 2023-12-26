`timescale 1ns/1ns
module Accelerator_TB();
    reg clk, rst, wStart;
    wire wDone;
    reg [15:0] frac;
    reg [1:0] int;
    wire wrReq, wDone;
    wire [20:0] wrData

    Accelerator UT(clk, rst, wStart, frac, int, wrReq, wDone, wrData);

    initial begin
        clk = 0;
        rst = 1;
        int = 2'b00;
        #100 rst = 0;
        #100 frac = 16'b1000000000000000;
        #100 wStart = 1'b1;
        #100 wStart = 1'b0;
        #100000
        #100 frac = 16'b1100000000000000;
        #100 wStart = 1'b1;
        #100 wStart = 1'b0;
        #100000
        $stop;
    end
    always begin
        #10 clk = ~clk;
    end
endmodule