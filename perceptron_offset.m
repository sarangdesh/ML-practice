
function [theta, theta_0] = perceptron_offset(x_, y_, theta_, theta_0_, T)
theta = theta_;
theta_0 = theta_0_;
mistakes = 0;
for t = 1:T
    for i = 1:length(y_)
        %fprintf("<%d>x(%d) = [%f %f]\n", t, i, x_(i, 1), x_(i, 2));
        if (y_(i,1) * ((x_(i,:)*theta) + theta_0)) <= 0
            theta = theta + (y_(i)*x_(i,:)');
            theta_0 = theta_0 + y_(i);
            fprintf("NO MATCH<%d>[%f %f],  %f\r\n", t, theta(1,1), theta(2,1), theta_0);
            mistakes=mistakes+1;
        else
            fprintf("MATCHED<%d>[%f %f],  %f\r\n", t, theta(1,1), theta(2,1), theta_0);
        end
    end
end
fprintf("Total number of misclassifications: %d", mistakes);

end