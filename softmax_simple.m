function [o1, o2] = softmax_simple(u1, u2)
  % THIS IS NOT A STANDARD SOFTMAX FUNCTION - DO NOT USE FOR BLIND IMPLEMENTATION
  f1 = max(u1,0);
  f2 = max(u2,0);
  o1 = e^f1/ (e^f1 + e^f2);
  o2 = e^f2/ (e^f1 + e^f2);
endfunction


% With Beta
% o = e^(Beta*f2)/ (e^(Beta*f1) + (Beta*e^f2))


% Beta = 1

% e^f2/ (e^f1 + e^f2) >= 1/1000
% 1000*e^f2 >= e^f1 + e^f2
% 999*e^f2 >= e^f1
% log(999)+f2 >= f1
% f2 - f1 >= -log(999)
% f1 - f2 =< log(999)


% Beta = 3

% e^3f2/ (e^3f1 + e^3f2) >= 1/1000
% 1000*e^3f2 >= e^3f1 + e^3f2
% 999*e^3f2 >= e^3f1
% log(999) + 3f2 >= 3f1
% f1 - f2 <= log(999)/3


% Thus, by increasing the inverse temperature parameter Beta, f1-f2 can become smaller.