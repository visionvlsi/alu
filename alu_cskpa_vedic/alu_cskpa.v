`timescale 1ns / 1ps
/*
The arithmetic  operations are 
?addition, subtraction, multiplication, increment and decrement  // 5 operations
The bitwise logical operations are 
?AND, OR, NOT, NAND, NOR, XOR, XNOR // 7 operations
Shifting operations performed are 
?Arithmetic and logical, left and right shift operations // 4 operations

5+7+4=16 operations
*/
// 5- The Arithmetic operations
//addition, subtraction, multiplication, increment and decrement  // 5 operations
`define ADD 0
`define SUB 1
`define MUL 2
`define INCR 3
`define DECR 4
//7-The Bitwise logical operations
//AND, OR, NOT, NAND, NOR, XOR, XNOR // 7 operations
`define AND 5
`define OR 6
`define NOT 7
`define NAND 8
`define NOR 9
`define XOR 10
`define XNOR 11
//Shifting operations performed are 
//Arithmetic and logical, left and right shift operations // 4 operations
`define ARSH 12
`define ALSH 13
`define LRSH 14
`define LLSH 15

module alu_cskpa(operand1, operand2, opcode, result, carry_out, product);
input [31:0]operand1, operand2;
input [3:0]opcode;
output reg [31:0]result;
output reg carry_out;
output reg [63:0]product;
wire [63:0]c;

wire [31:0]sum;
wire cout;

CSkipA32 ins1(.sum(sum), .cout(cout), .a(operand1), .b(operand2));
vedic_32x32 ins2(.a(operand1),.b(operand2),.c(c));

always@*
case(opcode)
// 5- The Arithmetic operations
//addition, subtraction, multiplication, increment and decrement  // 5 operations

`ADD: {carry_out,result}={cout,sum};
`SUB: {carry_out,result}=operand1 - operand2;

//`MUL: product=operand1 * operand2;
`MUL: product=c;

`INCR: {carry_out,result}=operand1 + 1'b1;
`DECR: {carry_out,result}=operand1 - 1'b1;

//7-The Bitwise logical operations
//AND, OR, NOT, NAND, NOR, XOR, XNOR // 7 operations
`AND: result=operand1 & operand2;
`OR: result=operand1 | operand2;
`NOT: result=~operand1;
`NAND:result=~(operand1 & operand2);
`NOR:result=~(operand1 | operand2);
`XOR:result=operand1 ^ operand2;
`XNOR: result=operand1 ^~ operand2;
//Shifting operations performed are 
//Arithmetic and logical, left and right shift operations // 4 operations
`ARSH: result=operand1 >>> 1;
`ALSH: result=operand1 <<< 1;
`LRSH: result=operand1 >> 1;
`LLSH: result=operand1 << 1;
endcase
endmodule

