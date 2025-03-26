//Load a word stored in memory location 120, add 45 to it, adn store the result in memorylocation 121
module test_mips32;
    reg clk1, clk2;
    integer k;

    MIPS32_Processor MIPS(clk1, clk2);

    initial
        begin  
            clk1 = 0; clk2 =0;      //Generating a two phase clock
            repeat(20)
                begin
                    #5 clk1 = 1; #5 clk1 = 0;
                    #5 clk2 = 1; #5 clk2 = 0;
                end
        end


    initial
        begin
            for (k=0; k<31; k++)
                MIPS.Reg[k] = k;

            MIPS.Mem[0] = 32'h28010078;  // ADDI  R1, R0, 120
            MIPS.Mem[1] = 32'h0c631800;   // OR    R3, R3, R3  -- dummy instr.
            MIPS.Mem[2] = 32'h20220000;  // LW    R2, 0(R1)
            MIPS.Mem[3] = 32'h0c631800;   // OR    R3, R3, R3  -- dummy instr.
            MIPS.Mem[4] = 32'h2842002d;  // ADDI  R2, R2, 45
            MIPS.Mem[5] = 32'h0c631800;   // OR    R3, R3, R3  -- dummy instr.
            MIPS.Mem[6] = 32'h24220001;   // SW    R2, 1(R1)
            MIPS.Mem[7] = 32'hfc000000;  // HLT

            MIPS.Mem[120] = 85;

            MIPS.PC = 0;
            MIPS.HALTED = 0;
            MIPS.TAKEN_BRANCH = 0;

            #500
                $display("Mem[120]: %4d \nMem[121]: %4d", MIPS.Mem[120], MIPS.Mem[121]);
        end
                
    initial 
        begin
            $dumpfile("mip-vals.vcd");
            $dumpvars(0, test_mips32);
            #600 $finish;
        end
endmodule

