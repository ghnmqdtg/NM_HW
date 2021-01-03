clear;
close all;
format long;

real_func = @(t, varargin) 3 - 0.998 * exp(-1000 * t) - 2.002 * exp(-t);
dydt = @(y, t, varargin) - 1000 * y + 3000 - 2000 * exp(-t);
tspan = 0 : 2;
y0 = 1;
h = 0.1;
varargin = [];

% y is obtain by iteration
[t, y] = eulode(dydt, tspan, y0, h);

figure(1)
plot(t, y);
hold on;
plot(t, real_func(t), 'r')
xlabel('n')
ylabel('y')
legend('y1', 'y2')