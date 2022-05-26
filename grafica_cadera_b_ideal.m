function gcb_ideal = grafica_cadera_b_ideal()  
    % Grafica cadera bajada ideal
    
    % Eje X de puntos originales
    xH = 0:10:200;
    
    % Para asegurarnos de que la componente X va de 0 a 200
    xH(1) = 0;
    xH(end) = 200;
   
    % Componente X de evaluacion
    xR = 0:1:200; 
    
    % Componente Y de puntos originales
    % Se termina en el mismo punto en el que se empieza
    yH = [46,40,35,30,25,15,10,5,2,-2,-4,-6,-5,0,10,23,34,45,47,49,46];
    
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
    gcb_ideal = [xR*duration,m];
    gcb_ideal = gcb_ideal(203:end);
    
%     xlabel('Tiempo de movimiento (ms)');
%     ylabel('Ángulo de la cadera (º)');
%     plot(gcb_ideal);
end