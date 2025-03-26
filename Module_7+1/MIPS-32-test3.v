//Compute a factorial of a numebr N stored in memory location 200. The result will be stored in a memory lcoation 198
module test_mips32;
    reg clk1, clk2;
    integer k;

    MIPS32_Processor MIPS(clk1, clk2);

    initial
        begin  
            clk1 = 0; clk2 =0;      //Generating a two phase clock
            repeat(50)
                begin
                    #5 clk1 = 1; #5 clk1 = 0;
                    #5 clk2 = 1; #5 clk2 = 0;
                end
        end


    initial
        begin
            $monitor("Time: %0d, PC: %0d, R2: %0d, R3: %0d, Mem[198]: %0d", $time, MIPS.PC, MIPS.Reg[2], MIPS.Reg[3], MIPS.Mem[198]);
        end


    initial
        begin
            for (k=0; k<32; k++)
                MIPS.Reg[k] = k;

                MIPS.Mem[0]=32'h280a00c8;
                MIPS.Mem[1]=32'h28020001;
                MIPS.Mem[2]=32'h21430000;
                MIPS.Mem[3]=32'h0e94a000;
                MIPS.Mem[4]=32'h14431000;
                MIPS.Mem[5]=32'h2c630001;
                MIPS.Mem[6]=32'h0e94a000;
                MIPS.Mem[7]=32'h3460fffc;
                MIPS.Mem[8]=32'h2542fffe;
                MIPS.Mem[9]=32'hfc000000;
                MIPS.Mem[200]=7;
                            
            MIPS.PC = 0;
            MIPS.HALTED = 0;
            MIPS.TAKEN_BRANCH = 0;

            #1000 $display("mem[200] = %1d, mem[198] = %1d", MIPS.Mem[200], MIPS.Mem[198]);

        end
                
    initial 
        begin
            $monitor("regfile[2] = %1d", MIPS.Reg[2]);
            $dumpfile("mip-vals.vcd");
            $dumpvars(0, test_mips32);
            #5000 $finish;
        end
endmodule

