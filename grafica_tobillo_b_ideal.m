function gtb_ideal = grafica_tobillo_b_ideal()  
    % Grafica tobillo bajada ideal
    
    % Eje X de puntos originales
    xH = 0:5:100;
    
    % Para asegurarnos de que la componente X va de 0 a 100
    xH(1) = 0;
    xH(end) = 100;
   
    % Componente X de evaluacion
    xR = 0:0.05:100; 
    
    % Componente Y de puntos originales
    % Se termina en el mismo punto en el que se empieza
     yH = [11,10,13,14,11,8,7,6,7,9,10,14,19,25,29,31,29,25,20,15,11];
    
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
    gtb_ideal = [xR*duration,m];
    gtb_ideal = gtb_ideal(2003:end);
    
    % xlabel('Tiempo de movimiento (ms)');
    % ylabel('Ángulo del tobillo (º)');
    % plot(gtb_ideal);
end