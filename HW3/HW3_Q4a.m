clear all
close all
format long
hold on;
grid on;
syms x

f = sin(x);
error = [];

n = 1:10;
for i = n
	T = taylor(f, x, 'Order', 2*i)
    error_func = f - T;
    % substitute 1
    error_value = subs(error_func, 1);
    error(i) = error_value;
end

line(n, error);

title('The error between sin(x) and its Taylor series');
legend('The error between sin(x) and its Taylor series',...
       'Location','Best');