function [xk, k] = Bolcano(f, a, b, tol) 
    format long g
    t = a:0.1:b; k = 1;
    epsilon = tol; delta = tol;
    xk = (a + b) / 2;
    while (abs(df(xk)) >= epsilon) & (abs(b - a) >= delta)
        if (df(xk)) > 0
            b = xk;
        else
            a = xk;
        end
        k = k + 1;
        xk = (a + b) / 2;
    end
end