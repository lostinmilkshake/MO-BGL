a = -2; b = 10;
N = 30;
tolspan = logspace(-14, 0 , N);
Xmin = zeros(1, N);
Itter = zeros(1, N);
i = 1;
for tol = tolspan
    [xmin, itter] = ThreeDots(@f1, a, b, tol);
    Xmin(i) = xmin;
    Itter(i) = itter;
    i = i + 1;
end

figure(1);
%plot the number of evaluations
subplot(2,1,1);
semilogx(tolspan,Itter,'.-b');
xlabel('tol');
ylabel('Neval');
%plot the error
subplot(2,1,2);
loglog(tolspan,abs(Xmin - 3),'s-b');
xlabel('tol');
ylabel('err');