%% ECE411 Gain Margin and Phase Margin
clear all
clc

s=tf('s');
Gs=1000/(s*(s+5)*(s+20));
Gs.den{1}.^2
magGs=Gs.den{1}.^2-Gs.num{1}.^2
roots(magGs)

Gs2 = 1590/(s*(s+5)*(s+20));
Gs3 = 50000/((s+5)*(s+10)*(s+15)*(s+20));

pathS=[];
theta=linspace(0,pi/2,200);
cradius=.02;
for i=1:length(theta)
%     pathS(end+1)=cradius*exp(j*theta(i));
end
for i=cradius:.05:500
    pathS(end+1)=complex(i*j);
end
% path around infinity
theta=linspace(pi/2,-pi/2,200);
for i=1:length(theta)
%     pathS(i)=5*exp(j*theta(i)) + cos(10*pi*i/length(theta));
%     pathS(end+1)=5*exp(j*theta(i));
end
% path up from bottom and around pole
for i=-500:.5:-cradius
%     pathS(end+1)=complex(i*j);
end
theta=linspace(-pi/2,0,200);
for i=1:length(theta)
%     pathS(end+1)=cradius*exp(j*theta(i));
end
pathFs2 = plotFs(pathS,Gs2, 1, 0);
pathFs3 = plotFs(pathS,Gs3, 2, 0);
% pathFs = plotFs(pathS,Gs2, 2, 0);

%% Plot the gain margin
figure(3);clf
plot(pathFs,'-')
hold on
plot (-1, 0, 'r+')
txt1='\downarrow (-1, j_0)';
text(-1.01,.15,txt1)
hline = refline([0 0]);
hline.YData=[0 0];
hline.XData=[-3 1];
set(hline,'MarkerEdgeColor','k','LineStyle',':')
vline = refline([0 0]);
vline.YData=[-5 1];
vline.XData=[0 0];
set(vline,'MarkerEdgeColor','k','LineStyle',':')

% find index with element closest to Y=0 (Gain margin)
[d didx] = min(abs(imag(pathFs(1:500))))
plot(real(pathFs(didx)),0,'or' )
txt1='\downarrow \omega_{pc}';
text(real(pathFs(didx))-.01,.15,txt1)
% add ref line for better visuals
vline = refline([0 0]);
vline.YData=[-3 0];
vline.XData=[real(pathFs(didx)) real(pathFs(didx))];
set(vline,'MarkerEdgeColor','k','LineStyle',':')
% draw arrows
quiver(real(pathFs(didx)),-3,-real(pathFs(didx)),0,0,'LineWidth',1,'MaxHeadSize',.5,'Color','k')
quiver(0,-3,real(pathFs(didx)),0,0,'LineWidth',1,'MaxHeadSize',.5,'Color','k')
txt1='|G(j\omega_{pc})H(j\omega_{pc})|';
text(-.32,-2.8,txt1)

xlim([-2 .1]);ylim([-5, 1])
xlabel('Real(GH)')
ylabel('Imaginary(GH)')
%% Plot the phase margin
figure(4);clf
plot(pathFs,'-')
hold on
plot (-1, 0, 'r+')
text(-.97,.08,'$\swarrow (-1, j_0)$','Interpreter','latex')
hline = refline([0 0]);
hline.YData=[0 0];
hline.XData=[-5 5];
set(hline,'MarkerEdgeColor','k','LineStyle',':')
vline = refline([0 0]);
vline.YData=[-5 5];
vline.XData=[0 0];
set(vline,'MarkerEdgeColor','k','LineStyle',':')

% find index with element closest to X=-1 (Phase margin)
% [c cidx] = min(abs(real(pathFs+1)));
[c cidx] = min(abs(abs(pathFs)-1));
% plot line to intersect with found line
plot([0 5*real(pathFs(cidx))], [0 5*imag(pathFs(cidx))], 'k')
% add ref line for better visuals
vline = refline([0 0]);
vline.YData=[imag(pathFs(cidx)) 0];
vline.XData=[real(pathFs(cidx)) real(pathFs(cidx))];
set(vline,'MarkerEdgeColor','k','MarkerFaceColor',[0 0 0],'LineStyle',':')

% get unit circle reference line and plot
arc = circr(1,0,2*pi,100);
plot(arc(1,:), arc(2,:), 'k:')
h=text(-.68,.68, 'Unit Circle')

% get PM, \phi, and plot the arc
arcPM1 = circr(.5, 0, 2*pi+atan2(imag(pathFs(cidx)),real(pathFs(cidx))),   100);
plot(arcPM1(1,:), arcPM1(2,:), 'k:')
h=text(-.3,.3, '\Phi_{1}')


arcPM2 = circr(.3, atan2(imag(pathFs(cidx)),real(pathFs(cidx))), -pi,  100);
plot(arcPM2(1,:), arcPM2(2,:), 'k:')
h=text(-.28,-.02, '\Phi_{2}')


xlim([-2 2]);ylim([-2, 2])
xlabel('Real(GH)')
ylabel('Imaginary(GH)')
%% Plot the phase margin between two similar functions
figure(5);clf
plot(pathFs2,'-')
hold on
plot(pathFs3,'-')
plot (-1, 0, 'r+')
text(-.97,.08,'$\swarrow (-1, j_0)$','Interpreter','latex')
hline = refline([0 0]);
hline.YData=[0 0];
hline.XData=[-5 5];
set(hline,'MarkerEdgeColor','k','LineStyle',':')
vline = refline([0 0]);
vline.YData=[-5 5];
vline.XData=[0 0];
set(vline,'MarkerEdgeColor','k','LineStyle',':')

% get unit circle reference line and plot
arc = circr(1,0,2*pi,100);
plot(arc(1,:), arc(2,:), 'k:')
h=text(-.68,.68, 'Unit Circle')


xlim([-10 10]);ylim([-10, 10])
xlabel('Real(GH)')
ylabel('Imaginary(GH)')
xlim([-2.75 1.1]);ylim([-2.75, 1.1])
