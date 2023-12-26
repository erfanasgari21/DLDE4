module ShiftRegisterLeft(
    clk, rst,
    shL, load, inp,
    p
);

    input clk, rst;
    input shL, load;
    input [15:0] inp;
    output reg [15:0] p;

    always @(posedge clk)
    begin
        if(rst)
            p <= 16'b0;
        else if(load)
            p <= inp;
        else if(shL)
            p <= {p[14:0], 1'b0};
    end

endmodule


