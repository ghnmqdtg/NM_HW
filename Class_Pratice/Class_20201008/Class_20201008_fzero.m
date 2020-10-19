clear all
close all
format long

options = optimset('display', 'iter');

func = @(x) x^10-1;

[x, fx] = fzero(func, 0.5, options);