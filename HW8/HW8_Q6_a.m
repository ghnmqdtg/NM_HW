clear;
close all;
format long;

y = @(t) exp(-t);
dydt = @(t, y) - 100000 * y + 99999 * exp(-t); % dy/dt
tspan = [0 2];
h = 2e-5; % Steps, bigger step yields bigger error

y0 = y(tspan(1));
[t_aprox, y_aprox] = explicit_EulerODE(dydt, tspan, y0, h);

hold on;
plot(t_aprox, y(t_aprox));
plot(t_aprox, y_aprox);
legend("True function", "Approximated", 'location', 'best');
title("Explicit Euler Method");