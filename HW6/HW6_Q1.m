clear all
close all
format long
syms x y

func = 2 * x ^ 2 + y ^ 2;
coordinate = [2 4];
direction = [3 2];

% Unit Vector of the direction
direction = direction / norm(direction, 2);

% Partial derivative at [x, y]
partial_diff = subs([diff(func, x) diff(func, y)], [x, y], coordinate);

% Directional derivative (in decimal form)
Ans = vpa(dot(partial_diff, direction));