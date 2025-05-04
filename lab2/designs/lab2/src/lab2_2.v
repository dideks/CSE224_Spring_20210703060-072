`timescale 1ns / 1ps

module lab2_behavE_tb;

    // Girişler
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] opcode;

    // Çıkış
    wire [7:0] out;

    // ALU modülü
    lab2_behavE uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .out(out)
    );

    initial begin
        // Başlangıç değerlerini sıfırla
        A = 8'b00000000;
        B = 8'b00000000;
        opcode = 3'b000;

        // Inverter (NOT A)
        A = 8'b10101010; B = 8'b00000000; opcode = 3'b000;
        // out = ~A = 01010101
        #10;

        // OR
        A = 8'b11001100; B = 8'b10101010; opcode = 3'b001;
        // out = A | B = 11101110
        #10;

        // XOR
        A = 8'b11110000; B = 8'b00001111; opcode = 3'b010;
        // out = A ^ B = 11111111
        #10;

        // AND
        A = 8'b11001100; B = 8'b11110000; opcode = 3'b011;
        // out = A & B = 11000000
        #10;

        // 4x4 Multiplier (Only lower 4 bits of A and B considered)
        A = 8'b00001111; B = 8'b00000011; opcode = 3'b100;
        // out = 15 * 3 = 45 = 00101101
        #10;

        // 8-bit Adder
        A = 8'd120; B = 8'd35; opcode = 3'b101;
        // out = 120 + 35 = 155 = 10011011
        #10;

        // 8-bit Subtractor
        A = 8'd90; B = 8'd40; opcode = 3'b110;
        // out = 90 - 40 = 50 = 00110010
        #10;

        // Simülasyon sonu
        #10 $finish;
    end

endmodule
