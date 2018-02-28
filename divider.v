module divider(clk_in,choose,rst, clk_out);//加了个choose

input clk_in,rst;//system clock, reset button
input choose;
output clk_out;

reg clk_out;
reg [31:0] cnt;//counter

initial
	begin
		clk_out = 0;
		cnt  = 0;
	end

always @(posedge clk_in or negedge rst) begin
	if (rst)//reset
		begin
			cnt <= 0;
			clk_out <= 0;
		end
	else
		begin
			if(choose) begin
				if (cnt>=30)//actually 2500000 times
					begin
						clk_out <= ~clk_out;
						cnt <= 0;
					end
				else
					begin
						cnt <= cnt+1;
					end
			end
			else begin
				if (cnt>=2500000)//actually 2500000 times
					begin
						clk_out <= ~clk_out;
						cnt <= 0;
					end
				else
					begin
						cnt <= cnt+1;
					end
			end
		end
end
endmodule