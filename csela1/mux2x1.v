module MUX2to1_w1(output y, input i0, i1, s);

  wire e0, e1;
  not (sn, s);
  
  and (e0, i0, sn);
  and  (e1, i1, s);
  
  or (y, e0, e1);
  
endmodule
