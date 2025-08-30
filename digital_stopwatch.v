`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2025 06:10:48 PM
// Design Name: Digital Stopwatch
// Module Name: top
// Description: Displays minutes and seconds on 7-segment display
//////////////////////////////////////////////////////////////////////////////////

module top (clk, digit, Seven_Segment);
    input clk;
    output reg [3:0] digit;
    output reg [7:0] Seven_Segment;  // Fixed: now includes DP (bit 7)

    wire [5:0] sec, min;
    wire [6:0] dg3, dg2, dg1, dg0;
    wire [3:0] sec_ones, sec_tens, min_ones, min_tens;

    stopwatch sw(clk, sec, min);

    digit_splitter ds (
        .sec(sec),
        .min(min),
        .sec_tens(sec_tens),
        .sec_ones(sec_ones),
        .min_tens(min_tens),
        .min_ones(min_ones)
    );

    bcd_to_ssd dg_1(min_tens, dg0);
    bcd_to_ssd dg_2(min_ones, dg1);
    bcd_to_ssd dg_3(sec_tens, dg2);
    bcd_to_ssd dg_4(sec_ones, dg3);

    reg [15:0] count = 0;
    reg [1:0] digit_sel = 0;

    always @(posedge clk) begin
        count <= count + 1;
        if (count == 50000) begin
            count <= 0;
            digit_sel <= digit_sel + 1;
        end
    end

    always @(*) begin
        case (digit_sel)
            2'd0: begin
                digit = 4'b1110;
                Seven_Segment[6:0] = dg0;
            end
            2'd1: begin
                digit = 4'b1101;
                Seven_Segment[6:0] = dg1;
            end
            2'd2: begin
                digit = 4'b1011;
                Seven_Segment[6:0] = dg2;
            end
            2'd3: begin
                digit = 4'b0111;
                Seven_Segment[6:0] = dg3;
            end
        endcase

        Seven_Segment[7] = 1'b0;  
    end
endmodule

module digit_splitter (
    input [5:0] sec,
    input [5:0] min,
    output [3:0] sec_tens,
    output [3:0] sec_ones,
    output [3:0] min_tens,
    output [3:0] min_ones
);
    assign sec_ones = sec % 10;
    assign sec_tens = sec / 10;
    assign min_ones = min % 10;
    assign min_tens = min / 10;
endmodule

module bcd_to_ssd (
    input  [3:0] bcd,
    output reg [6:0] ssd
);
    always @(*) begin
        case (bcd)
            4'd0: ssd = 7'b0000001; //0
            4'd1: ssd = 7'b1001111;//1
            4'd2: ssd = 7'b0010010;//2
            4'd3: ssd = 7'b0000110;//3
            4'd4: ssd = 7'b1001100;//4
            4'd5: ssd = 7'b0100100;
            4'd6: ssd = 7'b0100000;
            4'd7: ssd = 7'b0001111;
            4'd8: ssd = 7'b0000000;
            4'd9: ssd = 7'b0001000;
            default: ssd = 7'b1111111;
        endcase
    end
endmodule

module stopwatch (
    input clk,
    output [5:0] sec_op,
    output [5:0] min_op
);
    reg [27:0] counter = 0;
    reg [5:0] sec = 0, min = 0;

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 50000000) begin
            counter <= 0;
            sec <= sec + 1;
            if (sec == 59) begin
                sec <= 0;
                min <= min + 1;
            end
        end
    end

    assign sec_op = sec;
    assign min_op = min;
endmodule
