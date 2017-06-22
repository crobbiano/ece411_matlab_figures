%% ECE411 aux1 - consists of step response, bode and nyquist plots
clear all
clc

s=tf('s');
w=10;
k=1;
Gs_under=k*w^2/((s^2+.3*w*s+w^2));
figure(1);clf
subplot(1,3,1)
step(Gs_under)
subplot(1,3,2)
bode(Gs_under)
subplot(1,3,3)
nyquist(Gs_under)

% pathS=[];
% cradius=.02;
% for i=cradius:.05:500
%     pathS(end+1)=complex(i*j);
% end
% % path around infinity
% pathFs = plotFs(pathS,Gs_under, 99, 0);
% plot(pathFs,'-')
% hold on
% plot (-1, 0, 'r+')
xlim([-2.75 1.1]);ylim([-2.75, 1.1])
% grid minor

Gs_critically = 10000/((s+100)^2);
figure(2)
subplot(1,3,1)
step(Gs_critically)
subplot(1,3,2)
bode(Gs_critically)
subplot(1,3,3)
nyquist(Gs_critically)

Gs_undamped = 36/((s+j*6)*(s-j*6));
figure(3)
subplot(1,3,1)
step(Gs_undamped)
subplot(1,3,2)
bode(Gs_undamped)
subplot(1,3,3)
nyquist(Gs_undamped)