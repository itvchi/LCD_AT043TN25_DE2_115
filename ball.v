module ball #(
	parameter start_x = 235,
	parameter start_y = 135) (
	input i_clk,
	input [8:0] i_col,
	input [8:0] i_row,
	input [8:0] i_y1,
	input [6:0] i_h1,
	input [8:0] i_y2,
	input [6:0] i_h2,
	output o_color
);

localparam player_width = 5;
localparam player_heigth = 30;
localparam size = 5;

reg [8:0] x = start_x;
reg [8:0] y = start_y;
reg dir_x = 0;
reg dir_y = 0;

reg [17:0] cnt;

	always @ (posedge i_clk)
	begin
		cnt <= cnt + 1;
		if(cnt == 0)
		begin
			if(dir_x) x <= x + 1;
			else x <= x - 1;
			if(dir_y) y <= y + 1;
			else y <= y - 1;
		end
		if(cnt == 2)
		begin
		   if((x == 5 && (y >= i_y1 && (y+size) <= (i_y1+50))) || (x+size == 473 && (y >= i_y2 && (y+size) <= (i_y2+50))))
			begin
				dir_x <= ~dir_x;
			end
			else 
			begin
				dir_x <= dir_x;
			end
			if(y == 0 || y+size == 269)
			begin
				dir_y <= ~dir_y;
			end
			else dir_y <= dir_y; 
			if(x < 5 || x+size > 473 )
			begin
				x <= 235;
				y <= 135;
			end
			else 
			begin
				x <= x;
				y <= y;
			end
		end
	end

	assign o_color = ((i_col >= x && i_col < x+size) && (i_row >= y && i_row < y+size)) ? 1'b1 : 1'b0;

endmodule