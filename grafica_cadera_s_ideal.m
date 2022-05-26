function gcs_ideal = grafica_cadera_s_ideal()  
    % Grafica cadera subida ideal
    
    % Eje X de puntos originales
    xH = 0:10:200;
    
    % Para asegurarnos de que la componente X va de 0 a 200
    xH(1) = 0;
    xH(end) = 200;
   
    % Componente X de evaluacion
    xR = 0:1:200; 
    
    % Componente Y de puntos originales
    % Se termina en el mismo punto en el que se empieza
    yH = [8,9,11,12,10,9,6,5,4,4,3,0,-15,-18,-15,-10,3,6,10,10,8];
    
    % Definicion del minimo y maximo del movimiento
    minim = 0.96;
    maxim = 1.5;
    
    % Duracion del movimiento
    duration = minim + (maxim-minim);
    
    % Ajuste del eje X a la duracion del movimiento
    xH2 = xH*duration;
    
    % Interpolacion Akima
    pp = makima(xH2,yH);
    % Evaluacion del polinomio
    m = ppval(pp,xR*duration);
    
    % Representacion de la curva de movimiento sin utilizar filtros
    gcs_ideal = [xR*duration,m];
    gcs_ideal = gcs_ideal(203:end);
    
    % xlabel('Tiempo de movimiento (ms)');
    % ylabel('Ángulo de la cadera (º)');
    % plot(gcs_ideal);
end