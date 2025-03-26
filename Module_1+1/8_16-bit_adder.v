module adder16 (Cin, A, B, Cout, Sum);
    input Cin;
    input [15:0] A;
    input [15:0] B;
    output Cout;
    output [15:0] Sum;

    wire [2:0] temp;

//behaviourally just assign {cout, sum} = A+B+Cin; 

//Structurally as:

    adder4 M0 (Cin, A[3:0], B[3:0], temp[0], Sum[3:0]);
    adder4 M1 (temp[0], A[7:4], B[7:4], temp[1], Sum[7:4]);
    adder4 M2 (temp[1], A[11:8], B[11:8], temp[2], Sum[11:8]);
    adder4 M3 (temp[2], A[15:12], B[15:12], Cout, Sum[15:12]);
endmodule

