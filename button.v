`timescale 1ns/1ps
module button(input clk, input rst, input signal, output reg on_or_off);
	always@(posedge clk or posedge rst)begin
		if(rst)
			on_or_off <= 0;
		else if(signal)
			on_or_off <= !on_or_off;
		else
			on_or_off <= on_or_off;
	end
endmodule