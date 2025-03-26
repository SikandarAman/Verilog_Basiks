module ram_wo_inout(addr, data_out, data_in, wr, cs); //wr = 1 --> write; wr = 0 --> read;

    parameter addr_size = 10, word_size = 8, mem_size = 1024;

    input [addr_size-1:0] addr;
    input wr, cs;
    input [word_size-1:0] data_in;        

    reg [word_size-1:0] mem [mem_size-1:0]; 
    output [word_size-1:0] data_out;

    assign data_out = (cs && ~wr) ? mem[addr] : 8'bz; // Tri-state buffer to avoid conflicts

    always @(addr, data_in, wr, cs)
        if(wr && cs) mem[addr] = data_in;

endmodule