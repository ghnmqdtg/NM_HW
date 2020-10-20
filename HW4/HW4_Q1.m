clear all
close all
format long
% hold on;
% grid on;
syms x;

func = 2 * x + 3 / x;
iter = 10;
init_points = [0.1, 0.5, 5];

[min_x] = parabolic_interpolation(func, iter, init_points(1), init_points(2), init_points(3))