module alu_tester;
    reg [15:0] X,Y;
    reg CI;
    wire [15:0] Z;
    wire CO;
    Nbit_adder DUT(.a(X), .b(Y), .sum(Z), .cin(CI), .cout(CO));

    initial
        begin
            $monitor($time," Input_1=%h, Input_2=%h, Carry_Input=%b, Carry_Output=%b, Sum=%h", X, Y ,CI, CO, Z); //monitor the variables
            #5 X=16'h0001; Y=16'h0001; CI=0; //X=0000 0000 0000 0001, Y=0000 0000 0000 0001 At time 5 Z=0000 0000 0000 0010, C=0, S=0, Z=0, P=0, OF=0
            #5 X=16'h0001; Y=16'hafcf; //X=0000 0000 0000 0001, Y=1111 1111 1111 1111 At time 10 Z=0000 0000 0000 0000, C=1, S=0, Z=1, P=1, OF=0
            #5 X=16'hf0ff; Y=16'h0011; //X=1111 1111 1111 1111, Y=0000 0000 0000 0001 At time 15 Z=0000 0000 0000 0000, C=1, S=0, Z=1, P=1, OF=0
            #5 X=16'h8000; Y=16'h8200; //X=1000 0000 0000 0000, Y=1000 0000 0000 0000 At time 20 Z=0000 0000 0000 0000, C=1, S=0, Z=1, P=1, OF=1
            #5 $finish; //finish the simulation 
        end
endmodule