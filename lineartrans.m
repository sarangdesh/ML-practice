function z = lineartrans(W_h, h, X, W_x, b)
  z = W_h.*h + W_x.*X + b;
  % tanh simplification applied as dictated.
  % TODO: Implement tanh
  z(z>=1) = 1;
  z(z<=-1) = -1;
endfunction