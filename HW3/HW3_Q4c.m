clear all
close all
format long

% setup the range of your plot in x and y (-2,2)
% the resolution (20 points)
x = linspace(10, 20, 40);
y = linspace(10, 20, 40);

% meshgrid is used to generates grid points x, y as 2D matrices X, Y
% http://bime-matlab.blogspot.com/2006/11/101meshgrid.html
[X, Y] = meshgrid(x, y);

% evaluate the function
Z = exp(X).*(cos(Y) + 1i * sin(Y));

% plot the figure
figure
% abs, real and imag are functions to be chosen
% mesh(X, Y, abs(Z));
mesh(X, Y, real(Z));
% mesh(X, Y, imag(Z));

% label as desired
xlabel('x coordinate');
ylabel('y coordinate');
zlabel('Z');
