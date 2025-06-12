module pc(input clk, input reset, input control, output reg [31:0] pc_out);
  always @(posedge clk or posedge reset) begin
    if (reset)
      pc_out <= 0;
    else if (control)
      pc_out <= pc_out + 1;
  end
endmodule
