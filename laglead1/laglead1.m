%% ECE411 Lag-lead compensation
clear all
clc

s=tf('s');
k=1450;
Gs=k/(s*(2+s)*(s+40));
G=(20*(1+s/.26)*(1+s/2.6))/(s*(1+s/2)*(1+s/40)*(1+s/.085)*(1+s/8));
h=figure(1);clf
hold on
bode(Gs,'k');
bode(G,'r--');
grid minor
%%
ax = findall (h, 'type', 'axes');% Return the handles to all objects of type = axes
pl = findall (h, 'type', 'line');% Return the handles to all objects of type = line

% phase crossover
% vline = refline(ax(3),[0 0]);
% vline.YData=[-140 80];
% vline.XData=[4.54 4.54];
% vline.Color = 'k';
% set(vline,'LineStyle','--')
% v2line = refline(ax(2),[0 0]);
% v2line.YData=[-270 -90];
% v2line.XData=[4.54 4.54];
% v2line.Color = 'k';
% set(v2line,'LineStyle','--')
% % gain crossovers
% vline = refline(ax(3),[0 0]);
% vline.YData=[-140 80];
% vline.XData=[.605 .605];
% vline.Color = 'k';
% set(vline,'LineStyle','--')
% v2line = refline(ax(2),[0 0]);
% v2line.YData=[-270 -90];
% v2line.XData=[.605 .605];
% v2line.Color = 'k';
% set(v2line,'LineStyle','--')
% 
% vline = refline(ax(3),[0 0]);
% vline.YData=[-140 40];
% vline.XData=[2 2];
% vline.Color = 'k';
% set(vline,'LineStyle','--')
% v2line = refline(ax(2),[0 0]);
% v2line.YData=[-270 -90];
% v2line.XData=[2 2];
% v2line.Color = 'k';
% set(v2line,'LineStyle','--')

set(ax(3),'YLim', [-60 50],'YTick',[-100 -80 -60 -40 -18.5 -7.3 0 20 40 60 80]) % Set mag axis
set(ax(3),'XLim', [.04 100]) % Set mag axis
set(ax(2),'XLim', [.04 100])  % Set phase axis
set(ax(2),'YLim', [-270 -90],'YTick',[-270 -225 -180 -169.3 -135 -90])  % Set phase axis
set(ax(2),'YLim', [-270 -90],'YTick',[-270 -225 -180 -169.3 -135 -90])  % Set phase axis
newXTicks=ax(3).XTick;
newXTicks(end+1)=5.82;
newXTicks(end+1)=4.58;
% newXTicks(end+1)=.242;
newXTicks = sort(newXTicks);
set(ax(2),'XTick',newXTicks) % Set mag axis
set(ax(3),'XTick',newXTicks) % Set mag axis

text(ax(3),.3, 14, 'Compensated $\nearrow$', 'Interpreter', 'latex')
text(ax(3),.2, 42, '$\swarrow$ Uncompensated ', 'Interpreter', 'latex')


% text(ax(3),.1, 42, '$\swarrow$ Uncompensated ', 'Interpreter', 'latex')
% text(ax(3),.2, 42, '$\swarrow$ Uncompensated ', 'Interpreter', 'latex')
% text(ax(3),.2, 42, '$\swarrow$ Uncompensated ', 'Interpreter', 'latex')
% text(ax(3),.2, 42, '$\swarrow$ Uncompensated ', 'Interpreter', 'latex')

% text(ax(3),5, 3.8, '$\swarrow \omega_{cg}$', 'Interpreter', 'latex')

%% Plot the compensation - doctor this up in a bit
h2=figure(2);clf
a=12.3; b=.68; w1=.08;
Gc=G/Gs
bode(Gc,'--')

ax = findall (h2, 'type', 'axes');% Return the handles to all objects of type = axes
pl = findall (h2, 'type', 'line');% Return the handles to all objects of type = line
% ww1=.055;
% % gain crossovers
% vline = refline(ax(3),[0 0]);
% vline.YData=[-140 80];
% vline.XData=[a*w1 a*w1];
% vline.Color = 'k';
% set(vline,'LineStyle','--')
% v2line = refline(ax(2),[0 0]);
% v2line.YData=[-60 0];
% v2line.XData=[a*w1 a*w1];
% v2line.Color = 'k';
% set(v2line,'LineStyle','--')
% vline = refline(ax(3),[0 0]);
% vline.YData=[-140 80];
% vline.XData=[ww1 ww1];
% vline.Color = 'k';
% set(vline,'LineStyle','--')
% v2line = refline(ax(2),[0 0]);
% v2line.YData=[-60 2];
% v2line.XData=[ww1 ww1];
% v2line.Color = 'k';
% set(v2line,'LineStyle','--')

% set(ax(3),'YTick',[-25 -21.798 -15 -10 -5 0], 'YTickLabel',{'','-20log(\alpha)','','' ,'','0'}) % Set mag axis
% set(ax(2),'YTick',[-60 -30 0], 'YTickLabel',{'' ,'','0'}) % Set mag axis
newXTicks=ax(3).XTick;
wc1=.82
w2=1.84;
Bw1=wc1^2/w2;
w1=.0153;
aw2=wc1^2/w1;
newXTicks=[];
newXTicks(end+1)=wc1;
newXTicks(end+1)=w2;
newXTicks(end+1)=Bw1;
newXTicks(end+1)=w1;
newXTicks(end+1)=aw2;
newXTicks = sort(newXTicks);
set(ax(2),'XTick',newXTicks,'XTickLabel',{'\omega_1','\beta\omega_1','\omega_{c1}','\omega_2','\alpha\omega_2'}) % Set mag axis
set(ax(3),'XTick',newXTicks,'XTickLabel',{''}) % Set mag axis
set(ax(2),'XLim',[.01 70]);
set(ax(3),'XLim',[.01 70]);
grid minor