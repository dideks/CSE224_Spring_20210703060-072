`timescale 1ns / 1ps

module lab2_behavE(
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,
    output reg [7:0] out
    );
    
    always @(*) begin
    case (opcode)
        3'b000: out = ~A;                    // Inverter
        3'b001: out = A | B;                 // OR
        3'b010: out = A ^ B;                 // XOR
        3'b011: out = A & B;                 // AND
        3'b100: out = A[3:0] * B[3:0];       // 4x4 Multiplier
        3'b101: out = A + B;                 // 8-bit Adder
        3'b110: out = A - B;                 // 8-bit Subtractor
        default: out = 8'b00000000;
    endcase
end
    
endmodule