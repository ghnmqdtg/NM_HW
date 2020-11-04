clear all
close all
format long

A = [8 1 6; 3 5 7; 4 9 2];
b = [1; 2; 3];
es = 1e-5;
maxit = 1000;

x = inv(A) * b

[x, ea, iter] = GaussSeidal(A , b, es, maxit)
[x, ea, iter] = Jacobi(A , b, es, maxit)