close all
interval = [-2, 10];
tol = 1e-13;
[xmin, ~, neval] = goldensectionsearch2slides(@f,interval,tol)