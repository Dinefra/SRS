% Grafica cadera bajada

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
yH = [46,40,35,30,25,15,10,5,2,-2,-4,-6,-5,0,10,23,34,45,47,49,46];

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

% Representacion de la curva de movimiento
plot(xR*duration,m);
xlabel('Tiempo de movimiento (ms)');
ylabel('Ángulo de la cadera (º)');
hold on;
