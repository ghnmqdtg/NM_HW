clear
close all
format long

% The given function
func = @(x, y) (exp(-(x.^2 + y.^2)));
[X, Y] = meshgrid(-3:.01:3);

% Plot the figure
mesh(X, Y, func(X, Y));
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('Z');
title('Generate the Function')