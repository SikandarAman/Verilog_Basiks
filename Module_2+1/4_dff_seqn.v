module dff_negedge (D, clock, Q, Qbar);
    input D, clock;
    output reg Q, Qbar;

    always @(negedge clock)
        begin 
            Q = D;
            Qbar = ~D;
        end
endmodule