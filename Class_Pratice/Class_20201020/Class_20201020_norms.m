A = [4 -3; 1 2];

% spectral norm: u_max = largest eigenvalue of A^T * A
spectral_norm = sqrt(max(eig(A.' * A)))

A = abs(A);

column_sum_norm = max(sum(A, 1))

row_sum_norm = max(sum(A, 2))

forbenius_norm = sqrt(sum(sum(A.^2)))
