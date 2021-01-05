clear
close all
format long

% The given function
func = @(x, varargin) (exp(x).*sin(x))./(1+x.^2);
lower_bound = 0;
upper_bound = 2;
es = 0.05;
maxit = 50;
varargin = [];

[q, I, ea, iter] = romberg(func, lower_bound, upper_bound, es, maxit, varargin);

% Print out the information
fprintf('Q2: Romberg Integration\n');
fprintf('Estimated Value: %.10f\n', q);
fprintf('Accuracy: %.5f%%\n', es * 100);
fprintf('Approximate relative error: %.5f%%\n', ea * 100);