function grb_ideal = grafica_rodilla_b_ideal()  
    % Grafica rodilla bajada ideal
    
    % Eje X de puntos originales
    xH = 0:5:100;
    
    % Para asegurarnos de que la componente X va de 0 a 100
    xH(1) = 0;
    xH(end) = 100;
   
    % Componente X de evaluacion
    xR = 0:0.05:100; 
    
    % Componente Y de puntos originales
    % Se termina en el mismo punto en el que se empieza
    yH = [60,58,56,53,45,35,26,22,12,8,7,7,10,23,45,65,85,94,90,75,60];
    
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
    grb_ideal = [xR*duration,m];
    grb_ideal = grb_ideal(2003:end);
    
    % xlabel('Tiempo de movimiento (ms)');
    % ylabel('Ángulo de la rodilla(º)');
    % plot(grb_ideal);
end