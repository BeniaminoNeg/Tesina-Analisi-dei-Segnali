clear all;
clc;

N=31; %Doppio del periodo    
    
N0=2^(6); %Ordine della FFT
n=0:(N-1);
x=sin(2*pi*n*(1/N)).^2;

stem (n,x);
  	title ('Andamento del segnale');
    xlabel('n'); 
    ylabel('x[n]');
pause;

X=fft(x,N0);
    
k=0:N0-1;
k_norm=k/N0;
stem (k_norm,N0*abs(X));
	title ('Spettro di ampiezza di x[n]'); 
    xlabel('frequenza normalizzata'); 
    ylabel ('|X(f)|');
pause;
stem (k_norm,angle(X));
		title ('Spettro di fase di x[n]'); 
        xlabel('frequenza normalizzata'); 
        ylabel ('fase di X(f)');
pause;
%end;  
   

   
