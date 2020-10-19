clear all
close all
format long

a = [1 -2; -2 8];
b = [1; 2];
[L, U] = lu(a);

true_x = inv(a)*b;
x = inv(L*U)*b;
x = inv(U)*inv(L)*b;

% the right way to use lu()
[L, U, P] = lu(a) % L*U == P*a
L*U

% P * a = L * U
P.'*L*U

b = P.*b;
% \ inverse
d = L\b;
x = U\d

