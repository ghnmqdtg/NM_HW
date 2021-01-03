clear;
close all;
format long;

predprey = @(t, y, varargin) [1.2 * y(1) - 0.6 * y(1) * y(2); - 0.8 * y(2) + 0.3 * y(1) * y(2)];
tspan = [0 20];

y0 = [2, 1];
h = 0.1;

varargin = [];
[t, y] = rk4sys(predprey, tspan, y0, h, varargin);

figure(1)
plot(t, y);
% discrete
xlabel('n');
ylabel('y');
legend('y1', 'y2');

figure(2)
plot(y(:, 1), y(:, 2));
% plot3(t, y(:, 1), y(:, 2));
xlabel('y1');
ylabel('y2');