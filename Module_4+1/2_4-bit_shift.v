module bit4_shift(in, clk, clr, D);
    input in, clk, clr;
    output reg D;
    reg A, B, C;
    
    always @(posedge clk or negedge clr)
        begin
            if(!clr)
                begin
                    A<=0; B<=0; C<=0; D<=0;
                end
            else
                begin
                    B<=A;
                    C<=B;
                    D<=C;
                    A<=in;
                end
        end
endmodule
