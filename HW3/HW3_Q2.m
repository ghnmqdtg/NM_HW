clear all
close all
format long
hold on;
grid on;
syms x;

f = x ^ 3 - 10 * x ^ 2 + 6;
T = taylor(f, x, 'ExpansionPoint', 6);

fplot([T f]);
xlim([-10 15]);
ylim([-500 500]);

title('Taylor Series Expansion')
legend('Approximation',...
       'x ^ 3 - 10 * x ^ 2 + 6','Location','Best')