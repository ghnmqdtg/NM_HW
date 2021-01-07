clear;
close all;
format long;

y = @(t) exp(-t);
dydt = @(t, y) - 100000 * y + 99999 * exp(-t); % dy/dt
tspan = [0 2];
h = 0.00001; % Steps, bigger step yields bigger error

y0 = 0;
[t_aprox, y_aprox] = implicit_EulerODE(dydt, tspan, y0, h);

hold on;
t_actual = tspan(1): 0.005: tspan(end);
plot(t_actual, y(t_actual));
plot(t_aprox, y_aprox);
legend("True function", "Approximated", 'location', 'best');
title("Implicit Euler Method");