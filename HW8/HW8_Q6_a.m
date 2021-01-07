clear;
close all;
format long;

y = @(t) exp(-t);
dydt = @(t, y) - 100000 * y + 99999 * exp(-t);
tspan = [0 2];
h = 2e-5;

y0 = y(tspan(1));
[t_aprox, y_aprox] = explicit_EulerODE(dydt, tspan, y0, h);

hold on;
t_actual = tspan(1): 0.005: tspan(end);
plot(t_actual, y(t_actual));
plot(t_aprox, y_aprox);
legend("True function", "Approximated", 'location', 'best');
title("Explicit Euler Method");