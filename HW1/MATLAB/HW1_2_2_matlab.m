clear all
close all
format long

num = 10e7;
total = 0;
occurrences = 0;

% The following takes 1.6s to compute
tic
	x = rand(1, num)';
	y = rand(1, num)';
	total = sum(x + y <= 1);
	occurrences = sum((x + y > 1 / 2 & x < 1 / 2 & y < 1 / 2));
    probability = occurrences / total
toc

% The following takes 5.6s to compute
tic
for i = 1:num
	x = rand;
	y = rand;
	if(x + y <= 1)
		total = total + 1;
		if(x + y > 1 / 2 & x < 1 / 2 & y < 1 / 2)
			occurrences = occurrences + 1;
		end
	end
end
probability = occurrences / total
toc
