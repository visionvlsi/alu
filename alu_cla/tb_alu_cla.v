`timescale 1ns / 1ps

module tb;

	// Inputs
	reg [31:0] operand1;
	reg [31:0] operand2;
	reg [3:0] opcode;

	// Outputs
	wire [31:0] result;
	wire carry_out;
	wire [63:0] product;
   integer i;
	// Instantiate the Unit Under Test (UUT)
	alu_cla uut (
		.operand1(operand1), 
		.operand2(operand2), 
		.opcode(opcode), 
		.result(result), 
		.carry_out(carry_out), 
		.product(product)
	);

	initial begin
		// Initialize Inputs
		operand1 = 8;
		operand2 = 8;
		
	end
	initial 
	for(i=0;i<=15;i=i+1)
	begin
	opcode=i;
	#10;
	end
      
endmodule

