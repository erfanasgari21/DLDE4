`timescale 1ns/1ns

// v = {000, 11111, 0000 0000} = 0.12109 => res = 1.12873
// v = {000, 01111, 0000 0000} = 0.05859 => res = 1.0603
// u = 0
module Accelerator_TB();
    reg clk, rst, wStart;
    reg [4:0] v;
    reg [1:0] u;
    wire wrReq, wDone;
    wire [20:0] wrData;

    Accelerator UT(clk, rst, wStart, v, u, wrReq, wDone, wrData);

    initial begin
        clk = 0;
        rst = 1;
        u = 2'b00;
        #100 rst = 0;
        #100 v = 5'b11111;
        #100 wStart = 1'b1;
        #100 wStart = 1'b0;
        #100000;
        #100 v = 5'b01111;
        #100 wStart = 1'b1;
        #100 wStart = 1'b0;
        #100000
        $stop;
    end
    always begin
        #10 clk = ~clk;
    end
endmodule