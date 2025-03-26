module tester;
    reg clk, write, reset;
    reg [4:0] sr1, sr2, dr;
    wire [31:0] read_data_1;
    wire [31:0] read_data_2;
    reg [31:0] write_data;
    integer k;

    reg_bank DUT(read_data_1, read_data_2, write_data, sr1, sr2, dr, reset, write, clk);

    initial 
        begin   
            clk = 0;
            #1 reset = 1;
            #5 reset = 0;
        end
    
    always #5 clk = ~clk;

    initial
        begin
            $dumpfile("aman.vcd");
            $dumpvars(0, tester);      
        end
    
    initial
        begin
        #7
        for(k=0; k<32; k = k+1)
            begin
                dr = k; write_data = 10 * k; write = 1;
                #10 write = 0;
            end

        #20
        for(k=0; k<32; k=k+2)
            begin
                sr1 = k; sr2 = k+1;
                #5
                $display("reg[%2d] = %3d, reg[%2d] = %3d", sr1, read_data_1, sr2, read_data_2);
            end

        #10 $finish;
        end
endmodule

