//4-bit counter with asynchronous reset

module counter (clk, reset, count);
    input clk, reset;
    output reg count;

    always @(posedge clk or posedge reset)
        begin
            if (reset)
                count <= 0;
            else
                count <= count + 1;
        end
endmodule