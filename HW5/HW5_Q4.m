clear all
close all
format long

x(1) = 4;
x(2) = 2;
x(3) = 7;

A = [x(1)^2 x(1) 1;
     x(2)^2 x(2) 1;
     x(3)^2 x(3) 1;];

% Q4a: Row Sum Norm
% abs_A = abs(A);
% row_sum_norm = max(sum(abs_A, 3))
condition_RS = norm(A, 'Inf') * norm(inv(A), 'Inf')

% Q4b: Spectral and Frobenius Norm
condition_Frobenius = norm(A, 'fro') * norm(inv(A), 'fro')
condition_Spectral = sqrt(max(eig(A.' * A))) * sqrt(max(eig(inv(A).' * inv(A))))
