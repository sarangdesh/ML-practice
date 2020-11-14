
%% EXPECTATION-MAXIMIZATION (EM) ALGORITHM FOR CLUSTERING

% NOTE: Woks with 1xn dimensional input vectors only

clear all, clc;

% Input data (example)
% x = [-1, 0, 4, 5, 6];

mu1   = 6   ;
var1  = 1   ;
p1    = 0.5 ;
mu2   = 7   ;
var2  = 4   ;
p2    = 0.5 ;


% theta = [p1, p2;
%          mu1, mu2;
%          var1, var2]
theta = [p1, p2; mu1, mu2; var1, var2];
% This is the initial theta, i.e. theta_0


## The convergence criteria that you should use is that
## the improvement in the log-likelihood is less than or
## equal to  10?6  multiplied by the absolute value of the
## new log-likelihood. In slightly more algebraic notation:
## 
## new log-likelihood ? old log-likelihood ? (10^?6)*|new log-likelihood|



num_iter = 100;

for iter=1:num_iter
  % Log-likelihood
  % l~(D;?) :=  {i} {j} p(y=k|xi)*log[(p(xi,y=k; theta)/p(y=k|xi)]
  %          =  {i} {j} m * log( d / m ),
  % where:  m = p(y=k|xi)  and  d = p(xi,y=k; theta)
  %           = p(y)*N(xi,y;theta)/p(xi|theta)
  %         D = p(xi|theta)
  
  
  % Compute D = p(xi|theta)
  for j=1:size(theta)(2)
    D(j,:) = gaussianDensity(x, theta(2,j), theta(3,j));
  endfor
  D = theta(1,1)*D(1,:) + theta(1,2)*D(2,:)
  
  % Compute log-likelihood
  log_likelihood(iter) = sum(log(D))
  ##for i=1:size(x)(2)
  ##  for j=1:size(theta)(2)
  ##    d = gaussianDensity(x(1,i), theta(2,j), theta(3,j));
  ##    m = theta(1,j) * d / D(1,i);
  ##    log_likelihood = log_likelihood + m*log(d/m);
  ##  endfor
  ##endfor
  
  
  % Compute g = p(j|i)
  for j=1:size(theta)(2)
    g(j,:) = theta(1,j).*gaussianDensity(x, theta(2,j), theta(3,j))./D;
  endfor
  
  %% UPDATES
  % ncap_j = {i} p(y) * d{i} / D{i}
  ncap_j = sum(g,2);
  
  % pcap_j = ncapj / n
  pcap_j = ncap_j / size(x)(2);
  
  % mucap_j = sum[ p(j|i)*xi ] / ncap_j
  temp1 = g .* x
  mucap_j = sum(temp1,2) ./ ncap_j;
  
  % vcap_j = sum[ p(j|i)*||xi - mucapj||^2 ] / (ncapj*d)
  for k=1:size(theta)(2)
    xtemp(k,:) = x;
  endfor
  temp2 = xtemp - mucap_j;
  temp2 = temp2.^2;
  temp2 = g .* temp2;
  vcap_j = sum(temp2,2) ./ (ncap_j * size(x)(1) );
  
  theta = [pcap_j'; mucap_j'; vcap_j'];
  
  if iter>1
    if log_likelihood(iter) - log_likelihood(iter-1) <= 10^-6 * abs(log_likelihood(iter))
      printf("EM algorithm converged. Answers:");
      theta
      return
    else
      %
    endif
  endif
  
  
endfor