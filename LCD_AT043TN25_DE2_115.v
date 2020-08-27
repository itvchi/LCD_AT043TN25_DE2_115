module LCD_AT043TN25_DE2_115 (
	input i_clk,
	input [3:0] i_sw,
	output o_clk,
	output o_data_enable,
	output [7:0] o_red,
	output [7:0] o_green,
	output [7:0] o_blue
);

wire w_clk;
wire w_player1;
wire w_player2;
wire w_ball;
wire [3:0] w_sw;
wire [8:0] w_col;
wire [8:0] w_row;

wire [8:0] w_y1;
wire [8:0] w_y2;
wire [6:0] w_h1;
wire [6:0] w_h2;

	clk_div4 divider (.i_clk(i_clk), .o_clk(w_clk));
	data_enable DE (.i_clk(w_clk), .o_data_enable(o_data_enable), .o_col(w_col), .o_row(w_row));
	
	debouncer db1 (.i_clk(w_clk), .i_switch(i_sw[0]), .o_switch(w_sw[0]));
	debouncer db2 (.i_clk(w_clk), .i_switch(i_sw[1]), .o_switch(w_sw[1]));
	debouncer db3 (.i_clk(w_clk), .i_switch(i_sw[2]), .o_switch(w_sw[2]));
	debouncer db4 (.i_clk(w_clk), .i_switch(i_sw[3]), .o_switch(w_sw[3]));
	player #(.start_x(0), .start_y(10)) player1 (.i_clk(w_clk), .i_up(w_sw[0]), .i_down(w_sw[1]), .i_col(w_col), .i_row(w_row), .o_color(w_player1), .o_y(w_y1), .o_h(w_h1));
	player #(.start_x(474), .start_y(40)) player2 (.i_clk(w_clk), .i_up(w_sw[2]), .i_down(w_sw[3]), .i_col(w_col), .i_row(w_row), .o_color(w_player2), .o_y(w_y2), .o_h(w_h2));
	ball b1 (.i_clk(w_clk), .i_col(w_col), .i_row(w_row), .o_color(w_ball), .i_y1(w_y1), .i_h1(w_h1), .i_y2(w_y2), .i_h2(w_h2));

	assign o_clk = w_clk;
	assign o_red = {8{w_player1}} | {8{w_player2}};
	assign o_green = {8{w_player1}} | {8{w_player2}} | {8{w_ball}};
	assign o_blue = {8{w_player2}} | {8{w_ball}};
	

endmodule