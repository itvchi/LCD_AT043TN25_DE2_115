module player #(
	parameter start_x = 0,
	parameter start_y = 0) (
	input i_clk,
	input i_up,
	input i_down,
	input [8:0] i_col,
	input [8:0] i_row,
	output o_color,
	output [8:0] o_y,
	output [6:0] o_h
);

localparam width = 5;
localparam height = 50;

reg r_last_up;
reg r_last_down;
reg [8:0] x = start_x;
reg [8:0] y = start_y;

	always @ (posedge i_clk)
	begin
		if(~r_last_up & i_up)
		begin
			if(y>9) y <= y - 10;
			else y <= y;
		end
		
		if(~r_last_down & i_down)
			if((y+height)<270) y <= y + 10;
			else y <= y;
		begin
			
		end
	
		r_last_up <= i_up;
		r_last_down <= i_down;
	end

	assign o_color = ((i_col >= x && i_col < x+width) && (i_row >= y && i_row < y+height)) ? 1'b1 : 1'b0;
	assign o_y = y;
	assign o_h = height;

endmodule