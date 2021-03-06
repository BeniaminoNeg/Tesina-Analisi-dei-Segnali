clear all;
clc;
N=8; %Periodo    
    
N0=2^8; %Ordine della FFT (alto=>fa lo zero padding)
n=0:(N-1); %il vettore n contiene i valori da 0 a N-1 in passi di 1
x=cos(2*pi*n*(1/N));% Il coseno (a frequenza 1/N) � finestrato con una rect

subplot(311)
stem (n,x);
  	title ('Andamento del segnale');
    xlabel('n'); 
    ylabel('x[n]');

subplot(312)
X=fft(x,N0); % SpettroSegnale=fft(Segnale,OrdineFft)
             
k=0:N0-1;
k_norm=k/N0; % I campioni del coseno sono presi in multipli interi di 1/N
             % normalizzati nell' intervallo [0,1]
    
stem (k_norm,N0*abs(X));
	title ('Spettro di ampiezza di x[n]'); 
    xlabel('frequenza normalizzata'); %considero i valori da 0 a1
    ylabel ('|X(f)|');

subplot(313)
stem (k_norm,angle(X));
		title ('Spettro di fase di x[n]'); 
        xlabel('frequenza normalizzata'); 
        ylabel ('fase di X(f)');

%end;