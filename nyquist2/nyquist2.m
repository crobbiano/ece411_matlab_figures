%% ECE411 Nyquist 2 

s=tf('s');
Gs=1/((s-3*j)*(s+3*j));
pathS=[];
% path up from origin and around pole on jw
theta=linspace(0,pi/2,100);
for i=1:100
    pathS(end+1)=.2*exp(j*theta(i));
end
for i=.2:.05:2.8
    pathS(end+1)=complex(i*j);
end
theta=linspace(-pi/2,pi/2,100);
for i=1:100
    pathS(end+1)=.2*exp(j*theta(i))+3*j;
end
for i=3.2:.05:12
    pathS(end+1)=complex(i*j);
end
% path around infinity
theta=linspace(pi/2,-pi/2,1000);
for i=1:length(theta)
%     pathS(i)=5*exp(j*theta(i)) + cos(10*pi*i/length(theta));
    pathS(end+1)=12*exp(j*theta(i));
end
% path up from bottom and around pole
for i=-12:.05:-3.2
    pathS(end+1)=complex(i*j);
end
theta=linspace(-pi/2,pi/2,100);
for i=1:100
    pathS(end+1)=.2*exp(j*theta(i)) - 3*j;
end
for i=-2.8:.05:-.2
    pathS(end+1)=complex(i*j);
end
theta=linspace(-pi/2,0,100);
for i=1:100
    pathS(end+1)=.2*exp(j*theta(i));
end
% path is backwards
pathS=fliplr(pathS);
%% setup plot
handles.axNumLim=10;    %limit for axes
handles.axDelt=2;       %spacing on grid
handles.axInf=12;       %"Infinity" on graphs
handles.circRad=5;      %radius of circle for plot
handles.nth=64;         %number of points for circular s-domain plot

figure(1);clf
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


%% Plot path and poles
hold on
for i=1:length(pathS)
    colmap=[(i-1)/length(pathS) 0 (1-(i-1)/length(pathS))];
    plot(real(pathS(i)),imag(pathS(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,150)==0
        arrowTheta=atan2((imag(pathS(i+1))-imag(pathS(i))),(real(pathS(i+1))-real(pathS(i))));
        angleArrow(real(pathS(i)),imag(pathS(i)),arrowTheta,colmap,.3)
    end
end
% plot poles and zeroes
plot(complex(roots(Gs.num{1})),'ob')
plot(complex(roots(Gs.den{1})),'xb')

% add vector pointing to infinity
quiver(0,0,8,10.6,'k')
text(4,5,'r = \infty')
title('s-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');