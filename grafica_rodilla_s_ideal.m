function grs_ideal = grafica_rodilla_s_ideal()  
    % Grafica rodilla subida ideal
    
    % Eje X de puntos originales
    xH = 0:10:200;
    
    % Para asegurarnos de que la componente X va de 0 a 200
    xH(1) = 0;
    xH(end) = 200;
   
    % Componente X de evaluacion
    xR = 0:1:200; 
    
    % Componente Y de puntos originales
    % Se termina en el mismo punto en el que se empieza
    yH = [6,10,20,26,28,27,26,27,35,45,55,55,75,87,93,87,65,50,30,10,6];
    
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
    grs_ideal = [xR*duration,m];
    grs_ideal = grs_ideal(203:end);
    
    % xlabel('Tiempo de movimiento (ms)');
    % ylabel('Ángulo de la rodilla (º)');
    % plot(grs_ideal);
end