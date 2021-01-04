function I = Simpson(func, a, b, rule, n, varargin)
% Simpson - Simpson's rule
%
% Syntax: I = Simpson(func, a, b, n, p1, p2,...):
% 
% input:
%   func = function handle to function to be integrated
%   a, b = integration limits
%   rule = '1/3' or '3/8'
%   n    = number of segments (default = 100)
%   p1, p2,... = additional parameters used  by func
% output:
%   I = integral estimate

    if nargin < 4, error('at least 3 input arguments required'), end
    if ~(b > a), error('upper bound must be greater than lower'), end
    if nargin < 5 || isempty(n), n = 100; end
    
    h = (b - a) / n;
    x = a: h: b;
    % [1 3 3 repmat([2, 3, 3], 1, (n-3)/3), 1]

    switch rule

        case '1/3'
            if rem(n, 2) ~= 0, error('\n Argument n invalid. n should be multiple of 2'), end
            odd = sum(func(x(1+1:2:end-1)));
            even = sum(func(x(2+1:2:end-2)));
            I = h / 3 * (func(x(1)) + 4 * odd + 2 * even + func(x(end)));

        case '3/8'
            % [1 3 3 1 + 
            %        1 3 3 1 +
            %              1 3 3 1 +
            %                    1 3 3 1 +
            %                              ...]
            % [1 3 3 2 3 3 2 3 3 2 3 3 2 ... 3 3 1]
            if rem(n, 3) ~= 0, error('\n Argument n invalid. n should be multiple of 3'), end
            I = 3 / 8 * h * (sum(func(x).*[1 3 3 repmat([2, 3, 3], 1, (n-3)/3), 1]));
        
        otherwise
            error 'Invalid option for RULE'
    end
end