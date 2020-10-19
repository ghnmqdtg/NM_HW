clear all
close all
format long

A = [1 2 0 0
     2 3 4 0
     0 4 5 1
     0 0 5 6];
b = [1; 2; 3; 4];

root_inv = inv(A)*b
root = GaussElimination(A, b)
TDMAsolver(A,b)
