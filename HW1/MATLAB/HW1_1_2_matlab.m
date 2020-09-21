% Use Leibniz Formula to Estimate Pi
clear all
close all
format long

attempts = 1e7;
summation = 0;

% The following takes 0.151s to compute
tic
for i = 0:attempts-1
	summation = summation + ((-1)^i) / (2 * i + 1);
end

pi = 4 * summation
toc