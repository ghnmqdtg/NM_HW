function yint = Newtint(x, y, xx)
% Newtint: Newton interpolating polynomial
%
% Syntax: yint = Newtint(x,y, xx)
% 
% Uses an (n - 1)-order Newton interpolating polynomial based on n data
% points (x, y) to determine a value of the dependent variable (yint)
% at a given value of the independent variable, xx.
% 
% input:
%   x = independent variable
%   y = dependent variable
%   xx = value of independent variable at which interpolation is calculated
% 
% output:
%   yint = interpolated value of dependent variable
%   c = coefficients of interpolated polynomial

    n = length(x);

    if length(y) ~= n, error('x and y must be the same length'); end

    b = zeros(n, n);

    % assign dependent variables to the first column of b.
    % the (:) ensures that y is a column vector.
    b(:, 1) = y(:);

    for j = 2 : n
        for i = 1 : n - j + 1
            b(i, j) = (b(i + 1, j - 1) - b(i, j - 1)) / (x(i + j - 1) - x(i));
        end
    end

    % use the finite divided difference to interpolate
    xt = 1;
    yint = b(1, 1);

    for j = 1: n - 1
        xt = xt.*(xx - x(j));
        yint = yint + b(1, j + 1) * xt;
    end

end