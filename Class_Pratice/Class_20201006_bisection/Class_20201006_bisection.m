clear all
close all
format long

func = @(x, varargin) x.^10-1;
xl = 0;
xu = 1.2;
es = 0.000001;
maxit = 50;
varargin = [];

[root, ea, iter] = bisect(func, xl, xu, es, maxit, varargin)