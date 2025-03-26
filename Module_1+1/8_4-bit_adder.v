module adder4 (Cin, A, B, Cout, Sum);
    input Cin;
    input [3:0] A;
    input [3:0] B;
    output Cout;
    output [3:0] Sum;

    wire [2:0] temp;

//behaviourally just assign {cout, sum} = A+B+Cin; 

//Structurally as:

    FA M0 (Cin, A[0], B[0], temp[0], Sum[0]);
    FA M1 (temp[0], A[1], B[1], temp[1], Sum[1]);
    FA M2 (temp[1], A[2], B[2], temp[2], Sum[2]);
    FA M3 (temp[2], A[3], B[3], Cout, Sum[3]);
endmodule

