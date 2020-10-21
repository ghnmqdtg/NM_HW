<<<<<<< HEAD
    clear all
    close all
    format long
    syms x

    func = @(x, varargin) - 2 * x ^ 6 - 1.5 * x ^ 4 + 10 * x + 2;
    diff_func(x) = diff(func(x), x);
    xl = 0; xu = 1;
    x1 = 0; x2 = 1;
    es = 0.05;
    maxit = 50;
    varargin = [];

    % bisection method
    [x_max_bisect, ea, iter] = bisect(@(x, varargin) diff_func(x), xl, xu, es, maxit, varargin)
    fmax_bisect = func(x_max_bisect)

    % secant method
    [x_max_secant, ea, iter] = secant_method(@(x, varargin) diff_func(x), x1, x2, es, maxit, varargin)
    fmax_secant = func(x_max_secant)

    [x_max_newton, ea, iter] = newton_method(@(x, varargin) diff_func(x), x2, es, maxit, varargin)
    fmax_newton = func(x_max_newton)
=======
clear all
close all
format long
syms x

func = ;

% lower bound
xl = 0;
% upper bound
xu = 2;
% initial value
>>>>>>> origin/master
