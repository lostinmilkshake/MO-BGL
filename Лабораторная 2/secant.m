function [xk, k] = secant(dfunction, funct, a, b, tol)
    epsilon = tol;
    
    %Visualization
    ctr = 1;
    deltaX = (b-a) / 100;
    figure(3); hold on
    [miny, maxy] = drawplot(funct,a,b,a,b);
    deltaY = abs(maxy - miny)/100;
    placelabel(a,0,deltaX,deltaY,ctr);
    placelabel(b,0,deltaX,deltaY,ctr);
    
    %Main algorithm
    while 1
        xk = b - dfunction(b)*(b - a) / (dfunction(b) - dfunction(a))
        if dfunction(xk) <= epsilon
            break
        else
            if dfunction(xk) > 0
                b = xk
            else
                a = xk
            end
        end
        drawplot(funct,a,b,xk,xk);
        k = k + 1
    end
end

function [miny maxy] = drawplot(f,a,b,x1,x2)
    figure(3); 
    h = (b-a)/100;
    x = a:h:b;
    y = feval(f,x);
    
    miny = min(y);
    maxy = max(y);
    
    colp = hsv2rgb([rand(), 1, 0.5+0.5*rand()]);
    plot(x,y,'LineWidth',1,'Color',colp);
    scatter([a b],[feval(f,a), feval(f,b)],'Marker','o','MarkerFaceColor',colp,'MarkerEdgeColor',colp);
    xlabel('\itx');
    ylabel('\ity');
    line([a b],[0 0],'Color','k','LineWidth',1); %axis x
    col = hsv2rgb([rand(), 1, 0.5+0.5*rand()]);
    y1 = feval(f, x1);
    line([x1 x1],[0 y1],'Marker','s','Color',col,'LineWidth',1,'MarkerSize',4); 
    y2 = feval(f,x2);
    line([x2 x2],[0 y2],'Marker','s','Color',col,'LineWidth',1,'MarkerSize',4); 
    input("");
end

function placelabel(x,y,deltaX,deltaY,iternumber)
    if iternumber <=10
        text(x - deltaX/2, y + 4*deltaY, num2str(iternumber));
    end
end