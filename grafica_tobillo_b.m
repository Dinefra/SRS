% Grafica tobillo bajada

% Eje X de puntos originales
xH = 0:5:100;

% Distribucion original con variable aleatoria
xH = xH + 0.5*rand(1,21);

% Para asegurarnos de que la componente X va de 0 a 100 a pesar de la 
% variable aleatoria
xH(1) = 0;
xH(end) = 100;

% Periodo entre muestras
T = (xH(end)-xH(1))/length(xH); 

% Valor aleatorio T al que se le resta la mitad del propio periodo para que 
% cuando se muevan dos muestras consecutivas, no se superpongan entre sí
rxT = T.*rand(1,1) - (T/2); 

% Nuevo eje x con periodo de muestreo aleatorio
xH = xH + rxT;

% Componente X de evaluacion - ?? ISA MIRAR VIDEO
xR = 0:0.05:100; 

% Componente Y de puntos originales
% Se termina en el mismo punto en el que se empieza
yH = [11,10,13,14,11,8,7,6,7,9,10,14,19,25,29,31,29,25,20,15,11]; % CAMBIAR

% Para crear un vector de valores aleatorios entre 1 y 21 multiplicado por 
% 5 que se suman a los valores originales de la componente Y
yH = yH + 5*rand(1,21);

% Definicion del minimo y maximo del movimiento
minim = 0.96;
maxim = 1.5;

% Duracion aleatoria del movimiento
duration = minim + (maxim-minim)*rand(1);

% Ajuste del eje X a la duracion del movimiento
xH2 = xH*duration;

% Interpolacion Akima
pp = makima(xH2,yH);
% Evaluacion del polinomio
m = ppval(pp,xR*duration);
% Introduccion de ruido sobre la curva de movimiento obtenida
m = m + 1.5*rand(1,2001);

grafica_ruidosa = [xR*duration,m];
grafica_ruidosa = grafica_ruidosa(2003:end);

%% Filtros de paso bajo
% Butterworth
% [bb,ab] = butter(6,0.5);
[bb,ab] = butter(2,0.5);
% [bb,ab] = butter(12,0.5);
grafica_filtradaB = filtfilt(bb,ab,grafica_ruidosa);

% Cheby1
% [bc1,ac1] = cheby1(6,5,0.5); % 5 son los decibelos en la banda de rizado
[bc1,ac1] = cheby1(2,5,0.5); 
% [bc1,ac1] = cheby1(12,5,0.5); 
grafica_filtradaC1 = filtfilt(bc1,ac1,grafica_ruidosa);

% Cheby2
% [bc2,ac2] = cheby2(6,80,0.5); % 80 son los decibelos en la banda de rechazo
[bc2,ac2] = cheby2(2,80,0.5); 
% [bc2,ac2] = cheby2(12,80,0.5); 
grafica_filtradaC2 = filtfilt(bc2,ac2,grafica_ruidosa); 

% Eliptico
% [be,ae] = ellip(6,5,80,0.5);
[be,ae] = ellip(2,5,80,0.5);
% [be,ae] = ellip(12,5,80,0.5);
grafica_filtradaE = filtfilt(be,ae,grafica_ruidosa); 

% figure('Name','Filtrado orden 2'); 
% subplot(5,1,1), plot(grafica_ruidosa),
% subplot(5,1,2), plot(grafica_filtradaB),
% subplot(5,1,3), plot(grafica_filtradaC1),
% subplot(5,1,4), plot(grafica_filtradaC2),
% subplot(5,1,5), plot(grafica_filtradaE);

figure;
subplot(2,1,1), plot(grafica_ruidosa), title('Gráfica con ruido'), 
xlabel('Tiempo de movimiento (ms)'), ylabel('Ángulo del tobillo (º)');
subplot(2,1,2), plot(grafica_filtradaC2), title('Gráfica filtrada'),
xlabel('Tiempo de movimiento (ms)'), ylabel('Ángulo del tobillo (º)');

% Representacion de la curva de movimiento
% plot(xR*duration,m);
% xlabel('Tiempo de movimiento (ms)');
% ylabel('Ángulo del tobillo (º)');
% hold on;
