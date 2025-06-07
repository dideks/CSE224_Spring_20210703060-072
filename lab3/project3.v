module SevenSegmentDecoder(
    input [3:0] digit,
    output reg [6:0] seg
);

always @(*) begin
    case (digit)
        4'd0: seg = 7'b1000000;
        4'd1: seg = 7'b1111001;
        4'd2: seg = 7'b0100100;
        4'd3: seg = 7'b0110000;
        4'd4: seg = 7'b0011001;
        4'd5: seg = 7'b0010010;
        default: seg = 7'b1111111;
    endcase
end

endmodule

module project3 (
    input clk,
    input rst,
    output seg0, seg1, seg2, seg3, seg4, seg5, seg6,
    output an0, an1, an2, an3, an4, an5, an6, an7
);

reg [3:0] count;
reg [26:0] one_second_counter;
reg one_second_enable;

wire [6:0] seg;
wire [7:0] an;

assign an = 8'b01111111;

// Tekil portlara atama
assign seg0 = seg[0];
assign seg1 = seg[1];
assign seg2 = seg[2];
assign seg3 = seg[3];
assign seg4 = seg[4];
assign seg5 = seg[5];
assign seg6 = seg[6];

assign an0 = an[0];
assign an1 = an[1];
assign an2 = an[2];
assign an3 = an[3];
assign an4 = an[4];
assign an5 = an[5];
assign an6 = an[6];
assign an7 = an[7];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        one_second_counter <= 0;
        one_second_enable <= 0;
    end else if (one_second_counter >= 100_000_000 - 1) begin
        one_second_counter <= 0;
        one_second_enable <= 1;
    end else begin
        one_second_counter <= one_second_counter + 1;
        one_second_enable <= 0;
    end
end

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'd0;
    else if (one_second_enable) begin
        if (count == 4)
            count <= 4'd0;
        else
            count <= count + 1;
    end
end

SevenSegmentDecoder decoder (
    .digit(count),
    .seg(seg)
);

endmodule
