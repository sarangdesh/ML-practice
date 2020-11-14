function P = gaussianDensity(x, mean, variance)
  
  P = 1/sqrt(2*pi*variance) * exp((x-mean).^2 /(-2*variance));
  
endfunction
