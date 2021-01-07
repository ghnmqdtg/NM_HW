clear;
close all;
format long;

% e^t
y = @(t) exp(t);
dydt = @(t, y) 1 * y;
tspan = [0 2];

% sin(t)
% y = @(t) sin(t);
% dydt = @(t, y) cos(t);
% tspan = [0 7];

% t*sin(t)
% y = @(t) sin(t)./t;
% dydt = @(t, y) (t.*cos(t)-sin(t))./(t.^2);
% tspan = [-10 10];

y0 = y(tspan(1));
h = 0.1;

% y is obtain by iteration
[t_aprox, y_aprox] = HeunODE(dydt, tspan, y0, h);

% Plot the figure
figure(1)
hold on;
func_name = func2str(y);
t_actual = tspan(1): 0.005: tspan(end);
plot(t_actual, y(t_actual))
plot(t_aprox, y_aprox, 'r');
xlabel('t')
ylabel('y')
legend(func_name, 'Approximate')
title('Heun’s Method')