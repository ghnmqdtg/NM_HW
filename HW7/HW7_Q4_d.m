clear;
close all;
format long;

func = @(x) 1./(1 + 25 * x.^2);

X = -1: 0.5 :1;
Y = func(X);
n = length(X);
s = Natural_cubic_spline(X, Y);

%-------------------- Plot the figure --------------------%
hold on;

% Plot data points
plot(X, Y, 'o');

x = -1 : 0.01 : 1;
% plot the real function
plot(x, func(x));

% Plot the Lagrange interpolating polynomial
plot(x, Lagrange(X, Y, x))

% Plot the cubic spline
x_tmp = [];
y_tmp = [];
for i = 1 : n - 1
    x = X(i) : 0.01 : X(i + 1);
    y = @(x, i) s(i, 1) + s(i, 2) * (x - X(i)) + s(i, 3) * (x - X(i)).^ 2 + s(i, 4) * (x - X(i)).^ 3;
    x_tmp = [x_tmp x];
    y_tmp = [y_tmp y(x, i)];
end

plot(x_tmp, y_tmp);


% Config of figure
title('Natural cubic spline');
xlabel('x coordinate')
ylabel('y coordinate')
legend('Given Data',...
       'Runge’s function',...
       'Lagrange(4-order)',...
       'Cubic Spline',...
       'location', 'best');