clear all
close all
format long

A = [8 2 -1; 3 10 1; -1 2 20];
b = [3; -16; 15];

es = 1e-5;
maxit = 1000;

xx = inv(A) * b

[x, ea, iter] = GaussSeidel(A , b, es, maxit)
