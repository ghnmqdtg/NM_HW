close all
format long

A = [40 -20    0;
    -20  40  -20;
      0 -20   40];

es = 1e-5;
maxit = 50;

[eval, evect, iter] = powereig(A, es, maxit)