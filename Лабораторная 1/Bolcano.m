format long g
a = -2; b = 10;
t = a:0.1:b; k = 1;
epsilon = 0.000001; delta = 0.000001;
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
xk