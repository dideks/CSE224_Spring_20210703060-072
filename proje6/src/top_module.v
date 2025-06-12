module top_module(
  input clk,
  input reset,
  input control,
  output [31:0] result
);

  wire [31:0] pc_out, instruction;
  wire [2:0] opcode;
  wire [4:0] rs1, rs2, rd;
  wire [15:0] immediate;
  wire [31:0] reg_data1, reg_data2, alu_result;
  reg [31:0] alu_input_b;
  reg reg_write;
  reg [2:0] alu_op;

  pc program_counter(.clk(clk), .reset(reset), .control(control), .pc_out(pc_out));
  instruction_memory imem(.address(pc_out), .instruction(instruction));
  instruction_decoder decoder(
    .instruction(instruction),
    .opcode(opcode),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .immediate(immediate)
  );
  register_file regfile(
    .clk(clk),
    .read_reg1(rs1),
    .read_reg2(rs2),
    .write_reg(rd),
    .write_data(alu_result),
    .reg_write(reg_write),
    .read_data1(reg_data1),
    .read_data2(reg_data2)
  );
  alu alu_unit(
    .A(reg_data1),
    .B(alu_input_b),
    .ALUop(alu_op),
    .Result(alu_result)
  );

  assign result = alu_result;

  always @(*) begin
    case(opcode)
      3'b000, 3'b001: begin // NOOP
        alu_op = 3'b000;
        reg_write = 0;
        alu_input_b = 0;
      end
      3'b010: begin // ADD
        alu_op = 3'b010;
        reg_write = 1;
        alu_input_b = reg_data2;
      end
      3'b011: begin // SUB
        alu_op = 3'b011;
        reg_write = 1;
        alu_input_b = reg_data2;
      end
      3'b100: begin // SHIFTL
        alu_op = 3'b100;
        reg_write = 1;
        alu_input_b = reg_data2;
      end
      3'b101: begin // SHIFTR
        alu_op = 3'b101;
        reg_write = 1;
        alu_input_b = reg_data2;
      end
      3'b110: begin // ADDI
        alu_op = 3'b110;
        reg_write = 1;
        alu_input_b = {{16{immediate[15]}}, immediate}; // sign-extend
      end
      3'b111: begin // SUBI
        alu_op = 3'b111;
        reg_write = 1;
        alu_input_b = {{16{immediate[15]}}, immediate}; // sign-extend
      end
      default: begin
        alu_op = 3'b000;
        reg_write = 0;
        alu_input_b = 0;
      end
    endcase
  end

endmodule
