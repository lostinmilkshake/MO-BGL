function [xmin, fmin, neval] = goldensectionsearchvisual(f,interval,tol)
% goldensectionsearchvisual searches minimum using golden section
% [xmin, fmin, neval] = goldensectionsearch(f,interval,tol)
% f - an objective function handle
% interval = [a, b] - search interval
% tol - set for bot range and function value
    a = interval(1);
    b = interval(2);
    deltainterval = realmax; %value greater then tol
    L = b - a;
    neval = 0;
    Fi = (1 + sqrt(5))/2;
    
    %% VISUALIZATION
    
    figure(3); 
    h = max(1e-5,tol);
    x = a:h:b;
    y = feval(f,x);
    plot(x,y); hold on
    line([a b],[0 0],'Color','k'); %axis x
    line([a a],[0 feval(f,a)],'Marker','s'); %
    line([b b],[0 feval(f,b)],'Marker','s'); 
    
    ltol = log(tol);
    %% MAIN LOOP
    while L > tol
        L = b - a;
        
        x1 = b - L/Fi; 
        x2 = a + L/Fi;
        
        y1 = feval(f,x1);
        y2 = feval(f,x2);
        
        if y1 > y2
            a = x1;
            xmin = x2;
            fmin = y2;
        else
            b = x2;
            xmin = x1;
            fmin = y1;
        end
        
        neval = neval + 2;
        
        if neval < 20
            col = hsv2rgb([rand(), 1, 0.5+0.5*rand()]);
            line([x1 x1],[0 y1],'Marker','s','Color',col);
            line([x2 x2],[0 y2],'Marker','s','Color',col);
        end
    end
end