//32x32 register data
module reg_bank(read_data_1, read_data_2, write_data, sr1, sr2, dr, reset,  write, clk);
    input clk, write, reset;
    output [31:0] read_data_1;
    output [31:0] read_data_2;
    input [31:0] write_data;
    input [4:0] sr1, sr2, dr;
    integer i;

    reg [31:0] regfile[0:31];
    
    assign read_data_1 = regfile[sr1];
    assign read_data_2 = regfile[sr2];

//basik
    // always @(posedge clk)
    //     if(write) regfile[dr] = write_data;

//if i wish to create a reset facility
    always @(posedge clk)
        begin
            if(reset) 
                begin
                    for(i = 0; i < 32; i++)
                        begin
                            regfile[i] <= 0;
                        end
                end
            else
                begin
                    if(write)
                        begin
                            regfile[dr] <= write_data;
                        end
                end
        end
endmodule