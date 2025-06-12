module alu(
  input [31:0] A,
  input [31:0] B,
  input [2:0] ALUop,
  output reg [31:0] Result
);
  always @(*) begin
    case (ALUop)
      3'b010: Result = A + B;
      3'b011: Result = A - B;
      3'b100: Result = A << B;
      3'b101: Result = A >> B;
      3'b110: Result = A + B; // ADDI
      3'b111: Result = A - B; // SUBI
      default: Result = 0;
    endcase
  end
endmodule
