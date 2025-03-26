module tester;
    reg [3:0] rs1, rs2, rd, func;
    reg [7:0] addr;
    reg clk1, clk2;
    wire [15:0] Zout;
    integer k;

    pipeline_complex DUT(Zout, rs1, rs2, rd, func, addr, clk1, clk2);

    initial 
        begin
            clk1 = 0; clk2 = 0;
        end
    
    // always 
    //     begin
    //         #5 clk1 = ~clk1;
    //         #15 clk1 = ~clk1;
    //     end

    // always 
    //     begin
    //         #15 clk2 = ~clk2;
    //         #5 clk2 = ~clk2;
    //     end

//Or more accurately as:

    always
        begin
            #5 clk1 = 1;
            #5 clk1 = 0;
            #5 clk2 = 1;
            #5 clk2 = 0;
        end

    initial 
        begin
            for(k = 0; k < 16; k = k + 1)
                DUT.regbank[k] = k; //Initializing registers
        end

    initial
        begin
            #4  rs1 = 3;   rs2 = 5;   rd = 1;  func = 0;   addr = 1;  // ADD
            #20  rs1 = 3;   rs2 = 8;   rd = 2;  func = 2;   addr = 2;  // MUL
            #20  rs1 = 10;  rs2 = 0;   rd = 3;  func = 1;   addr = 3;  // SUB
            #20  rs1 = 2;   rs2 = 3;   rd = 4;  func = 11;  addr = 4;  // SLA
            #20  rs1 = 14;  rs2 = 5;   rd = 5;  func = 1;   addr = 5;  // SUB
            #20  rs1 = 15;  rs2 = 13;  rd = 6;  func = 0;   addr = 6;  // ADD
            //NOTE
                //REGBANK ITSELF IS CHANGING SO DONT USE THE ONES IN rd again AS those will be altered
            // #60 for (k=1; k<7; k=k+1)
            //     $display ("Mem[%1d] = %d", k, DUT.memory[k]);
        end

    initial
        begin
            $dumpfile ("pipe2.vcd");
            $dumpvars (0, tester);
            $monitor ("Time: %3d, Zout = %3d", $time, Zout);
            #300 $finish;
        end

endmodule
