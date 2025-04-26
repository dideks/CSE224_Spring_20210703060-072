`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2025 23:02:41
// Design Name: 
// Module Name: lab1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab1(
    input [7:0] x,       // 8 bit giriş
    output [7:0] y       // 8 bit çıkış
);

    // 2's complement işlemi: Tüm bitlerin tersini al + 1
    assign y = ~x + 1;

endmodule

