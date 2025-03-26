module rom(addr, data, rd_en, cd);
    input [2:0] addr;
    input rd_en, cd;
    output reg [7:0] data;

    always @(addr or rd_en or cs)
        case(addr)
            0: data = 22;
            1: data = 7;
            /// more 
            7: data = 69;
        endcase
endmodule