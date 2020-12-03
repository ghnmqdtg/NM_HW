clear;
close all;
format long;

X = [1 2 3 4 5]';
Y = [2.2 2.8 3.6 4.5 5.5]';
n = length(X);

Z = [ones(n, 1) X 1./X];
A = inv(Z'*Z)*Z'*Y;

% y = a + bx + c/x
func = @(x) A(1) + A(2).*x + A(3)./x;

% Conpute coefficient of determination
avg_Y = mean(Y);
St = sum((Y - avg_Y).^2);
Sr = sum((Y-func(X)).^2);
r2 = (St - Sr) / St;

% Conpute average error 
avg_error = 1 / n * St;

% Plot the figure
hold on;
% Plot points
plot(X, Y, 'o');
% Plot the estimated line
x = linspace(min(X) - 1, max(X) + 1, 100);
plot(x, func(x));
% Config of figure
title('Regression');
legend('Given Data', 'Estimated line');