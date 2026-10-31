
Verilog
module alu (
    input  [3:0] a,         
    input  [3:0] b,          
    input  [2:0] sel,        
    output reg [3:0] alu_out,
    output       zero        
);

    always @(*) begin
        case (sel)
            3'b000: alu_out = a + b;   
            3'b001: alu_out = a - b;   
            3'b010: alu_out = a & b;   
            3'b011: alu_out = a | b;   
            3'b100: alu_out = a ^ b;   
            default: alu_out = 4'b0000;
        endcase
    end

   
    assign zero = (alu_out == 4'b0000);

endmodule
2. Testbench (tb_alu.v)
Verilog
`timescale 1ns/1ps

module tb_alu;

    reg  [3:0] a, b;
    reg  [2:0] sel;
    wire [3:0] alu_out;
    wire       zero;

  
    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .alu_out(alu_out),
        .zero(zero)
    );

    initial begin
    
        a = 4'd6; 
        b = 4'd3;

        $display("Time | Sel | A | B | Out | Zero");
        $display("-----------------------------");

        sel = 3'b000; #10; $display("%0t  | %b  | %d | %d |  %d  |  %b", $time, sel, a, b, alu_out, zero);
        sel = 3'b001; #10; $display("%0t  | %b  | %d | %d |  %d  |  %b", $time, sel, a, b, alu_out, zero);
        sel = 3'b010; #10; $display("%0t  | %b  | %d | %d |  %d  |  %b", $time, sel, a, b, alu_out, zero);
        sel = 3'b011; #10; $display("%0t  | %b  | %d | %d |  %d  |  %b", $time, sel, a, b, alu_out, zero);
        sel = 3'b100; #10; $display("%0t  | %b  | %d | %d |  %d  |  %b", $time, sel, a, b, alu_out, zero);

        $finish;
    end

endmodule
