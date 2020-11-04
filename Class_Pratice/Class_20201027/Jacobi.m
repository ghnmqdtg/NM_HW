function [x, ea, iter] = Jacobi(A , b, es, maxit)
%Jacobi - Description
%
% Syntax: [x, ea, iter] = Jacobi(A , b, es, maxit)
%
% Long description
    if nargin < 2, error('at least 3 input arguments required'), end
    if nargin < 3 || isempty(es), es = 0.0001; end
    if nargin < 4 || isempty(maxit), maxit = 50; end
    
    [m, n] = size(A);
    if m ~= n, error('Matrix A must be square'); end
    C = A;
    
    for i = 1 : n
        C(i, i) = 0;
        x(i) = 0;
    end

    x = x';

    for i = 1 : n
        C(i, 1:n) = C(i, 1:n) / A(i, i);
    end

    for i = 1 : n
        d(i) = b(i) / A(i, i);
    end

    iter = 0;
    while(1)
        xold = x;
        for i = 1 : n
            % x(i) = d(i) - C(i, :) * x;  % GaussSeidal
            x(i) = d(i) - C(i, :) * xold;   % jacobi
            if x(i) ~= 0
                ea(i) = abs((x(i) - xold(i) / x(i))) * 100;
            end
        end
        iter = iter + 1;
        if max(ea) <= es | iter >= maxit, break, end
    end

end