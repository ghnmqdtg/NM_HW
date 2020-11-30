clear;
close all;
format long;

x = log(1: 5);
y = [0.5 2 2.9 3.5 4];
n = length(x);

xx = x.*x;
xy = x.*y;

a1 = (n * sum(xy) - sum(x) * sum(y)) / (n * sum(xx) - sum(x) ^ 2)
a0 = mean(y) - a1 * mean(x)

figure(1);
plot(x, y, 'o');
hold on;

xr = log(0: 5);
yr = a0 + a1.*xr;
plot(xr, yr);
xlabel('ln(x)');
ylabel('y');

func = @(x) a0 + a1*log(x);
vpa(subs(func, 2.6))
plot(log(2.6), vpa(subs(func, 2.6)),'r*')