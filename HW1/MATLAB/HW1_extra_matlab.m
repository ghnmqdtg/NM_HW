clear all
close all
format long

attempts = 1e7;

% The following takes 0.6s to compute
tic
tmp = randi([0 3], 4, attempts);

up = sum(tmp == 0)';
down = sum(tmp == 1)';
left = sum(tmp == 2)';
right = sum(tmp == 3)';

occurrences = sum(up == down & left == right);
probability = occurrences / attempts
toc

% The following takes 80s to compute
directions = ["A" "B" "C" "D"];
occurrences = 0;
attempts = 1e7;
limit = 4;

tic
for i = 1:attempts
	steps = [];
	
	for i = 1:limit
        x = randi([1 4]);
		steps = [steps, directions(1, x)];
    end

    A = length(find(steps=='A'));
    B = length(find(steps=='B'));
    C = length(find(steps=='C'));
    D = length(find(steps=='D'));

    if(A == 2 & B == 2)
        occurrences = occurrences + 1;
    elseif(C == 2 & D == 2)
        occurrences = occurrences + 1;
    elseif(A == 1 & B == 1 & C == 1 & D == 1)
        occurrences = occurrences + 1;
    end
    steps = [];
end
probability = occurrences / attempts
toc
