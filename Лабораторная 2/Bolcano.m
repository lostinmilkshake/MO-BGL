function [xk, k] = Bolcano(dfunction,funct , a, b, tol) 
    format long g
    t = a:0.1:b; k = 1;
    epsilon = tol; delta = tol;
    %Visualization
    deltaX = (b-a)/100;
    figure(3); hold on
    [miny, maxy] = drawplot(dfunction,funct,a,b,a,k); %drawing plot of the function and derivative
    deltaY = abs(maxy - miny)/100;
    k = 0;
    print('-djpg',[num2str(k), ' Bolcano itter'])
    %Main algorithm
    xk = (a + b) / 2;
    %Bolcano method
    while (abs(dfunction(xk)) >= epsilon) & (abs(b - a) >= delta) 
        if (dfunction(xk)) > 0
            b = xk;
        else
            a = xk;
        end
        k = k + 1;
        xk = (a + b) / 2;
        drawplot(dfunction,funct,a,b,xk,k);
        print('-djpg',[num2str(k), 'Bolcanoitter'])
    end
    hold off
end

function [miny maxy] = drawplot(df, f, a, b, x1, iternumber)
    
    figure(3); 
    h = (b-a)/100;
    %Drawing plot of dfunction
    dx = a:h:b;
    dy = feval(df,dx);
    miny = min(dy);
    maxy = max(dy);
    deltaX = (b-a) / 100;
    deltaY = abs(maxy - miny)/100;
    subplot(2,1,1);
    colp = hsv2rgb([rand(), 1, 0.5+0.5*rand()]);
    col = hsv2rgb([rand(), 1, 0.5+0.5*rand()]);
    plot(dx,dy,'LineWidth',1,'Color',colp);
    xlim([2.8 3.4])
    ylim([-0.2 0.25])
    xlabel('x')
    ylabel('df(x)')
    hold on
    line([a b],[0 0],'Color','k','LineWidth',1); %axis x
    y1 = feval(df, x1);
    ya = feval(df, a);
    yb = feval(df, b);
    line([x1 x1],[0 feval(df, x1)],'Marker','s','Color',col,'LineWidth',1,'MarkerSize',4); 
    scatter(x1,feval(df, x1),'Marker','o','MarkerFaceColor',colp,'MarkerEdgeColor',colp);
    text(x1 - deltaX/2, feval(df, x1) + deltaY, num2str(iternumber));
    %Drawing plot of the function
    x = a:h:b;
    y = feval(f,x);
    subplot(2,1,2);
    plot(x, y, 'LineWidth', 1, 'Color', colp);
    xlim([2.8 3.4])
    ylim([-50.1 -49.9])
    xlabel('x')
    ylabel('f(x)')
    hold on
    scatter(x1, feval(f,x1), 'Marker', 'o', 'MarkerFaceColor', colp, 'MarkerEdgeColor', colp);
    input("");
end