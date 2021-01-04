clear
close all
format long

% The given function
func = @(x) 8 + 4.*cos(x);
lower_bound = 0;
upper_bound = pi / 2;
actual = 8 * (upper_bound - lower_bound) + 4 * (sin(upper_bound) - sin(lower_bound));

n = [2 3];
step_size = (upper_bound + lower_bound) / sum(n);
estimated = 0;

% Update the boundary
upper_bound = lower_bound + n(1) * step_size;
% Simpson’s 1/3 for n = 2
estimated = estimated + Simpson(func, lower_bound, upper_bound, '1/3', n(1));
lower_bound = lower_bound + n(1) * step_size;
upper_bound = lower_bound + n(2) * step_size;
% Simpson’s 3/8 for n = 3
estimated = estimated + Simpson(func, lower_bound, upper_bound, '3/8', n(2));

% The error
error_value = abs(estimated - actual) / actual;

% Print out the information
fprintf('Q1-g: Composite Simpson’s Rule\n');
fprintf('Estimated Value: %.10f\n', estimated);
fprintf('Actual Value:    %.10f\n', actual);
fprintf('Percent Error:   %.5f%%\n', error_value * 100);