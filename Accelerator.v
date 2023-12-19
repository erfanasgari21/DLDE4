module Accelerator(
    input clk, rst, 
    input wStart,
    input [4:0] v,
    input [1:0] u,

    output wrReq, rdReq, wDone
    output [20:0] wrData
);

    wire engDone, ldu, ldv, shL, engStart;
    wire [15:0] engX;
    wire [1:0] uOut;
    wire [1:0] intpart;
    wire [15:0] fracpart;

    WrapperController controller(clk, rst, wStart, engDone, ldu, ldv, shL, engStart, wrReq, wDone);

    ShiftRegisterLeft shRegL(clk, rst, shL, ldv, {3'b000, v, 8'b00000000}, engX);

    Register2b uReg(clk, rst, ldu, u, uOut);

    Exponential exp(clk, rst, engStart, engX, engDone, intpart, fracpart);

    CombShifter combShifter({intpart, fracpart}, uOut, wrData);

endmodule