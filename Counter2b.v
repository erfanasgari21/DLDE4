module Counter2b( 
    input clk, rst, cnt, output co
);
    reg [1:0] p;
    
    always @(posedge clk or rst) begin
        if(rst)
            p <= 0;
        else if(cnt)
            p <= p + 1;
    end

    assign co = (p==2'b11) ? 1'b1 : 1'b0;

endmodule
