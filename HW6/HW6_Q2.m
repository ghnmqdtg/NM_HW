clear;
close all;
format long;
syms x y;

func = 2.25 * x * y + 1.75 * y - 1.5 * x ^ 2 - 2 * y ^ 2;

diff_x = diff(func, x);
diff_y = diff(func, y);

% Solve the system of linear equations in two unknowns
[x, y] = solve(diff_x, diff_y);

extremum = vpa(subs(func));

[X,Y] = meshgrid(-3: .1: 3);
Z =  2.25.*X.*Y + 1.75.*Y - 1.5.*X.^2 - 2.*Y.^2;
figure
mesh(X, Y, Z);
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('Z');