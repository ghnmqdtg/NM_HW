clear all
close all
format long

A = [0.003 59.14;5.291 -6.13];
b = [59.17; 46.78];

xx = inv(A) * b
x = GaussElimination(A, b)

% flip array up to down
A = flipud(A);
b = flipud(b);

xx = inv(A) * b
x = GaussElimination(A, b)