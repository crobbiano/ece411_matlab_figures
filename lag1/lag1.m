%% ECE411 Lag compensation
clear all
clc

s=tf('s');
Gs=5/(s*(1+s/10)*(1+s/50));
a=12.3; b=.68; w1=.08;
Gc=(1/a)*((s+b)/(s+w1));
G=Gc*Gs;
h=figure(1);clf
hold on
bode(Gs,'k');
bode(G,'r--');
grid minor
%%
ax = findall (h, 'type', 'axes');% Return the handles to all objects of type = axes
pl = findall (h, 'type', 'line');% Return the handles to all objects of type = line

% phase crossover
vline = refline(ax(3),[0 0]);
vline.YData=[-140 80];
vline.XData=[4.54 4.54];
vline.Color = 'k';
set(vline,'LineStyle','--')
v2line = refline(ax(2),[0 0]);
v2line.YData=[-270 -90];
v2line.XData=[4.54 4.54];
v2line.Color = 'k';
set(v2line,'LineStyle','--')
% gain crossovers
vline = refline(ax(3),[0 0]);
vline.YData=[-140 80];
vline.XData=[.605 .605];
vline.Color = 'k';
set(vline,'LineStyle','--')
v2line = refline(ax(2),[0 0]);
v2line.YData=[-270 -90];
v2line.XData=[.605 .605];
v2line.Color = 'k';
set(v2line,'LineStyle','--')
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

set(ax(3),'YLim', [-100 80],'YTick',[-100 -80 -60 -42.7 -21.6 -10 0 20 40 60 80]) % Set mag axis
set(ax(2),'YLim', [-270 -90],'YTick',[-270 -225 -180 -135 -119.6 -90])  % Set phase axis

text(ax(3),.03, 12, 'Compensated $\nearrow$', 'Interpreter', 'latex')
text(ax(3),.05, 45, '$\swarrow$ Uncompensated ', 'Interpreter', 'latex')
text(ax(3),5, 3.8, '$\swarrow \omega_{cg}$', 'Interpreter', 'latex')

%% Plot the compensation - doctor this up in a bit
h2=figure(2);clf
a=12.3; b=.68; w1=.08;
Gc=(1/a)*((s+b)/(s+w1));
bode(Gc,'--')
grid minor

ax = findall (h2, 'type', 'axes');% Return the handles to all objects of type = axes
pl = findall (h2, 'type', 'line');% Return the handles to all objects of type = line
ww1=.055;
% gain crossovers
vline = refline(ax(3),[0 0]);
vline.YData=[-140 80];
vline.XData=[a*w1 a*w1];
vline.Color = 'k';
set(vline,'LineStyle','--')
v2line = refline(ax(2),[0 0]);
v2line.YData=[-60 0];
v2line.XData=[a*w1 a*w1];
v2line.Color = 'k';
set(v2line,'LineStyle','--')
vline = refline(ax(3),[0 0]);
vline.YData=[-140 80];
vline.XData=[ww1 ww1];
vline.Color = 'k';
set(vline,'LineStyle','--')
v2line = refline(ax(2),[0 0]);
v2line.YData=[-60 2];
v2line.XData=[ww1 ww1];
v2line.Color = 'k';
set(v2line,'LineStyle','--')

set(ax(3),'YTick',[-25 -21.798 -15 -10 -5 0], 'YTickLabel',{'','-20log(\alpha)','','' ,'','0'}) % Set mag axis
set(ax(2),'YTick',[-60 -30 0], 'YTickLabel',{'' ,'','0'}) % Set mag axis
newXTicks=ax(3).XTick;
newXTicks(end+1)=ww1;
newXTicks(end+1)=a*w1;
newXTicks(end+1)=.242;
newXTicks = sort(newXTicks);
set(ax(2),'XTick',newXTicks,'XTickLabel',{'','','\omega_1','','\phi_{max}','\alpha\omega_1'}) % Set mag axis
set(ax(3),'XTick',newXTicks,'XTickLabel',{'','','\omega_1','','\phi_{max}','\alpha\omega_1'}) % Set mag axis
