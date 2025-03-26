module tester;
    reg clk;
    wire [2:0] color;
    reg [8*6:0] color_str;

    RGY DUT(clk, color);

    initial
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
    
    always @(*) begin
        case (color)
            3'b100: color_str = "RED   "; // Ensure all strings are same length
            3'b010: color_str = "GREEN ";
            3'b001: color_str = "YELLOW";
            default: color_str = "UNKNOWN";
        endcase
    end

    initial begin
        $monitor("%0t Color = %s", $time, color_str);
    end
    
    initial
        #100 $finish;

endmodule