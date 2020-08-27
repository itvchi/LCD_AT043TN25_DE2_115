module debouncer (
	input i_clk,
	input i_switch,
	output reg o_switch
);

reg [13:0] cnt;
localparam debounceLimit = 10000;

always @ (posedge i_clk)
begin
	 if(i_switch != o_switch && cnt < debounceLimit)
		cnt <= cnt + 1;
	 else if(cnt == debounceLimit)
		begin
			cnt <= 0;
			o_switch = i_switch;
		end
	 else
		cnt <= 0;
end

endmodule