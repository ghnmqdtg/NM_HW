clear all
close all

x = 10: 10: 80;
y = [25 70 380 550 610 1220 830 1450];
n = length(x);

xx = x.*x;
xy = x.*y;

a1 = (n * sum(xy) - sum(x) * sum(y)) / (n * sum(xx) - sum(x) ^ 2)
a0 = mean(y) - a1 * mean(x)

figure(1);
plot(x, y, 'o');
hold on;

% 0: 90;
xr = 10: 10: 80;
yr = a0 + a1.*xr;
plot(xr, yr);

x = x.';
y = y.';

z = [ones(n, 1) x];
a = inv(z' * z) * z' * y

St = sum((y - mean(y)).^2)
Sr = sum((y - yr'.^2))

% r square
r2 = 1 - Sr / St
syx = sqrt(Sr / (length(x) - length(a)))