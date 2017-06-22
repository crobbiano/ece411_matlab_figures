%% ECE411 Root Locus 1
clc
s=tf('s');
Gs=1/((s+4)*(s+8)*(s+12)*(s+16));

figure(1);clf;
rlocus(Gs,'-')
hold on;
rlocus(-Gs,'--')

% Add bubbles at breakaway points
plot(-14.47, 0, 'md')
plot(-10, 0, 'md')
plot(-5.5, 0, 'md')

% Update title and labels
title('Complete Root Locus for $G(s)=\frac{1}{(s+4)(s+8)(s+12)(s+16)}$','Interpreter','latex')
legend('Root Locus', 'Complementary Root Locus')
findall(gcf,'String','Imaginary Axis (seconds^{-1})');
axIm = findall(gcf,'String','Imaginary Axis (seconds^{-1})');
axRe = findall(gcf,'String','Real Axis (seconds^{-1})');
set(axIm,'String','Imaginary Axis');
set(axRe,'String','Real Axis');

% Add some arrows indicating k values
x1 = 0;
y1 = 8.94;
txt1 = '\leftarrow k_{crit} = 32256, j\omega=8.94';
text(x1,y1,txt1)
x1 = -.1;
y1 = -.5;
txt1 = '\uparrow k_{crit} = -6144, j\omega=0';
text(x1,y1,txt1)
x1 = 0;
y1 = -8.94;
txt1 = '\leftarrow k_{crit} = 32256, j\omega=-8.94';
text(x1,y1,txt1)


x1 = -35;
y1 = ylim; y1=y1(2)-.5;
text(x1,y1,'$\nwarrow$ k = $\infty$','Interpreter','latex')
x1 = -34.5;
y1 = ylim; y1=y1(1)+.8;
text(x1,y1,'$\swarrow$ k = $\infty$','Interpreter','latex')
x1 = 15;
y1 = ylim; y1=y1(2)-.5;
text(x1,y1,'$\nearrow$ k = $\infty$','Interpreter','latex')
x1 = 14.5;
y1 = ylim; y1=y1(1)+.8;
text(x1,y1,'$\searrow$ k = $\infty$','Interpreter','latex')
x1 = -10;
y1 = ylim; y1=y1(2)-.5;
txt1 = '\uparrow k = \infty';
text(x1,y1,txt1)
x1 = -10;
y1 = ylim; y1=y1(1)+.8;
txt1 = '\downarrow k = -\infty';
text(x1,y1,txt1)
x1 = xlim; x1=x1(1);
y1 = -.2;
txt1 = '\leftarrow k = -\infty';
text(x1,y1,txt1)
x1 = xlim; x1=x1(2)-5;
y1 = -.2;
txt1 = 'k = -\infty \rightarrow ';
text(x1,y1,txt1)