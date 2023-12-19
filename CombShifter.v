module CombShifter(
    input [17:0] in, 
    input [1:0] n, 
    output [20:0] out
)
    always @(*) begin
        case(n)
            2'b00: out = {3'b000, in};
            2'b01: out = {2'b00, in, 1'b0};
            2'b10: out = {1'b0, in, 2'b00};
            2'b11: out = {in, 3'b000};
            default: out = {3'b000, in};
        endcase
    end
    assign out = in << n;

endmodule