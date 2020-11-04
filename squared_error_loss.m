function [Loss] = squared_error_loss(X,Y,Theta)
  
  % Loss = z^2/2
  
  n = size(Y,1);
  Z = Y - X*Theta;
  sum = sum(Z.^2 / 2);
  Loss = sum/n;
  
  
endfunction
