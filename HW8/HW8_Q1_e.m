clear
close all
format long

% The given function
func = @(x) 8 + 4.*cos(x);
lower_bound = 0;
upper_bound = pi / 2;
actual = 8 * (upper_bound - lower_bound) + 4 * (sin(upper_bound) - sin(lower_bound));

n = 4;
step_size = (upper_bound + lower_bound) / n;
x_step = lower_bound: step_size: upper_bound;

% Simpson's 1/3 Rule for n = 4
% add 1, for counting the interior points
odd = sum(func(x_step(1+1:2:end-1)));
even = sum(func(x_step(2+1:2:end-2)));
estimated = step_size / 3 * (func(x_step(1)) + 4 * odd + 2 * even + func(x_step(end)));
% The error
error_value = abs(estimated - actual) / actual;

% Print out the information
fprintf('Q1-e: Composite Simpson’s 1/3 Rule for n = 4\n');
fprintf('Estimated Value: %.10f\n', estimated);
fprintf('Actual Value:    %.10f\n', actual);
fprintf('Percent Error:   %.5f%%\n', error_value * 100);

% Plot the figure
hold on;
x = -0.5: 0.001: 2;
plot(x, func(x));
plot([lower_bound x_step upper_bound] , [0 func(x_step) 0]);
xlim([lower_bound-0.5 upper_bound+0.5]);
ylim([0 13])
title('Q1-e: Composite Simpson’s 1/3 Rule for n = 4')
legend("Actual function", "Estimated");