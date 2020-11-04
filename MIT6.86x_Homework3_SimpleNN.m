clear all, clc
% Input layer weights
W = [1,0; 0,1; -1,0; 0,-1];
W0 = [-1;-1;-1;-1];

% Output layer weights
V = [1,1,1,1; -1,-1,-1,-1];
V0 = [0;2];

X = [3; 14];

z = W*X + W0;
z(z<=0) = 0;
%f = max(z,0);

U = V*z + V0;
U(U<=0) = 0

[o1, o2] = softmax_simple(U(1,1), U(2,1));

printf("o1 = %0.9f, o2 = %0.9f", o1, o2);


% 1x + 0y -1 = 2      or  x = 3
% 0x + 1y -1 = 13     or  y = 14
% -1x + 0y -1 = -4    or  x = 3
% 0x -1y -1 = -15     or  y = 14

% Area under z<0, where decision boundaries arae given by:
% x-1<0
% y-1<0
% -x-1<0
% -y-1<0
% Therefore, area = 4