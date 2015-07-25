% ANALISI SPETTRALE DI UN IMPULSO RETTANGOLARE

clear;
clc;

N=5; % Durata dell'impulso (rettangolare)
x=[ones(1,N)];              
    
N0=8; % Durata dell'intervallo di visualizzazione e ordine della FFT
x1=[x, zeros(1,(N0-N))];
    
n=0:(N0-1);
stem (n,x1);
  	title ('Andamento del segnale');
    xlabel('n'); 
    ylabel('x[n]');
pause;

X=fft(x,N0); % Questa FFT già include l'operazione di zero-padding
    
n_norm=n/N0;
stem (n_norm,N0*abs(X));
	title ('Spettro di ampiezza di x[n]'); 
    xlabel('frequenza normalizzata'); 
    ylabel ('|X(f)|');
pause;
stem (n_norm,angle(X));
		title ('Spettro di fase di x[n]'); 
        xlabel('frequenza normalizzata'); 
        ylabel ('fase di X(f)');
pause;
%end;  
   

   
