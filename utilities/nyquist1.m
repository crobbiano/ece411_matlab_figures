%% ECE411 Nyquist 1
clc; clear all;

s=tf('s');
theta=linspace(0,2*pi,5000);
for i=1:length(theta)
%     path_s(i)=5*exp(j*theta(i)) + cos(10*pi*i/length(theta));
    path_s(i)=5*exp(j*theta(i));
end

%% Create transfer function with 1 pole and 2 zeros 
G1s=((s+1)*(s+.5))/(s-.75);
plotFs(path_s, G1s, 1)

%% Create transfer function with 2 poles and 2 zeros
G2s=((s+1)*(s+2))/((s+3j)*(s-3*j));
plotFs(path_s, G2s, 2)

%% Create transfer function with 2 poles and 1 zero
G3s=(s+2.5)/((s-1)*(s+1));
plotFs(path_s, G3s, 3)