clear all
close all
format long

A = [10 -5; -5 10];

[v, lambda] = eig(A);

lambda = diag(lambda);

T = 1./(sqrt(lambda)/2/pi);

t = 0 : 0.1 : 3;

figure(1)