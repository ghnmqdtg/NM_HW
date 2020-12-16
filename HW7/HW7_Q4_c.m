clear;
close all;
format long;

func = @(x) 1./(1 + 25 * x.^2);

X = -1: 0.5 :1;
Y = func(X);
desired_x = 0.8;
yint = [];

for i = 2 : length(X)
    yint = [yint Newtint(X(1:i), Y(1:i), desired_x)];
end

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = -1 : 0.01 : 1;
plot(x, func(x));

for i = 2 : length(X)
    plot(x, Newtint(X(1:i), Y(1:i), x));
end

plot(desired_x, func(desired_x), 'x', 'MarkerSize', 10, 'color', 'b');
plot(desired_x, yint, 'x', 'MarkerSize', 10, 'color', 'r');

% Config of figure
title('Runge’s function');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Runge’s function',...
       'Estimated 1-Order Polynomial',...
       'Estimated 2-Order Polynomial',...
       'Estimated 3-Order Polynomial',...
       'Estimated 4-Order Polynomial',...
       'True Value',...
       'Desired Value',...
       'location', 'best');