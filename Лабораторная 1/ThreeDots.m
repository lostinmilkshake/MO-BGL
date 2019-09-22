a = -3; b = 10;
epsilon = 0.00001;
t = a:0.01:b;
k=1;
xm = (a+b)./2;
Lk = abs(b-a);
x1 = (a+Lk/4);
x2 = (b-Lk/4);
% plot(t,f1(t), 'b' , x1, f1(x1), 'or', x2, f1(x2), 'ok', xm, f1(xm), 'og')
% grid on 
% pause
while Lk>epsilon
    if f1(x1)<f1(xm)
        b = xm;
        xm = x1;
    elseif (f1(x1)>=f1(xm)) & (f1(xm)<=f1(x2))
        a = x1;
        b = x2;
    else
        a = xm;
        xm = x2;
    end
    k = k + 1;
    xm = (a+b)./2;
    Lk = abs(b-a);
    x1 = (a+Lk/4);
    x2 = (b-Lk/4);
%     plot(t,f1(t), 'b' , x1, f1(x1), 'or', x2, f1(x2), 'ok', xm, f1(xm), 'og')
%     grid on 
%     pause
end 
xm