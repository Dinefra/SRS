% Grafica rodilla subida

% Eje X de puntos originales
xH = 0:5:100;

% Distribucion original con variable aleatoria
xH = xH + 0.5*rand(1,21);

% Para asegurarnos de que la componente X va de 0 a 100 a pesar de la 
% variable aleatoria
xH(1) = 0;
xH(end) = 100;

% Componente X de evaluacion - ?? ISA MIRAR VIDEO
xR = 0:0.05:100; 

% Componente Y de puntos originales
% Se termina en el mismo punto en el que se empieza
yH = [6,10,20,26,28,27,26,27,35,45,55,55,75,87,93,87,65,50,30,10,6];

% Para crear un vector de valores aleatorios entre 1 y 21 multiplicado por 
% 5 que se suman a los valores originales de la componente Y
yH = yH + 5*rand(1,21);

% Definicion del minimo y maximo del movimiento - DUDA: PREGUNTAR AL PROFE En segundos??
minim = 0.88;
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
m = m + 3*rand(1,2001);

% Representacion de la curva de movimiento
plot(xR*duration,m);
title('Gráfica de subida de rodilla');
hold on;

