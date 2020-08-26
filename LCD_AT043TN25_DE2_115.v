module LCD_AT043TN25_DE2_115 (
	input i_clk,
	output o_clk,
	output o_data_enable,
	output [7:0] o_red,
	output [7:0] o_green,
	output [7:0] o_blue
);

wire w_clk;
wire [8:0] w_col;
wire [8:0] w_row;

	clk_div4 divider (.i_clk(i_clk), .o_clk(w_clk));
	data_enable DE (.i_clk(w_clk), .o_data_enable(o_data_enable), .o_col(w_col), .o_row(w_row));
	color_test test (.i_col(w_col), .i_row(w_row), .o_red(o_red), .o_green(o_green), .o_blue(o_blue));

	assign o_clk = w_clk;

endmodule