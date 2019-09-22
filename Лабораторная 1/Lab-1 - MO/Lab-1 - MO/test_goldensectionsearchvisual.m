interval = [-2, 10];
tol = 1e-13;
[xmin, ~, neval] = goldensectionsearchvisual(@f,interval,tol)