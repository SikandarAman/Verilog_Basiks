module tester;
    reg cs;
    reg wr;
    reg [9:0] addr;
    wire [7:0] data_out;
    reg [7:0] data_in;
    integer k, myseed;
    
    initial 
        myseed = 35;

    ram_wo_inout DUT(addr, data_out, data_in, wr, cs);
    
    initial 
        begin
            for (k=0; k<=1023; k++)
                begin
                    addr = k;
                    wr = 1; cs = 1;
                    data_in = (k + k) % 256; 
                    #1 wr = 0; cs = 0;
                end
        end
    
    initial
        begin
            #1024 //let data be written first of all,, or better write below the previous initial statement itself
            repeat(1024)
                begin
                    addr = $random(myseed) % 1024; wr = 0; cs = 1;
                    #1 $display("Address = %5d, Data = %4d", addr, data_out);
                    cs = 0;
                end
        end
endmodule