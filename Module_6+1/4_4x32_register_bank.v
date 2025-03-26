//4x32 register data
module reg_bank(read_data_1, read_data_2, write_data, sr1, sr2, dr, write, clk);
    input clk, write;
    input [31:0] read_data_1;
    input [31:0] read_data_2;
    output reg [31:0] write_data;
    input [1:0] sr1, sr2, dr;

//making register to save data individually as only 
    reg [31:0] R0, R1, R2, R3;

    always @(*)
        begin
            case (sr1)
                0: read_data_1 = R0;
                1: read_data_1 = R1;
                2: read_data_1 = R2;
                3: read_data_1 = R3;
                default: read_data_1 = 32'hxxxxxxxx;
            endcase
        end
    
/* 
    can also be written as:
    always @(*)
        begin
            read_data_1 = (sr1 == 0) ? R0 :
                          (sr1 == 1) ? R1 :
                          (sr1 == 2) ? R2 :
                          (sr1 == 3) ? R3 : 0;   //this also work like if else stuff;
        end

*/

    always @(*)
        begin
            case (sr2)
                0: read_data_2 = R0;
                1: read_data_2 = R1;
                2: read_data_2 = R2;
                3: read_data_2 = R3;
                default: read_data_2 = 32'hxxxxxxxx;
            endcase
        end

    always @(*)
        begin
            if(write)  //since read beshak krlo but write toh changes krr deta
                begin
                    case (write_data)
                    0: R0 <= write_data;
                    1: R1 <= write_data;
                    2: R2 <= write_data;
                    3: R3 <= write_data;
                    endcase
                end
        end
endmodule


//easy shit