function [t,y] = explicit_EulerODE(dydt, tspan, y0, h)
% eulode: Euler ODE solver
%   [t, y] = eulode(dydt, tspan, y0, h, pl, p2, ...):
%            uses Euler's method to integrate an ODE
% input:
%   dydt = name of the M-file that evaluates the ODE
%   tspan = [ti, tf] where ti and tf = initial and
%           final values of independent variable
%   yo = initial value of dependent variable
%   h = step size
%   p1, p2, ... = additional parameters used by dydt
% output:
%   t = vector of independent variable
%   y = vector of solution for dependent variable

    if nargin < 4, error('at least 4 input arguments required'), end
    ti = tspan(1);
    tf = tspan(2);
    
    if ~ (tf > ti), error('upper limit must be greater than lower limit'), end
    t = (ti: h: tf)'; 
    n = length(t);
    
    % if necessary, add an additional value of t 
    % so that range goes from t=ti to tf
    if t(n) < tf
        t(n + 1) = tf;
        n = n + 1;
        t(n) = tf;
    end
    
    y = y0 * ones(n, 1); % preallocate y to improve efficiency
    
    % implement Euler's Method
    for i = 1: n - 1
        y(i + 1) = y(i) + dydt(t(i), y(i)) * h;
    end