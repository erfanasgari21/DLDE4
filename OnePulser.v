
`define A 2'b00
`define B 2'b01
`define C 2'b10

module OnePulser(clk, rst, lp, sp);
    input clk, lp, rst;
    output reg sp;
    reg [1:0] ps, ns;
    
    
    always @(ps or lp) begin
        ns = `A;
        case(ps) 
            `A : ns = lp ? `B : `A;
            `B : ns = `C;
            `C : ns = lp ? `C : `A;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if(rst)
            ps <= `A;
        else 
            ps <= ns;
    end

    always @(ps) begin
        sp = 1'b0;
        if(ps==`B)
            sp = 1'b1;
    end 

endmodule