clear all
close all
format long

A = [0.8 -0.4    0;
    -0.4  0.8 -0.4;
       0 -0.4  0.8];

b = [41; 25; 105];

x = zeros(3, 1);

% Augmented matrix [A | b]
Aug = [A b];
n = length(A);

Aug(1, :) = Aug(1, :)./A(1, 1);

for i = 2 : n
    Aug(i, :) = (Aug(i, :) - Aug(i - 1, :) * Aug(i, i - 1));
    Aug(i, :) = Aug(i, :) / Aug(i, i);
end

x(3) = Aug(3, n + 1);
for i = n - 1 : -1 : 1
    x(i) = Aug(i, n + 1) - Aug(i, i + 1) * x(i + 1);
end

inv(A) * b
x

% x(2) = Aug(2, n + 1) - Aug(2, 3) * x(3)
% x(1) = Aug(1, n + 1) - Aug(1, 2) * x(2)

% x(2) = Aug(2, n + 1) - Aug(2, 2 + 1) * x(2 + 1)
% x(1) = Aug(1, n + 1) - Aug(1, 1 + 1) * x(1 + 1)

% x =

%    173.7500000000000
%    244.9999999999999
%    253.7500000000000