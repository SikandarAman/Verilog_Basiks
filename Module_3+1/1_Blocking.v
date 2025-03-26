module blockerz;
    integer a, b, c; // Fixed variable declaration

    initial begin   
        a = 10; 
        b = 20; 
        c = 15;

        a <= #3 b + c;
        b <= #4 a + 5;
        c <= #5 a - b;
    end

    initial 
        begin
            $display("a=%0d, b=%0d, c=%0d", a, b, c); // Fixed $display syntax
            # $display("a=%0d, b=%0d, c=%0d", a, b, c);
        end
endmodule
