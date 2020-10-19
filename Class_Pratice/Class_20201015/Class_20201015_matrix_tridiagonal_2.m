clear all
close all
format long

A = [1 2 0 0
     2 3 4 0
     0 4 5 1
     0 0 5 6];
b = [1; 2; 3; 4];

AA = [zeros(4, 1) A zeros(4, 1)];
e = diag(AA(:,1:4)); % [0; 2; 4; 5];
f = diag(A);
g = diag(AA(:,3:6)); % [2; 4; 1; 0];
r = b;

xx = inv(A) * b

root = GaussElimination(A, b)