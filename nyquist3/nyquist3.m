%% ECE411 Nyquist 3 
clc; clear all;

s=tf('s');
theta=linspace(0,pi/2,1000);
pathS=[];
pathS1=[];
pathS2=[];
pathS3=[];
pathS4=[];
for i=1:1000
    pathS(end+1)=.2*exp(j*theta(i));
    pathS2(end+1)=.2*exp(j*theta(i));
end
for i=.2:.5:500
    pathS(end+1)=complex(i*j);
    pathS1(end+1)=complex(i*j);
end
% path around infinity
theta=linspace(pi/2,-pi/2,1000);
for i=1:length(theta)
%     pathS(i)=5*exp(j*theta(i)) + cos(10*pi*i/length(theta));
    pathS(end+1)=500*exp(j*theta(i));
    pathS4(end+1)=500*exp(j*theta(i));
end
% path up from bottom and around pole
for i=-500:.5:-.2
    pathS(end+1)=complex(i*j);
    pathS3(end+1)=complex(i*j);
end
theta=linspace(-pi/2,0,1000);
for i=1:1000
    pathS(end+1)=.2*exp(j*theta(i));
    pathS2(end+1)=.2*exp(j*theta(i));
end
% path is backwards
pathS=fliplr(pathS);
pathS1=fliplr(pathS1);
pathS2=fliplr(pathS2);
pathS3=fliplr(pathS3);
pathS4=fliplr(pathS4);

Gs=1/(s*(s+1));
Gs2=1/(s);
Gs2=Gs;


%% Portion 1
pathFs1=polyval(Gs2.num{1}, pathS1)./polyval(Gs2.den{1}, pathS1);
figure(1);clf; 
subplot(1,2,1); %setupPlot
hold on
plot(0,0,'xr')
plot(0,0,'xr')
yrange = max(imag(pathFs1))-min(imag(pathFs1));
arrows=0;
for i=1:length(pathS1)
    colmap=[(i-1)/length(pathS1) 0 (1-(i-1)/length(pathS1))];
    plot(real(pathFs1(i)),imag(pathFs1(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathFs1(i+1))-imag(pathFs1(i))),(real(pathFs1(i+1))-real(pathFs1(i))));
        if arrows
            angleArrow(real(pathFs1(i)),imag(pathFs1(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
title('F(s)-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
ylim([-13 13])
xlim([-1.1, 1.1])
set(gca,'XTick',[0 ])
set(gca,'XTickLabel',{'0'})
set(gca,'YTick',[-12 0 12])
set(gca,'YTickLabel',{'-\infty','0','\infty'})
% quiver(0,0,1.5,5.32,'k')
% text(.6,2,'r = \infty')

subplot(1,2,2); %setupPlot
hold on
yrange = max(imag(pathS1))-min(imag(pathS1));
for i=1:length(pathS1)
    colmap=[(i-1)/length(pathS1) 0 (1-(i-1)/length(pathS1))];
    plot(real(pathS1(i)),imag(pathS1(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathS1(i+1))-imag(pathS1(i))),(real(pathS1(i+1))-real(pathS1(i))));
        if arrows
            angleArrow(real(pathS1(i)),imag(pathS1(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
% plot poles and zeroes
plot(complex(roots(Gs2.num{1})),'ob')
plot(complex(roots(Gs2.den{1})),'xb')
title('s-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
ylim([-500 500])
xlim([-1.1, 1.1])
set(gca,'XTick',[-1 0 1])
set(gca,'XTickLabel',{'a','0','-a'})
set(gca,'YTick',[-500 0 500])
set(gca,'YTickLabel',{'-\infty','0','\infty'})
% quiver(0,0,.1138,.19,'k')
% text(.04,.04,'r = \epsilon')

%% Portion 2
pathFs2=polyval(Gs2.num{1}, pathS2)./polyval(Gs2.den{1}, pathS2);
figure(1);clf; 
subplot(1,2,1); %setupPlot
hold on
plot(0,0,'xr')
plot(0,0,'xr')
yrange = max(imag(pathFs2))-min(imag(pathFs2));
arrows=0;
for i=1:length(pathS2)
    colmap=[(i-1)/length(pathS2) 0 (1-(i-1)/length(pathS2))];
    plot(real(pathFs2(i)),imag(pathFs2(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathFs2(i+1))-imag(pathFs2(i))),(real(pathFs2(i+1))-real(pathFs2(i))));
        if arrows
            angleArrow(real(pathFs2(i)),imag(pathFs2(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
title('F(s)-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
quiver(0,0,1.5,4.8,'k')
text(.7,2,'r = \infty')
set(gca,'XTick',[0 ])
set(gca,'XTickLabel',{'0'})
set(gca,'YTick',[-5 0 5])
set(gca,'YTickLabel',{'-\infty','0','\infty'})

subplot(1,2,2); %setupPlot
hold on
yrange = max(imag(pathS2))-min(imag(pathS2));
for i=1:length(pathS2)
    colmap=[(i-1)/length(pathS2) 0 (1-(i-1)/length(pathS2))];
    plot(real(pathS2(i)),imag(pathS2(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathS2(i+1))-imag(pathS2(i))),(real(pathS2(i+1))-real(pathS2(i))));
        if arrows
            angleArrow(real(pathS2(i)),imag(pathS2(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
% plot poles and zeroes
plot(complex(roots(Gs2.num{1})),'ob')
plot(complex(roots(Gs2.den{1})),'xb')
title('s-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
ylim([-13, 13])
xlim([-5 5])
quiver(0,0,.25,.13,'k')
text(.3,.1,'r = \epsilon')
set(gca,'XTick',[-1 0 1])
set(gca,'XTickLabel',{'a','0','-a'})
set(gca,'YTick',[-12 0 12])
set(gca,'YTickLabel',{'-\infty','0','\infty'})

%% Portion 3
pathFs3=polyval(Gs2.num{1}, pathS3)./polyval(Gs2.den{1}, pathS3);
figure(1);clf; 
subplot(1,2,1); %setupPlot
hold on
plot(0,0,'xr')
plot(0,0,'xr')
yrange = max(imag(pathFs3))-min(imag(pathFs3));
arrows=0;
for i=1:length(pathS3)
    colmap=[(i-1)/length(pathS3) 0 (1-(i-1)/length(pathS3))];
    plot(real(pathFs3(i)),imag(pathFs3(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathFs3(i+1))-imag(pathFs3(i))),(real(pathFs3(i+1))-real(pathFs3(i))));
        if arrows
            angleArrow(real(pathFs3(i)),imag(pathFs3(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
title('F(s)-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
ylim([-13 13])
xlim([-1.1, 1.1])
set(gca,'XTick',[0 ])
set(gca,'XTickLabel',{'0'})
set(gca,'YTick',[-12 0 12])
set(gca,'YTickLabel',{'-\infty','0','\infty'})
% set(gca,'XTickLabel',{'','','','','','','','','','','0'})
% set(gca,'YTickLabel',{'0','','','','','','','','','',''})
% quiver(0,0,1.5,5.32,'k')
% text(.6,2,'r = \infty')

subplot(1,2,2); %setupPlot
hold on
yrange = max(imag(pathS3))-min(imag(pathS3));
for i=1:length(pathS3)
    colmap=[(i-1)/length(pathS3) 0 (1-(i-1)/length(pathS3))];
    plot(real(pathS3(i)),imag(pathS3(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathS3(i+1))-imag(pathS3(i))),(real(pathS3(i+1))-real(pathS3(i))));
        if arrows
            angleArrow(real(pathS3(i)),imag(pathS3(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
% plot poles and zeroes
plot(complex(roots(Gs2.num{1})),'ob')
plot(complex(roots(Gs2.den{1})),'xb')
title('s-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
ylim([-500 500])
xlim([-1.1, 1.1])
set(gca,'XTick',[-1 0 1])
set(gca,'XTickLabel',{'a','0','-a'})
set(gca,'YTick',[-500 0 500])
set(gca,'YTickLabel',{'-\infty','0','\infty'})
% quiver(0,0,.1138,.19,'k')
% text(.04,.04,'r = \epsilon')

%% Portion 4
pathFs4=polyval(Gs2.num{1}, pathS4)./polyval(Gs2.den{1}, pathS4);
figure(1);clf; 
subplot(1,2,1); %setupPlot
hold on
plot(0,0,'xr')
plot(0,0,'xr')
yrange = max(imag(pathFs4))-min(imag(pathFs4));
arrows=0;
for i=1:length(pathS4)
    colmap=[(i-1)/length(pathS4) 0 (1-(i-1)/length(pathS4))];
    plot(real(pathFs4(i)),imag(pathFs4(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathFs4(i+1))-imag(pathFs4(i))),(real(pathFs4(i+1))-real(pathFs4(i))));
        if arrows
            angleArrow(real(pathFs4(i)),imag(pathFs4(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
title('F(s)-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
% quiver(0,0,.005,.005,'k')
% text(.0055,.0065,'r = \epsilon')
% ylim([-.08, .08])
% xlim([-.08, .08])
% set(gca,'XTick',[0 ])
% set(gca,'XTickLabel',{'0'})
% set(gca,'YTick',[-5 0 5])
% set(gca,'YTickLabel',{'-\infty','0','\infty'})

subplot(1,2,2); %setupPlot
hold on
yrange = max(imag(pathS4))-min(imag(pathS4));
for i=1:length(pathS4)
    colmap=[(i-1)/length(pathS4) 0 (1-(i-1)/length(pathS4))];
    plot(real(pathS4(i)),imag(pathS4(i)),'.','MarkerEdgeColor',colmap)
    if mod(i,501)==0
        arrowTheta=atan2((imag(pathS4(i+1))-imag(pathS4(i))),(real(pathS4(i+1))-real(pathS4(i))));
        if arrows
            angleArrow(real(pathS4(i)),imag(pathS4(i)),arrowTheta,colmap,.035*yrange)
        end
    end
end
grid minor
% plot poles and zeroes
plot(complex(roots(Gs2.num{1})),'ob')
plot(complex(roots(Gs2.den{1})),'xb')
title('s-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
quiver(0,0,1.5,13.2,'k')
text(.5,2,'r = \infty')
ylim([-500, 500])
xlim([-1 500])
set(gca,'XTick',[-1 0 1 500])
set(gca,'XTickLabel',{'a','0','-a','\infty'})
set(gca,'YTick',[-500 0 500])
set(gca,'YTickLabel',{'-\infty','0','\infty'})

% quiver(0,0,.1138,.19,'k')
% text(.04,.04,'r = \epsilon')


%% full nyquist plot
plotFs(pathS, Gs, 1, 0, 1001)

%% setup plot
handles.axNumLim=10;    %limit for axes
handles.axDelt=2;       %spacing on grid
handles.axInf=12;       %"Infinity" on graphs
handles.circRad=5;      %radius of circle for plot
handles.nth=64;         %number of points for circular s-domain plot

figure(6);clf
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
    if mod(i,1001)==0
        arrowTheta=atan2((imag(pathS(i+1))-imag(pathS(i))),(real(pathS(i+1))-real(pathS(i))));
        angleArrow(real(pathS(i)),imag(pathS(i)),arrowTheta,colmap,.3)
    end
end
% plot poles and zeroes
plot(complex(roots(Gs.num{1})),'ob')
plot(complex(roots(Gs.den{1})),'xb')

% add vector pointing to infinity
quiver(0,0,8,10.6,'k')

title('s-plane')
ylabel('Imaginary Axis');
xlabel('Real Axis');
text(4,5,'r = \infty')
text(-.7, 6, '$\textcircled{1}$', 'Interpreter', 'latex')
text(.4, 0, '$\textcircled{2}$', 'Interpreter', 'latex')
text(-.7, -6, '$\textcircled{3}$', 'Interpreter', 'latex')
text(11, 0, '$\textcircled{4}$', 'Interpreter', 'latex')