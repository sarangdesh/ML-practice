function [Loss] = hingeloss(X,Y,Theta)
  
  % Loss = 0    if z>=1
  % Loss = 1-z  if z<1
  n = size(Y,1);
  Z = Y - X*Theta;
  Z_temp = Z;
  %Z is a vector
  
  checker1 = Z(Z>=1);
  checker1(:) = 0;
  checker2 = Z_temp(Z<1);
  checker2(:) = 1 - checker2;
  sum = sum(checker1) + sum(checker2);
  Loss = sum/n;
  
  
  
endfunction
