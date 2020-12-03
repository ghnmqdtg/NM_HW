clear;
close all;
format long;
syms w_square;

m = [5 10];
k = [0.1 1 0.2];

A = [((k(1) + k(2)) / m(1)), (- k(2) / m(1));
     (- k(2) / m(2)), ((k(2) + k(3)) / m(2))];

A_L = A - diag([w_square w_square]);
characteristic_poly = det(A_L);
w_square = solve(characteristic_poly);

[v, lambda] = eig(A);

% Get diagonal elements of matrix
lambda = diag(lambda);

T = 1./(sqrt(lambda)/2/pi);

t = 0 : 0.1 : 20;

figure(1);
% subplot(m,n,p)
% divides the figure into an m-by-n grid and creates axes in the position specified by p
subplot(1, 2, 1)
plot(t, cos(2 * pi / T(1, :) * t) * v(1, 1)/v(1, 1));
subplot(1, 2, 2)
plot(t, cos(2 * pi / T(1, :) * t) * v(2, 1)/v(1, 1));

figure(2);
% subplot(m,n,p)
% divides the figure into an m-by-n grid and creates axes in the position specified by p
subplot(1, 2, 1)
plot(t, cos(2 * pi / T(2, :) * t) * v(1, 2)/v(2, 2));
subplot(1, 2, 2)
plot(t, cos(2 * pi / T(2, :) * t) * v(2, 2)/v(2, 2));