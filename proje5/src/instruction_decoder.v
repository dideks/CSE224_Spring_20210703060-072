module instruction_decoder(
  input [31:0] instruction,
  output [2:0] opcode,
  output [4:0] rs1,
  output [4:0] rs2,
  output [4:0] rd,
  output [15:0] immediate
);
  assign opcode = instruction[31:29];
  assign rs1 = instruction[28:24];
  assign rs2 = instruction[23:19];
  assign rd = instruction[18:14];
  assign immediate = instruction[13:0];
endmodule
