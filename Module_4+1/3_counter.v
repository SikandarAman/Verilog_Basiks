module counter(clk, clr);
    parameter N = 8;
    input clk, clr;
    output reg [N-1:0] A;

    always @(posedge clk, negedge clr)
        begin
            if(!clr) A <= 0 ;
            else     A <= A + 1;
        end
endmodule