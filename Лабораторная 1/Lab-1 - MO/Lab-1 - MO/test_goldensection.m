% TEST GOLDEN SECTION SEARCH

interval = [0, 10];
%set the number of points on a plot
N = 30;
tolspan = logspace(-14,0,N); %evenly spaced logarithmic sequence
Xmin  = zeros(1,N);
Neval = zeros(1,N);
i = 1;%iteration counter
for tol = tolspan %select the required tolerance
    [xmin, ~, neval] = goldensectionsearch(@f,interval,tol); %search for the xmin
    Xmin(i) = xmin; %save stats
    Neval(i) = neval;
    i = i + 1;
end

figure(1);
%plot the number of evaluations
subplot(2,1,1);
semilogx(tolspan,Neval,'.-b');
xlabel('tol');
ylabel('Neval');
%plot the error
subplot(2,1,2);
loglog(tolspan,abs(Xmin - 4),'s-b');
xlabel('tol');
ylabel('err');