module PGGen(output g, p, input a, b);
 
  and   (g, a, b);
  xor #(2) (p, a, b);
 
endmodule
