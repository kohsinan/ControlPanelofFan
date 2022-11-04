`timescale 1ns / 1ps
module wind(input clk, input signal, input rst, input on_or_off, input add, input minus, output reg[6:0]led);
	reg[2:0]state, next_state;
	
	parameter state0 = 0, state1 = 1, state2 = 2;
	parameter state3 = 3, state4 = 4,state5 = 5;
	parameter state6 = 6, state7 = 7;
	
	button test3(clk, rst, signal, on_or_off);
	
	always@(*)begin
		if(on_or_off)begin
			if(add)begin
				case(state)
					state1: next_state = state2;
					state2: next_state = state3;
					state3: next_state = state4;
					state4: next_state = state5;
					state5: next_state = state6;
					state6: next_state = state7;
					state7: next_state = state7;
					default: next_state = state1;
				endcase
			end
			else if(minus)begin
				case(state)
					state1: next_state = state1;
					state2: next_state = state1;
					state3: next_state = state2;
					state4: next_state = state3;
					state5: next_state = state4;
					state6: next_state = state5;
					state7: next_state = state6;
					default:next_state = state1;
				endcase
			end
			else 
				next_state = state;
		end
		else 
			next_state = state0;
	end
	always@(posedge clk or posedge rst)begin
		if(rst)
			state <= state0;
		else if(on_or_off && state == state0)
				state <= state1;
		else
			state <= next_state ;
	end
	
	always@(*)begin
			case(state)
				state0: led = 7'b0000000;
				state1: led = 7'b0000001;
				state2: led = 7'b0000011;
				state3: led = 7'b0000111;
				state4: led = 7'b0001111;
				state5: led = 7'b0011111;
				state6: led = 7'b0111111;
				state7: led = 7'b1111111;
				default: led = 7'b000001;
			endcase
	end	
endmodule
