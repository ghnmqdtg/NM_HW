clear all
close all
format long

num = 10e7;
occurrences = 0;

% The following takes 2.3s to compute
tic
x = rand(1, num)';
y = rand(1, num)';
z = rand(1, num)';
occurrences = sum(x + y > z & y + z > x & z + x > y);
probability = occurrences / num
toc

% The following takes 7.2s to compute
tic
for i = 1:num
	x = rand;
	y = rand;
	z = rand;
	if (x + y > z & y + z > x & z + x > y)
		occurrences = occurrences + 1;
	end
end
probability = occurrences / num
toc
