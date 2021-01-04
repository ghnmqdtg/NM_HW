clear
close all
format long

% The given function
func = @(x) 8 + 4.*cos(x);
lower_bound = 0;
upper_bound = pi / 2;
actual = 8 * (upper_bound - lower_bound) + 4 * (sin(upper_bound) - sin(lower_bound));

% Single application of the trapezoidal rule
estimated = (upper_bound - lower_bound) * (func(upper_bound) + func(lower_bound)) / 2;
% The error
error_value = abs(estimated - actual) / actual;

% Print out the information
fprintf('Q1-b: Single application of the trapezoidal rule\n');
fprintf('Estimated Value: %.10f\n', estimated);
fprintf('Actual Value:    %.10f\n', actual);
fprintf('Percent Error:   %.5f%%\n', error_value * 100);

% Plot the figure
hold on;
x = -0.5: 0.001: 2;
x_step = [lower_bound lower_bound upper_bound upper_bound];
y_step = [0 func(lower_bound) func(upper_bound) 0];
plot(x, func(x));
plot(x_step , y_step);
xlim([lower_bound-0.5 upper_bound+0.5]);
ylim([0 13])
title('Single application of the trapezoidal rule')
legend("Actual function", "Estimated");