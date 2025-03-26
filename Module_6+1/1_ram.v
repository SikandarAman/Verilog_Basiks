module synchronous_ram(addr, data, clk, rd, wr, cs); //address, data, clock, read, write, chip-select
    input [9:0] addr;
    input rd, wr, cs, clk;
    inout [7:0] data;        //inout since i am either assigning or something else being assigned by it

    reg [7:0] mem [1023:0]; 
    reg [7:0] data_out;

    assign data = (cs && rd)? data_out : 8'hzz;

    always @(posedge clk)
        if(cs && wr && !rd) mem[addr] = data;
    
    always @(posedge clk)
        if(cs && rd && !wr) data_out = mem[addr];
endmodule

//For asynchronous just dont add clk, and instead of always @(posedge clk)  --do-- always @(*)