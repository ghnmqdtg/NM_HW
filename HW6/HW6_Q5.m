clear;
close all;
format long;

X = [1 2 3 4 5]'
Y = [2.2 2.8 3.6 4.5 5.5]'
n = length(X);

Z = [ones(n, 1) X 1./X]
A = inv(Z'*Z)*Z'*Y