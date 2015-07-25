%% Inizializzazione
close all;
clear all;
clc;

% Matrice DTFM
dtfm = [ '1' '2' '3' 'A';
         '4' '5' '6' 'B';
         '7' '8' '9' 'C';
         '*' '0' '#' 'D' ];
% Indici per individuare un valore nella matrice
riga = 0;
colonna = 0;

fc = 8192; % Frequenza di campionamento

%t = 0 : 1/fc : 0.040; % base dei tempi (40 ms)
t = 0 : 1/fc : 1; % 1 secondo per ascoltare il suono

N = 1024; % Ordine della FFT

%k = 0 : 1 : N-1; % Costruzione indici di frequenza
k = -(N-1)/2 : 1 : (N-1)/2; % Indici di frequenza centrati
k = k.*(fc/N); % ricostruzione frequenza analogica

f_tono1 = input( 'Frequenza primo tono: ' ); % frequenza tono 1
f_tono2 = input( 'Frequenza secondo tono: ' ); % frequenza tono 2

%% Costruzione segnale
Tono = cos( 2*pi*f_tono1*t) + cos( 2*pi*f_tono2*t );
SpettroTono = fft( Tono, N );
SpettroTono = fftshift( SpettroTono );


%% Visualizzazione spettro
% Ampiezza
subplot( 2,1,1 )
stem( k, abs(SpettroTono) );
title( 'Spettro di ampiezza:' );
xlabel( 'Indice di frequenza k' );
ylabel( 'Ampiezza' );
subplot( 2,1,2 )

% Fase
stem( k, angle(SpettroTono) );
title( 'Spettro di fase');
xlabel( 'Indice di frequenza k' );
ylabel( 'Fase' );


pause
%% Calcolo picchi sullo spettro d'ampiezza
[valori,indici] = sort( abs(SpettroTono),'descend' );
a = max( abs(k(indici(1))), abs(k(indici(2))) );
b = max( abs(k(indici(3))), abs(k(indici(4))) );

% Distinzione tra righe e colonne
Val_Riga = min(a,b);
Val_Colonna = max(a,b);

%% Verifica range (tolleranza 1.5%)

% Individuazione indice di riga
if (Val_Riga > 697*0.985) && (Val_Riga < 697*1.015)
    riga = 1;
elseif (Val_Riga > 770*0.985) && (Val_Riga < 770*1.015)
    riga = 2;
elseif (Val_Riga > 852*0.985) && (Val_Riga < 852*1.015)
    riga = 3;
elseif (Val_Riga > 941*0.985) && (Val_Riga < 941*1.015)
    riga = 4;
else
    riga = 0;
end;

% Individuazione indice di colonna
if (Val_Colonna > 1209*0.985) && (Val_Colonna < 1209*1.015)
    colonna = 1;
elseif (Val_Colonna > 1336*0.985) && (Val_Colonna < 1336*1.015)
    colonna = 2;
elseif (Val_Colonna > 1477*0.985) && (Val_Colonna < 1477*1.015)
    colonna = 3;
elseif (Val_Colonna > 1633*0.958) && (Val_Colonna < 1633*1.015)
    colonna = 4;
else
    colonna = 0;
end;

%% Controllo finale
if (riga~=0) && (colonna~=0)
    dtfm(riga,colonna) % Ricavo e visualizzo il simbolo DTFM dalla matrice
	soundsc( Tono, fc ); % riproduce il segnale
else
    'Coppia di toni non riconosciuta.'
end;



