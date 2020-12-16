clear;
close all;
format long;

X = [1 2 3 5 7 8];
Y = [3 6 19 99 291 444];
desired_x = 4;

yint = Newtint(X, Y, desired_x);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = 0 : 0.25 : X(length(X)) + 1;
plot(x, Newtint(X, Y, x));
plot(desired_x, yint, '.', 'MarkerSize', 30, 'color', 'r');

% Config of figure
title('Newton’s Interpolating Polynomial');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data', 'Polynomial', 'Desired Data', 'location', 'best');