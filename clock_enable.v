module clock_enable(
	input clk,
	output reg out
);
	reg [31:0] count = 0;
	parameter PERIOD = 500000; //microseconds
	parameter TARGET_COUNT = PERIOD * 50;
	
	initial begin
		out <= 0;
	end

	always @(posedge clk) begin
		// Wrap the counter when it hits the target
		// Blocking assignment required so following statements evaluate correctly
		if(count >= TARGET_COUNT) begin
			count = 0;
		end
		
		// If count is 0, pulse the output high, otherwise it is low
//		if (count == 0) begin
		if (count <= 250000 * 50) begin //Hack to increase the pulse length to 250ms so we can see it on the LED
			out <= 1;
		end
		else begin
			out <= 0;
		end
		
		// Increment the count
		count <= count + 1;
	end
endmodule