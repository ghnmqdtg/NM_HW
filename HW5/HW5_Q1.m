clear all
close all
format long

A = [3+2i 4; -1i 1];
b = [2+1i; 3];

% REF: https://reurl.cc/4m8qpj
% size of the matix
[m,n] = size(A);

if m == n
    % use eye() to generates identity matrix with size(A)
    I = eye(size(A));
    % after rref, C = [I A^-1]
    C = rref([A I]);
    D = C(:, 1:m);
    % check if the determinant of A is not equal to 0
    if det(D) ~= 0
        inv_A = C(:, m + 1: 2 * m);
    else
        disp('Error: Matrix is singular(the determinant of A is equal to 0).')
    end
else
    disp('Error: the matrix is not square.')
end

x = inv_A * b