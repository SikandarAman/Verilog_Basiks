module RGY(clk, color);
    input clk;
    output reg [2:0] color;
    parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;
    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;  

    // always @(posedge clk)
    //     begin
    //         case (state)
    //             S0: begin state<=S1; color<=GREEN; end
    //             S1: begin state<=S2; color<=YELLOW; end
    //             S2: begin state<=S0; color<=RED; end
    //             default: begin state<=S0; color<=RED; end
    //         endcase
    //     end

    
endmodule