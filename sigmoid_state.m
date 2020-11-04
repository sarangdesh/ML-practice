function t = sigmoid_state(W_h, h, X, W_x, b)
  % e.g. f_t = sigmoid(W_fh*h_init + W_fx*X + b_f)
  % Sigmoid simplification applied as dictated.
  % TODO: Implement sigmoid
  t = W_h.*h + W_x.*X + b;
  t(t>=1) = 1;
  t(t<=-1) = 0;
endfunction