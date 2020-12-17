function s = Natural_cubic_spline(X, Y)
% Newtint: Newton interpolating polynomial
%
% Syntax: s = Natural_cubic_spline(X, Y)
% 
% input:
%   X = independent variable
%   Y = dependent variable
% 
% output:
%   s = coefficients of splines


    n = length(X);

    A = zeros(n);
    b = zeros(n, 1);
    % s for coefficients
    s = zeros(n - 1);

    % spacing between the points
    h = X(2 : n) - X(1 : n - 1);
    % slope
    d = (Y(2 : n) - Y(1 : n - 1))./h;

    % for natural spline, second derivatives are zero at endpoints
    A(1, 1) = 1;
    A(n, n) = 1;

    % for not-a-knot spline
    % A(1, 1) = h(2);
    % A(1, 2) = - (h(1) + h(2));
    % A(1, 3) = h(1);
    % A(n, n - 2) = h(n - 1);
    % A(n, n - 1) = - (h(n - 2) + h(n - 1));
    % A(n, n) = h(1);

    % set up the equations for the second derivatives, m(i)
    for i = 2 : n - 1
        A(i, i - 1) = h(i - 1);
        A(i, i) = 2 * (h(i - 1) + h(i));
        A(i, i + 1) = h(i);
        b(i) = 6 * (d(i) - d(i - 1));
    end

    % second derivatives
    m = A\b;

    % solve for coefficients of splines
    % # of cubic splines = # of points - 1
    for i = 1 : n - 1
        s(i, 1) = Y(i);
        s(i, 2) = d(i) - h(i) / 6 * (2 * m(i) + m(i + 1));
        s(i, 3) = m(i) / 2;
        s(i, 4) = (m(i + 1) - m(i)) / (6 * h(i));
    end
end