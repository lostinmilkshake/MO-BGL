function [xk, k] = secant(dfunction, funct, a, b, tol)
    epsilon = tol;
    %Visualization
    deltaX = a:(b-a) / 100:b;
    figure(3); 
    k = 0;
    [miny, maxy] = drawplot(dfunction,funct,a,b,a, k); %drawing plot of the function and derivative
    deltaY = abs(maxy - miny)/100;
    print('-dpdf',[num2str(k), 'secantitter'])
    %Secant method
    while 1
        xk = b - dfunction(b)*(b - a) / (dfunction(b) - dfunction(a));
        if abs(dfunction(xk)) <= epsilon | k > 6
            break
        else
            dfunction(xk), xk
            if dfunction(xk) > 0
                b = xk;
            else
                a = xk;
            end
        end
        subplot(2,1,1);
        k = k + 1;
        drawplot(dfunction, funct, a, b, xk, k);
        print('-dpdf',[num2str(k), 'secantitter'])
    end
hold off
end

function [miny maxy] = drawplot(df, f, a, b, x1, iternumber)
    
    figure(3); 
    h = (b-a)/100;
    %Drawing plot od dfunction
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
    xlim([2.5 4])
    ylim([-10 20])
    xlabel('\itx')
    ylabel('\it{}df\rm (\it{}x\rm)')
    hold on
    scatter([a b],[feval(df,a), feval(df,b)],'Marker','o','MarkerFaceColor',colp,'MarkerEdgeColor',colp);
    line([a b],[0 0],'Color','k','LineWidth',1); %axis x
    y1 = feval(df, x1);
    ya = feval(df, a);
    yb = feval(df, b);
    %Deciding where to draw secant 
    if x1 == a
        line([a b],[ya yb],'Marker','s','Color',col,'LineWidth',1,'MarkerSize',4); %drawing secant
        line([a a],[0 feval(df, a)],'Marker','s','Color',col,'LineWidth',1,'MarkerSize',4);
        text(a - deltaX/2, feval(df, a) + 4*deltaY, num2str(iternumber));
    else
        line([a b],[ya yb],'Marker','s','Color',col,'LineWidth',1,'MarkerSize',4); %drawing secant
        line([b b],[0 feval(df, b)],'Marker','s','Color',col,'LineWidth',1,'MarkerSize',4);
        text(b - deltaX/2, feval(df, b) + 4*deltaY, num2str(iternumber));
    end
    %Drawing plot of the function
    x = a:h:b;
    y = feval(f,x);
    subplot(2,1,2);
    plot(x, y, 'LineWidth', 1, 'Color', colp);
    xlim([2.5 4])
    ylim([-60 -45])
    xlabel('\itx')
    ylabel('\it{}f\rm (\it{}x\rm)')
    hold on
    scatter(b, feval(f,b), 'Marker', 'o', 'MarkerFaceColor', colp, 'MarkerEdgeColor', colp);
    input("");
end