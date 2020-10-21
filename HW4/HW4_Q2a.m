clear all
close all
format long
% hold on;
% grid on;

func = @(x, varargin) 9 * exp(-x) * sin(2 * pi * x) - 3.5;
<<<<<<< HEAD
% to calculate the maximum value with the same function
=======
>>>>>>> origin/master
flipped_func = @(x, varargin) - 1 * (9 * exp(-x) * sin(2 * pi * x) - 3.5);

% lower bound
xl = 0;
% upper bound
xu = 2;
% error tolerance
es = 0.0001;
maxit = 50;
varargin=[];

[x_min, fx_min, ea, iter] = goldmin(func, xl, xu, es, maxit, varargin);
[x_max, fx_max, ea, iter] = goldmin(flipped_func, xl, xu, es, maxit, varargin);

x_min, fx_min, x_max, fx_max

% [xmin, fval] = fminbnd(func, xl, xu)