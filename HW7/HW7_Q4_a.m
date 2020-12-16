clear;
close all;
format long;

func = @(x) 1./(1 + 25 * x.^2);

X = -1: 0.5 :1;
Y = func(X);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = -1 : 0.01 : 1;
plot(x, func(x));
% Config of figure
title('Runge’s function');
ylim([-0.6 1.2])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data', 'Runge’s function', 'location', 'best');