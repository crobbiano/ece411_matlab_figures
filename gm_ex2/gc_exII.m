%% ECE411 Gain compensation Ex II
clear all
clc

s=tf('s');
Gs=1/(s*(1+s/5)^2);
KGs=2.31/(s*(1+s/5)^2);
h=figure(1);clf
hold on
bode(Gs,'k');
bode(KGs,'r--');
grid minor
%%
ax = findall (h, 'type', 'axes');% Return the handles to all objects of type = axes
pl = findall (h, 'type', 'line');% Return the handles to all objects of type = line

% phase crossover
vline = refline(ax(3),[0 0]);
vline.YData=[-140 40];
vline.XData=[5 5];
vline.Color = 'k';
set(vline,'LineStyle','--')
v2line = refline(ax(2),[0 0]);
v2line.YData=[-270 -90];
v2line.XData=[5 5];
v2line.Color = 'k';
set(v2line,'LineStyle','--')
% gain crossovers
vline = refline(ax(3),[0 0]);
vline.YData=[-140 40];
vline.XData=[.964 .964];
vline.Color = 'k';
set(vline,'LineStyle','--')
v2line = refline(ax(2),[0 0]);
v2line.YData=[-270 -90];
v2line.XData=[.964 .964];
v2line.Color = 'k';
set(v2line,'LineStyle','--')

vline = refline(ax(3),[0 0]);
vline.YData=[-140 40];
vline.XData=[2 2];
vline.Color = 'k';
set(vline,'LineStyle','--')
v2line = refline(ax(2),[0 0]);
v2line.YData=[-270 -90];
v2line.XData=[2 2];
v2line.Color = 'k';
set(v2line,'LineStyle','--')

set(ax(2),'YLim', [-270 -90],'YTick',[-270 -225 -180 -133.5 -111.8 -90])  % Set phase axis
set(ax(3),'YTick',[-140 -120 -100 -80 -60 -40 -20 -12.7 0 20 40]) % Set mag axis

text(ax(3),.24, -5.5, 'Uncompensated $\nearrow$', 'Interpreter', 'latex')
text(ax(2),2.1, 83, '$\swarrow$ Compensated ', 'Interpreter', 'latex')
text(ax(2),5.2, -175, '$\swarrow$ Phase Crossover ', 'Interpreter', 'latex')

h=text(ax(2),.2,110, '\leftarrow 20dB/d \rightarrow')
set(h, 'rotation', -11)
h=text(ax(2),20,40, '\leftarrow 60dB/d \rightarrow')
set(h, 'rotation', -28)
