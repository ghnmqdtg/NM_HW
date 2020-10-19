clear all
close all
format long

% options = optimset('display', 'iter');

func = @(x) x^.3-5*x.^2-20*x-3;

% lower bound
xl = -8;
% upper bound
xu = 10;
% error tolerance
es = 0.0001;
maxit = 50;
varargin=[];

[x, fx, ea, iter] = goldmin(func, xl, xu, es, maxit, varargin);