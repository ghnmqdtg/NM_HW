clear all
close all
format long
hold on;
grid on;
syms x;

f = cos(x);

fplot([f]);
n = 1:4;
for i = n
	T = taylor(f, x, 'Order', 2*i);
	fplot([T]);
end

title('Cos(x) and its family curves');
legend('cos(x)',...
	   'n = 1',...
	   'n = 2',...
	   'n = 3',...
	   'n = 4',...
       'Location','Best');