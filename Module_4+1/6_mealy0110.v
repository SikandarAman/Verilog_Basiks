//A "0110" pattern detector
module seq_detect(x, clk, rst, z);
    input x, clk, rst;
    output reg z;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    reg [1:0] PS, NS; //present state and next state

    always @(posedge clk or negedge rst)
        if (rst) PS = S0;
        else PS <= NS;

    always @(x, PS)
        case (PS)
            S0:
                begin 
                    NS <= (x ? S0 : S1);
                    z <=  (x ? 0: 0);
                end

            S1: 
                begin 
                    NS <= (x ? S2 : S1);
                    z <=  (x ? 0: 0);
                end

            S2: 
                begin 
                    NS <= (x ? S3 : S1);
                    z <=  (x ? 0: 0);
                end

            S3: 
                begin 
                    NS <= (x ? S0 : S1);
                    z <=  (x ? 0: 1);             //here z shows its dependence on input even while casing on a state statement
                end        
        endcase
endmodule