function [eval, evect, iter] = powereig(A,es,maxit)
%initialize
n = length(A);
evect = ones(n, 1);
eval = 1;
iter = 0;
ea = 100;

while(1)
    % save old eigenvalue value
    evalold = eval;
    % determine eigenvector as [A]*{x)
    evect = A * evect;
    % determine new eigenvalue
    eval = max(abs(evect));
    % normalize eigenvector to eigenvalue
    evect = evect./eval;
    iter = iter + 1;
    if eval ~= 0, ea = abs((eval - evalold) / eval) * 100; end
    if ea <= es | iter >= maxit, break, end
end
