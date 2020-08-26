module color_test (
    input [8:0] i_col,
	 input [8:0] i_row,
    output [7:0] o_red,
    output [7:0] o_green,
    output [7:0] o_blue
);

    assign o_red = i_col < 256 ? {i_col[4:0], i_row[2:0]} : 64;
    assign o_green = i_col > 255 ? {i_col[5:2], i_row[5:2]} : {i_row[2:0], 5'b11111};
    assign o_blue = i_row < 128 ? {2'b00, i_col[3:0], 2'b00} : {i_row[6:2], 3'b000};

endmodule