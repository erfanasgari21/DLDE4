`define IDLE 3'd0
`define LOAD 3'd1
`define PREPROCESS 3'd2
`define PROCESS 3'd3
`define POSTPROCESS 3'd4


module WrapperController(
    input clk, rst,
    input wStart, 
)