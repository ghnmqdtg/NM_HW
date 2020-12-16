clear;
close all;
format long;

X = [1 2 3 5 7 8];
Y = [3 6 19 99 291 444];
desired_x = 4;

[yint, c] = Newtint(X, Y, desired_x);

% the following function only fits the constraints of this problem
func = @(x) c(1)...
           + c(2).*(x - X(1))...
           + c(3).*(x - X(1)).*(x - X(2))...
           + c(4).*(x - X(1)).*(x - X(2)).*(x - X(3))...
           + c(5).*(x - X(1)).*(x - X(2)).*(x - X(3)).*(x - X(4));

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = 0 : 0.25 : X(length(X)) + 1;
plot(x, func(x));
plot(desired_x, yint, '.', 'MarkerSize', 30, 'color', 'r');

% Config of figure
title('Newton’s Interpolating Polynomial');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data', 'Polynomial', 'Desired Data', 'location', 'best');