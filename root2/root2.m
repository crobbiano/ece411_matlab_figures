%% ECE411 Root Locus 2
clc
s=tf('s');
Gps=(s+3)/((s-2)*s);
Hs=0.5;
% Gs=feedback(Gps,Hs);
Gs=Gps;


figure(1);clf;
rlocus(Gs,'-')
hold on;
rlocus(-Gs,'--')

% Add bubbles at breakaway points
plot(-6.87, 0, 'md')
plot(.873, 0, 'md')
% plot(-5.5, 0, 'bo')

% Update title and labels
title('Complete Root Locus for $G_p(s)=\frac{(s+3)}{s(s-2)}$ and $H(s)=0.5$','Interpreter','latex')
legend('Root Locus', 'Complementary Root Locus')
findall(gcf,'String','Imaginary Axis (seconds^{-1})');
axIm = findall(gcf,'String','Imaginary Axis (seconds^{-1})');
axRe = findall(gcf,'String','Real Axis (seconds^{-1})');
set(axIm,'String','Imaginary Axis');
set(axRe,'String','Real Axis');
xlim([-10 5])

% Add some arrows indicating k values
x1 = 0;
y1 = 2.45;
txt1 = '\leftarrow k_{crit} = 4, j\omega = 8.94';
text(x1,y1,txt1)
x1 = -.1;
y1 = -.2;
txt1 = '\uparrow k_{crit} = 0, j\omega = 0';
text(x1,y1,txt1)
x1 = 0;
y1 = -2.45;
txt1 = '\leftarrow k_{crit} = 4, j\omega = -8.94';
text(x1,y1,txt1)

x1 = -3.05;
y1 = -.2;
txt1 = '\uparrow k = \infty, s = -3';
text(x1,y1,txt1)
x1 = 1.95;
y1 = .2;
txt1 = '\downarrow k = 0, s = 2';
text(x1,y1,txt1)
x1 = xlim; x1=x1(1);
y1 = -.2;
txt1 = '\leftarrow k = \infty, s = -\infty';
text(x1,y1,txt1)
x1 = xlim; x1=x1(2)-2.1;
y1 = -.2;
txt1 = 'k = \infty, s = \infty \rightarrow ';
text(x1,y1,txt1)