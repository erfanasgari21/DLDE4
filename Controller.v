`define IDLE 3'd0
`define LOAD 3'd1
`define PRE 3'd2
`define PROCESS 3'd3
`define POST 3'd4

module WrapperController(
    input clk, rst,
    input wStart,
    input engDone,
    output reg ldu, ldv, shL, engStart, wrReq, wDone
);

    reg [2:0] ps, ns;
    reg cnt, cntRst;
    wire co;

    always @(posedge clk) begin
        if(rst)
            ps <= `IDLE;
        else
            ps <= ns;
    end


    always @(ps or co or wStart or engDone) begin
        ns = `IDLE;
        case(ps) 
            `IDLE : ns = wStart ? `LOAD : `IDLE;
            `LOAD : ns = wStart ? `LOAD : `PRE;
            `PRE : ns = `PROCESS;
            `PROCESS : ns = engDone ? `POST : `PROCESS;
            `POST : ns = co ? `IDLE : `PRE;
        endcase
    end

    always @(ps) begin
        {wDone, ldu, ldv, cntRst, engStart, cnt, shL, wrReq} = 8'b0;
        case(ps) 
            `IDLE : wDone = 1'b1;
            `LOAD : begin
                ldu = 1'b1;
                ldv = 1'b1;
                cntRst = 1'b1;
            end
            `PRE : engStart = 1'b1;
            `POST : begin
                cnt = 1'b1;
                shL = 1'b1;
                wrReq = 1'b1;
            end
        endcase
    end

    Counter2b counter2b(clk, (rst|cntRst) , cnt, co);

endmodule