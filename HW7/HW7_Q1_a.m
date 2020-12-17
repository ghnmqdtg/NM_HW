clear;
close all;
format long;
% determine data points
X = 0 : 7;
Y = sin(X);
n = length(X);

% 1: not-a-knot
s = cubic_spline(X, Y, 1);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

% Plot the estimated line
x_tmp = [];
y_tmp = [];

for i = 1 : n - 1
    x = X(i) : 0.25 : X(i + 1);
    y = @(x, i) s(i, 1) + s(i, 2) * (x - X(i)) + s(i, 3) * (x - X(i)).^ 2 + s(i, 4) * (x - X(i)).^ 3;
    x_tmp = [x_tmp x];
    y_tmp = [y_tmp y(x, i)];
end

plot(x_tmp, y_tmp);

% Config of figure
title('Not-a-knot Spline');
xlim([-0.5 7.5])
ylim([-1.5 1.5])
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data', 'Spline', 'location', 'best');