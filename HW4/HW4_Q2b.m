clear all
close all
format long
syms x

func = 9 * exp(-x) * sin(2 * pi * x) - 3.5;

% lower bound
xl = 0;
% upper bound
xu = 2;
% initial value
x_min = 0;
x_max = 0;
fx_min = 100;
fx_max = -100;

x_position = xl;

while x_position <= xu
    fx_next = subs(func, x_position); 
    % looking for the minimum
    if fx_next < fx_min
        fx_min = fx_next;
        x_min = x_position;
    end
    % looking for the maximum
    if fx_next > fx_max
        fx_max = fx_next;
        x_max = x_position;
    end
    x_position = x_position + 0.0001;
end

x_min
fx_min = vpa(subs(func, x_min))

x_max
fx_max = vpa(subs(func, x_max))