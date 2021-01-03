clear
close all
format long

% The given function
func = @(x) 8 + 4.*cos(x);
lower_bound = 0;
upper_bound = pi / 2;
actual = 8 * (upper_bound - lower_bound) + 4 * (sin(upper_bound) - sin(lower_bound));

% Composite info
n = 2;
step_size = (upper_bound + lower_bound) / n;
x_step = lower_bound: step_size: upper_bound;

% Composite trapezoidal rule
estimated = step_size / 2 * (func(lower_bound) + 2 * sum(func(x_step(2:length(x_step)-1))) + func(upper_bound));
% The error
error_value = abs(estimated - actual) / actual;

% Print out the information
fprintf('Q1-c: Composite trapezoidal rule with n = %d\n', n);
fprintf('Estimated Value: %.10f\n', estimated);
fprintf('Actual Value:    %.10f\n', actual);
fprintf('Percent Error:   %.2f%%\n', error_value * 100);

% Plot the figure
hold on;
x = -0.5: 0.001: 2;
plot(x, func(x));
plot([lower_bound x_step upper_bound] , [0 func(x_step) 0]);
xlim([lower_bound-0.5 upper_bound+0.5]);
ylim([0 13])
title('Q1-c: Composite trapezoidal rule with n = 2')
legend("Actual function", "Estimated");