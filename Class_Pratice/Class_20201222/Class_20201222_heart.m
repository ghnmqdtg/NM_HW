clear;
close all;
format long;

heart = @(y, varargin) - sqrt(2 * y - y * y);
tspan = [0 10];

% exp(0) = 1
y0 = [0.1];

h = 0.01;
varargin = [];
[t, y] = eulode(heart, tspan, y0, h, varargin);

figure(1)
polar(t, y);