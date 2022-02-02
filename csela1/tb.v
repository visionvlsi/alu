`timescale 1ns/1ns 
module test;
reg [31:0] a, b;
wire cout;
wire [31:0] sum;
integer i;
CSelA32 ins1(sum, cout,a, b);

initial begin
$dumpfile("csela.vcd");
$dumpvars(1);
 end
 
 initial
 for(i=0;i<=15;i=i+1)
 begin
 a=i;
 b=i*2;
 #5;
 end
 endmodule