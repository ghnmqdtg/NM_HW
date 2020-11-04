clear all
close all
format long

A = [8 5 1;
     3 7 4;
     2 3 9];

% L * U == P * A
[L, U] = lu(A);

% 3(a)
if L * U == A
    disp('3(a) Correct: L * U == A');
end

% 3(b)
if det(A) == det(L * U)
    disp('3(b) Correct: det(A) = det(L * U) = det(L) * det(U)');
end
