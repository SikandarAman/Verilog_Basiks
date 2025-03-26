module PIPO1(X, Bus, ldA, clk);
    input [15:0] Bus;
    input ldA, clk;
    output reg [15:0] X;

    always @(posedge clk)
        if(ldA) X <= Bus;

endmodule

module PIPO2(Y, Z, ldP, clrP, clk);
    input [15:0] Z;
    input ldP, clrP, clk;
    output reg [15:0] Y;

        always @(posedge clk)
            begin
                if(clrP) Y <= 16'b0;
                else if(ldP) Y <= Z;
            end
endmodule

module Counter(Bout, Bus, ldB, decB, clk);
    input [15:0] Bus;
    input ldB, decB, clk;
    output reg [15:0] Bout;
    
    always @(posedge clk)
        begin
            if(ldB) Bout <= Bus;
            else if(decB) Bout <= Bout - 1;
        end
endmodule

module Adder (Z, X, Y);
    input [15:0] X, Y;
    output reg [15:0] Z;

    always @(*)
        Z = X + Y;
endmodule

module EQZ(eqz, Bout);
    input [15:0] Bout;
    output reg eqz;
    always @(*)
            eqz = (Bout == 0);
endmodule

module datapath_mul(eqz, ldA, ldB, ldP, clrP, decB, data_in, clk);
    input ldA, ldB, ldP, clrP, decB, clk; //(these are like the commands)
    input [15:0] data_in;
    output eqz;
    wire [15:0] X, Y, Z, Bout, Bus;

    assign Bus = data_in;

    PIPO1 A(X, Bus, ldA, clk);
    PIPO2 P(Y, Z, ldP, clrP, clk);
    Counter B(Bout, Bus, ldB, decB, clk);
    Adder Add(Z, X, Y);
    EQZ Comp(eqz, Bout);
endmodule

//STANDARD WAY
// module controlpath_mul(eqz, ldA, ldB, ldP, clrP, decB, start, done, clk);
//     input eqz, start, clk;
//     output reg ldA, ldB, ldP, clrP, decB, done;

//     reg [1:0] i;
//     initial i = 2'b00;
//     reg [2:0] state;
//     parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
//     always @(posedge clk)
//         begin
//             case(state)
//                 S0: state <= S1;
//                 S1: state <= S2;
//                 S2: state <= S3;
//                 S3: begin 
//                         #2 if(!eqz)  begin  state <= S3; i = 2'b01; end //little delay for synchronization to get eqz value
//                         else begin state <= S4; i = 2'b10; end  // i just as a checker bcz i got slow 18/03/2025
//                     end
//                 S4: state <= S4;
//                 default: state <= S0;
//             endcase
//         end

//     always @(state)    //I did mistake putting it posedge clk
//         begin
//             case(state)
//                 S0: #1 begin ldA = 0; ldB = 0; ldP = 0; decB = 0; clrP = 0; done = 0; end
//                 S1: #1 begin ldA = 1; end
//                 S2: #1 begin ldA = 0; ldB = 1; clrP = 1; end
//                 S3: #1 begin ldB = 0; decB = 1; ldP = 1; clrP = 0; end
//                 S4: #1 begin decB = 0; ldP = 0; done = 1; end
//                 default: #1 begin ldA = 0; ldB = 0; ldP = 0; decB = 0; clrP = 0;end 
//             endcase
//         end
// endmodule

//ALTERNATIVE WAY
module controlpath_mul(eqz, ldA, ldB, ldP, clrP, decB, start, done, clk);
    input eqz, start, clk;
    output reg ldA, ldB, ldP, clrP, decB, done;

    reg [2:0] state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

    always @(posedge clk)
        if(eqz == 1) state <= S4; //kyuki posedge ke saath hi eqz value de ra tha i didnt had choice
        else state <= next_state;
    
    initial #5 state = S0;
    always @(state)    //I did mistake putting it posedge clk
        begin
            case(state)
                S0: #1 begin ldA = 0; ldB = 0; ldP = 0; decB = 0; clrP = 0; done = 0; next_state = S1; end
                S1: #1 begin ldA = 1; next_state = S2; end
                S2: #1 begin ldA = 0; ldB = 1; clrP = 1; next_state = S3; end
                S3: #1 begin  ldB = 0; decB = 1; ldP = 1; clrP = 0; next_state = S3; end
                S4: #1 begin decB = 0; ldP = 0; done = 1; next_state = S4; end
                default: #1 begin ldA = 0; ldB = 0; ldP = 0; decB = 0; clrP = 0; next_state = S0; end 
            endcase
        end
endmodule