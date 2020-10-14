clear all
close all
format long

options = optimset('display', 'iter');

f = @(x) 2+x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2
[x, fval] = fminsearch(f, [-0.5, 0.5], options)
