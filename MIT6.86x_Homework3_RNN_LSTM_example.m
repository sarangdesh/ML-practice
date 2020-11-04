clear all, clc;
% Parameters

% Forget state
W_fh = 0;
W_fx = 0;
b_f = -100;

% Input state
W_ih = 0;
W_ix = 100;
b_i = 100;

% Output state
W_oh = 0;
W_ox = 100;
b_o = 0;

% Memory cell
W_ch = -100;
W_cx = 50;
b_c = 0;


% Initial conditions
h_init = 0;
c_init = 0;

% Input sequence  = [0,0,1,1,1,0]
%X = [0;0;1;1;1;0]
X = [1;1;0;1;1]

% LSTM state 1

for(i=1:length(X))
  
  if(i==1)
    f_t = sigmoid_state(W_fh, h_init, X(i,1), W_fx, b_f);
    i_t = sigmoid_state(W_ih, h_init, X(i,1), W_ix, b_i);
    o_t = sigmoid_state(W_oh, h_init, X(i,1), W_ox, b_o);
    z = lineartrans(W_ch, h_init, W_cx, X(i,1), b_c);
  else
    f_t = sigmoid_state(W_fh, h(i-1,1), X(i,1), W_fx, b_f);
    i_t = sigmoid_state(W_ih, h(i-1,1), X(i,1), W_ix, b_i);
    o_t = sigmoid_state(W_oh, h(i-1,1), X(i,1), W_ox, b_o);
    z = lineartrans(W_ch, h(i-1,1), X(i,1), W_cx, b_c);
  endif

  c_t = f_t.*c_init + i_t.*z;
  % tanh simplification applied as dictated.
  c_t(c_t>=1) = 1;
  c_t(c_t<=-1) = -1;

  h(i,1) = o_t .* c_t

endfor

printf("h = \n\n");
disp(h);

