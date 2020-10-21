function [root, ea, iter] = newton_method(func, x1, es, maxit, varargin)
%newton_method - Description
%
% Syntax: [x, fx, ea, iter] = newton_method(func, x1, es, maxit, varargin)
%
% Long description
    syms x

    if nargin < 2, error('at least 2 input arguments required'), end
    if nargin < 3 || isempty(es), es = 0.0001; end
    if nargin < 4 || isempty(maxit), maxit = 50; end
        
    diff_func(x) = diff(func(x), x);
    x(1) = x1;

    for i = 1 : 1000
        x(i + 1) = x(i) - func(x(i)) / diff_func(x(i));
        if abs(func(x(i + 1))) < es
            ea = vpa(abs(func(x(i + 1))));
            root = vpa(x(i + 1));
            iter = i - 1;
            break;
        end
    end
    
end