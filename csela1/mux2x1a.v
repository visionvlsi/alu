module MUX2to1_w4(output [3:0] y, input [3:0] i0, i1, input s);

  wire [3:0] e0, e1;
  not (sn, s);
  
  and (e0[0], i0[0], sn);
  and (e0[1], i0[1], sn);
  and  (e0[2], i0[2], sn);
  and  (e0[3], i0[3], sn);
      
  and  (e1[0], i1[0], s);
  and (e1[1], i1[1], s);
  and  (e1[2], i1[2], s);
  and (e1[3], i1[3], s);
  
  or  (y[0], e0[0], e1[0]);
  or  (y[1], e0[1], e1[1]);
  or  (y[2], e0[2], e1[2]);
  or  (y[3], e0[3], e1[3]);
  
endmodule