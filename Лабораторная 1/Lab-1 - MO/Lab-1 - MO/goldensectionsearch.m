function [xmin, fmin, neval] = goldensectionsearch(f,interval,tol)
% GOLDENSECTIONSEARCH searches for minimum using golden section
% 	[xmin, fmin, neval] = GOLDENSECTIONSEARCH(f,interval,tol)
%   INPUT ARGUMENTS:
% 	f is a function
% 	interval = [a, b] - search interval
% 	tol - set for bot range and function value
%   OUTPUT ARGUMENTS:
% 	xmin is a function minimizer
% 	fmin = f(xmin)
% 	neval - number of function evaluations

     %unparse the search interval
    a = interval(1);
    b = interval(2);
    L = realmax; %set the largest real number
    neval = 0; 
    Phi = (1 + sqrt(5))/2; %constant Phi
    
    while L > tol
        L = b - a;
        %find two points in a golden ratio
        x1 = b - L/Phi;
        x2 = a + L/Phi;
        %evaluate th objective function
        y1 = feval(f,x1);
        y2 = feval(f,x2);
        %set new bounds
        if y1 > y2
            a = x1;
            xmin = x2;
            fmin = y2;
        else
            b = x2;
            xmin = x1;
            fmin = y1;
        end
		%estimate the number of evaluations
        neval = neval + 2;
    end
end