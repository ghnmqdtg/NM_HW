clear;
close all;
format long;

x = log(1: 5);
y = [0.5 2 2.9 3.5 4];
n = length(x);

xx = x.*x;
xy = x.*y;

a = (n * sum(xy) - sum(x) * sum(y)) / (n * sum(xx) - sum(x) ^ 2)
b = mean(y) - a * mean(x)

figure(1);
plot(x, y, 'o');
hold on;

xr = log(0: 6);
yr = b + a.*xr;
plot(xr, yr);
xlabel('ln(x)');
ylabel('y');

func = @(x) b + a*log(x);
vpa(subs(func, 2.6))
plot(log(2.6), vpa(subs(func, 2.6)),'^')
title('Transformed ');
legend('Given Data', 'Estimated line');