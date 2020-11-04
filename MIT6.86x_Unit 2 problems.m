

X = [1,0,1; 1,1,1; 1,1,-1; -1,1,1];

Y = [2; 2.7; -0.7; 2];

Theta = [0; 1; 2];


hinge_loss = hingeloss(X,Y,Theta)

sq_err_loss = squared_error_loss(X,Y,Theta)