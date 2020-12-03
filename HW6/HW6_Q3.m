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

t = 0 : 0.1 : 50;

for i = 1:2
     figure(i);
     hold on;
     title("w^2 = " + num2str(lambda(i)));
     plot(t, sin(2 * pi / T(i, :) * t) * v(1, i)/v(i, i));
     plot(t, sin(2 * pi / T(i, :) * t) * v(2, i)/v(i, i));
     legend('mass1', 'mass2', 'location', 'best');
     xlabel('t (time)'); ylabel('x (displacement)');
end