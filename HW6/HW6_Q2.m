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