function [ pathFs ] = plotFs( pathS, xferFnc, figNum, arrows, arrowRatio )
%plotFs Plots the s and F(s) domain paths
%   Takes in s-plane path for xferFnc and calcs the path for F(s)
%   then plots both.  Each plot is color graded with arrows for
%   path direction

if (exist('arrows'))
    arrows = arrows;
else
    arrows = 1;
end
if (exist('arrowRatio'))
    arrowRatio = arrowRatio;
else
    arrowRatio = 501;
end

pathFs=polyval(xferFnc.num{1}, pathS)./polyval(xferFnc.den{1}, pathS);

if figNum~=99
    figure(figNum);clf;
    subplot(1,2,1); %setupPlot
    hold on
    plot(0,0,'xr')
    plot(0,0,'xr')
    yrange = max(imag(pathFs))-min(imag(pathFs));
    for i=1:length(pathS)
        colmap=[(i-1)/length(pathS) 0 (1-(i-1)/length(pathS))];
        plot(real(pathFs(i)),imag(pathFs(i)),'.','MarkerEdgeColor',colmap)
        if mod(i,arrowRatio)==0
            arrowTheta=atan2((imag(pathFs(i+1))-imag(pathFs(i))),(real(pathFs(i+1))-real(pathFs(i))));
            if arrows
                angleArrow(real(pathFs(i)),imag(pathFs(i)),arrowTheta,colmap,.01*yrange)
            end
        end
    end
    grid minor
    title('F(s)-plane')
    ylabel('Imaginary Axis');
    xlabel('Real Axis');
    
    subplot(1,2,2); %setupPlot
    hold on
    yrange = max(imag(pathS))-min(imag(pathS));
    for i=1:length(pathS)
        colmap=[(i-1)/length(pathS) 0 (1-(i-1)/length(pathS))];
        plot(real(pathS(i)),imag(pathS(i)),'.','MarkerEdgeColor',colmap)
        if mod(i,arrowRatio)==0
            arrowTheta=atan2((imag(pathS(i+1))-imag(pathS(i))),(real(pathS(i+1))-real(pathS(i))));
            if arrows
                angleArrow(real(pathS(i)),imag(pathS(i)),arrowTheta,colmap,.01*yrange)
            end
        end
    end
    grid minor
    % plot poles and zeroes
    plot(complex(roots(xferFnc.num{1})),'ob')
    plot(complex(roots(xferFnc.den{1})),'xb')
    title('s-plane')
    ylabel('Imaginary Axis');
    xlabel('Real Axis');
end
end

function setupPlot()
handles.axNumLim=6;    %limit for axes
handles.axDelt=1;       %spacing on grid
handles.axInf=7;       %"Infinity" on graphs
handles.circRad=5;      %radius of circle for plot

% axes();
lm=handles.axNumLim;        %limit for axes
delt=handles.axDelt;        %spacing on grid
lmi=handles.axInf;          %"infinity"
g=0.8*[1 1 1];              %Color for grid.
cla;
set(gca,'XLim',[-lmi lmi]); set(gca,'YLim',[-lmi lmi]);
set(gca,'XTick',-lmi:delt:lmi);
set(gca,'XTickLabel',{'-inf';-lm:delt:lm;'+inf'});
set(gca,'YTick',-lmi:delt:lmi);
set(gca,'YTickLabel',{'-inf';-lm:delt:lm;'+inf'}); box on;
hold on;
thet = 0:0.01:2*pi;
x=lmi*cos(thet); y=lmi*sin(thet); %patch(x,y,'w');
patch([x lmi lmi -lmi -lmi lmi],[y -lmi lmi lmi -lmi -lmi],...
    g+0.5*(1-g),'EdgeColor',g);
plot(lm*sin(thet),lm*cos(thet),':','Color',g);
for x=delt:delt:lm,  % Make grid
    isct=sqrt(lm*lm-x*x); %intersect of line an circle
    plot([x x],[-isct isct],':','Color',g);
    plot([-isct isct],[-x -x],':','Color',g);
    plot([-isct isct],[x x],':','Color',g);
    plot([-x -x],[-isct isct],':','Color',g);
end
plot([-lm lm],[0 0],':','Color',0.8*g);     %axis at zero is darker
plot([0 0],[-lm lm],':','Color',0.8*g);
plot([-lm -lmi],[0 0],':','Color',0.5*g);   %axis out to infinity
plot([0 0],[-lm -lmi],':','Color',0.5*g);
plot([lm lmi],[0 0],':','Color',0.5*g);
plot([0 0],[lm lmi],':','Color',0.5*g);
end
