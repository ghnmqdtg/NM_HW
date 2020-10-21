function [root, ea, iter] = secant_method(func, x1, x2, es, maxit, varargin)
%secant_method - Description
%
% Syntax: [x, fx, ea, iter] = secant_method(func, x1, x2, es, maxit, varargin)
%
% Long description
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001; end
    if nargin < 5 || isempty(maxit), maxit = 50; end

    x(1) = x1;
    x(2) = x2;

    for i = 3 : 1000
        x(i) = x(i-1) - (func(x(i - 1))) * ((x(i - 1) - x(i - 2))/(func(x(i - 1)) - func(x(i - 2))));
         if abs((x(i) - x(i - 1)) / x(i)) * 100 < es
            ea = abs((x(i) - x(i - 1)) / x(i));
            root = x(i);
            iter = i - 1;
            break
         end
     end

end