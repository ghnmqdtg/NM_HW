clear all
close all
format long

num = 1e7;
circle_points = 0;

tic
for i = 1:num
	x = 2*rand-1;
	y = 2*rand-1;
	if (x^2 + y^2) <= 1
		circle_points = circle_points + 1;
toc

%{
	x = rand(1, N) * 2 - 1;
	y = rand(1, N) * 2 - 1;

	circle_points = sum(x.^2 + y.^2 < 1)
}%

pi = 4*circle_points/num
