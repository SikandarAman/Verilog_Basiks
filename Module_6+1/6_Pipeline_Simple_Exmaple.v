module pipeline_simple_exmaple (A, B, C, D, F, clk);
    parameter N = 10;

    input [N-1:0] A, B, C, D;
    input clk;
    output [N-1:0] F;

    reg [N-1:0] L12_X1, L12_X2, L12_D, L23_X3, L23_D, L34_F;
    
    assign F = L34_F;

    always @(posedge clk)
        begin
            //Stage 1
            #4 L12_X1 <= A + B;
            #4 L12_X2 <= C - D;
            L12_D <= D;
        end
    
    always @(posedge clk)
        begin
            //Stage 2
            #4 L23_X3 <= L12_X1 + L12_X2;
            L23_D <= L12_D;
        end

    always @(posedge clk)
        begin
            //Stage 3
            #6 L34_F = L23_X3 * L23_D;
        end
endmodule