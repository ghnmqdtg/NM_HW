clear;
close all;
format long;

real_func = @(t, varargin) exp(-2*t);
dydt = @(y, varargin) -2 * y;
tspan = 0 : 2;
y0 = 1;
h = 0.1;
varargin = [];

% y is obtain by iteration
[t, y] = eulode(dydt, tspan, y0, h, varargin);

figure(1)
plot(t, y);
hold on;
plot(t, real_func(t), 'r')
xlabel('n')
ylabel('y')
legend('y1', 'y2')