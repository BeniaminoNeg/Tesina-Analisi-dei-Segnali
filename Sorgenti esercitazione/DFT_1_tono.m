% analisi spettrale coppia di sinusoidi
clear all
close all
clc
A0 = 1;


N = 320; %lunghezza segnale
R = 205; % lunghezza della DFT

fa = 697; 
%%%%%%%%%%%%%% end mod %%%%%%%%%%%%%%%%
n = 0:N-1;
x = A0*sin(2*pi*n*fa/8000);
figure(1)
stem(n,x);
Fx = fft(x,R);
k = 0:R-1;% legato ad omega = 2 pi k/R
% plot(k/R,abs(Fx));
figure(2)
stem(k,abs(Fx));grid
xlabel('k'); ylabel('Magnitude');
title(['N = ',num2str(N),', R = ',num2str(R)]);

% Calcolo DTFT
% w = 0:1023;
% x = A0*sin(2*pi*n*fr(1)) + A1*sin(2*pi*n*fr(2));
% XE = fft(x,1024); 
% plot(w/1024,abs(XE))
% xlabel('\omega/2\pi'); ylabel('Magnitude')