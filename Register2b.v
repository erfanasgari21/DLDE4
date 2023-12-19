module Register2b(
    clk, rst,
    load, inp,
    p
);

    input clk, rst, load;
    input [1:0] inp;
    output [1:0] p;

    always @(posedge clk)
    begin
        if(rst)
            p <= 2'b0;
        else if(load)
            p <= inp;
    end

endmodule


