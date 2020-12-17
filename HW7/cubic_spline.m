function s = cubic_spline(X, Y, method)
% Newtint: Newton interpolating polynomial
%
% Syntax: s = cubic_spline(X, Y)
% 
% input:
%   X = independent variable
%   Y = dependent variable
%   method = 0: natural, 1: not-a-knot, 2: clamped
% 
% output:
%   s = coefficients of splines
    if method > 2 && method < 0 , error('Invalid Method'); end
    n = length(X);

    A = zeros(n);
    b = zeros(n, 1);
    diff_Y = diff(Y);
    % s for coefficients
    s = zeros(n - 1);

    % spacing between the points
    h = X(2 : n) - X(1 : n - 1);
    % slope
    d = (Y(2 : n) - Y(1 : n - 1))./h;

    if method == 0
        % for natural spline, second derivatives are zero at endpoints
        A(1, 1) = 1;
        A(n, n) = 1;
    elseif method == 1
        % for not-a-knot spline
        A(1, 1) = h(2);
        A(1, 2) = - (h(1) + h(2));
        A(1, 3) = h(1);
        A(n, n - 2) = h(n - 1);
        A(n, n - 1) = - (h(n - 2) + h(n - 1));
        A(n, n) = h(1);
    elseif method == 2
        % for clamped spline
        A(1, 1) = 2 * h(1);
        A(1, 2) = h(1);
        A(n, n - 1) = h(n - 1);
        A(n, n) = 2 * h(n - 1);
        % derivative end conditions equal to the exact values calculated with differentiation.
        b(1) = 6 * (d(1) - diff_Y(1));
        b(n) = 6 * (diff_Y(n - 1) - d(n - 1));
    end

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