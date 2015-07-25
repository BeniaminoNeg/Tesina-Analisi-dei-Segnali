% analisi spettrale coppia di sinusoidi
clear all
close all
clc
A0 = 1;
A1 = 0.75;
% N = input('Lunghezza della finestra N = ');
% R = input('Lunghezza della DFT R = ');
% N = 16;
% R = 128;
% fr(1) = input('Frequenza della prima sinusoide = ');
% %fr(2) = input('Frequenza della seconda sinusoide = ');
% fr(2) = 0.34;
%%%%%%%%%%%%%% mod %%%%%%%%%%%%%%%%
N = 20000;
R = 128; % lunghezza della DFT
% fr = [1/16 1/8];
fr = [0.34 0.45];
%%%%%%%%%%%%%% end mod %%%%%%%%%%%%%%%%
n = 0:N-1;
x1 = A0*sin(2*pi*n*fr(1));
x2 = A1*sin(2*pi*n*fr(2));
x = x1+x2;
figure(1)
stem(n(1:100),x1(1:100));
xlabel('n'); ylabel('x_1');
%title(['N = ',num2str(N),', R = ',num2str(R)]);
figure(2)
stem(n,x2);
xlabel('n'); ylabel('x_2');


Fx = fft(x,R);
k = 0:R-1;% legato ad omega = 2 pi k/R
% plot(k/R,abs(Fx));
figure(3)
stem(k,abs(Fx));grid
xlabel('k'); ylabel('Magnitude');
title(['N = ',num2str(N),', R = ',num2str(R)]);

% Calcolo DTFT
% w = 0:1023;
% x = A0*sin(2*pi*n*fr(1)) + A1*sin(2*pi*n*fr(2));
% XE = fft(x,1024); 
% plot(w/1024,abs(XE))
% xlabel('\omega/2\pi'); ylabel('Magnitude')