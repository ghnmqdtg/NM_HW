function x = tridiag(A)
% Tridiag: Tridiagonal equation solver banded system
%   x = Tridiag(e,f,g,r): Tridiagonal system solver.
% Syntax: x = Tridiag(e, f, g, r)
%   e = subdiagonal vector
%   f = diagonal vector
%   g = superdiagonal vector
%   r = right hand side vector
%   x = solution vector
% Long description
    n = length(f);
    A_row_1 = A(1, :) / A(1, 1);
    % B_row_1 = B(1, :) / A(1, 1);
    % A_row_1.*
end