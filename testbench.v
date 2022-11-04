`timescale 1ns / 1ps
`define cycle 10
module testbench();
	reg clk, rst, signal;
	wire on_or_off;
	reg add, minus;
	wire[6:0]led;
	
	wind test2(clk, signal, rst, on_or_off, add, minus, led);
	
	always #(`cycle/2) clk = ~clk;
	initial begin
		rst = 1;
		#(`cycle*1.75) rst = 0;
	end
	
	initial begin
		clk = 1;signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 1; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 1; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 1; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 1; add = 0; minus = 0;	
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 1; minus = 0;
		#`cycle; signal = 0; add = 0; minus = 1;
		#`cycle; signal = 0; add = 0; minus = 1;
	end
endmodule