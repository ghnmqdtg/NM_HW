clear;
close all;
format long;

X = [1 2 3 5 7 8];
Y = [3 6 19 99 291 444];
desired_x = 4;
yint = [];

for i = 2 : length(X)
    yint = [yint Newtint(X(1:i), Y(1:i), desired_x)];
end

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = 0 : 0.25 : X(length(X)) + 1;

% order = points - 1, points >= 2
% polynomials for order over 3 have the same result
for i = 2 : length(X)
    plot(x, Newtint(X(1:i), Y(1:i), x));
end

plot(desired_x, yint, 'x', 'MarkerSize', 10, 'color', 'r');

% Config of figure
title('Newton’s Interpolating Polynomial');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Order 1',...
       'Order 2',...
       'Order 3',...
       'Order 4',...
       'Order 5',...
       'Desired Data',...
       'location', 'best');