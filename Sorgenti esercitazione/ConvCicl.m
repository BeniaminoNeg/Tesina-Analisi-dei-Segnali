% CONVOLUZIONE LINEARE VIA CONVOLUZIONE CICLICA

clear;
clc;

Nx=4; % Durata del segnale rettangolare x(n)
x=[ones(1,Nx)];              
 
Nh=4; % Durata della risposta all'impulso h(n)
h=[ones(1,Nh)];
 
N=max(Nx,Nh); %N=Nx se Nx > Nh, altrimenti N=Nh se Nx < Nh
            
N0=2*N-1; % Durata del segnale y(n)e dell'intervallo di visualizzazione, ordine della FFT
  
xp=[x, zeros(1,(N0-Nx))];  % Zero padding su x(n)
hp=[h, zeros(1,(N0-Nh))];  % Zero padding su h(n)
       
n=0:(N0-1); 
   
stem(n,xp); % Visualizzazione di x1
    title('Andamento del segnale x[n] dopo lo zero padding');
    xlabel('n');
    ylabel('x[n]');
pause;
    
stem(n,hp); % Visualizzazione di h1
    title('Andamento del segnale h[n] dopo lo zero padding');
    xlabel('n');
    ylabel('h[n]');
pause;
    
X=fft(xp,N0); 
stem((n/N0), N0*abs(X)); % Visualizzazione di |X|
    title('Spettro di ampiezza di x[n]');
    xlabel('Frequenza normalizzata');
    ylabel('|X(f)|');
pause;
stem((n/N0), angle(X)); % Visualizzazione della fase di X
    title('Spettro di fase di x[n]');
    xlabel('Frequenza normalizzata');
    ylabel('angolo di X(f)');
pause;
    
H=fft(hp,N0);
stem((n/N0), N0*abs(H)); % Visualizzazione di |H|
    title('Spettro di ampiezza di h[n]');
    xlabel('Frequenza normalizzata'); 
    ylabel('|H(f)|');
pause;
stem((n/N0), angle(H));  % Visualizzazione della fase di H
    title('Spettro di fase di h[n]');
    xlabel('Frequenza normalizzata'); 
    ylabel('angolo di H(f)');
pause;
        
for i=1:N0
    Y(i)=X(i)*H(i);
end;
    
stem((n/N0),N0*abs(Y));
    title('Spettro di ampiezza y[n]');
    xlabel('frequenza normalizzata');
    ylabel('|Y(f)|');
pause;
stem((n/N0),angle(Y));
    title('Spettro di fase y[n]');
    xlabel('frequenza normalizzata');
    ylabel('angle Y(f)');
pause;

y=ifft(Y,N0);
stem(n,y);
    title('Andamento del segnale y[n]');
    xlabel('n');
    ylabel('y[n]');
pause;
  
