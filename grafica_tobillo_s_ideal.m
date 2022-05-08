function gts_ideal = grafica_tobillo_s_ideal()  
    % Grafica tobillo subida ideal
    
    % Eje X de puntos originales
    xH = 0:5:100;
    
    % Para asegurarnos de que la componente X va de 0 a 100
    xH(1) = 0;
    xH(end) = 100;
   
    % Componente X de evaluacion
    xR = 0:0.05:100; 
    
    % Componente Y de puntos originales
    % Se termina en el mismo punto en el que se empieza
    yH = [-20,-10,5,7,10,12,13,15,19,22,24,20,10,2,1,-2,-10,-15,-20,-26,-20];
    
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
    gts_ideal = [xR*duration,m];
    gts_ideal = gts_ideal(2003:end);
    
    % xlabel('Tiempo de movimiento (ms)');
    % ylabel('Ángulo del tobillo (º)');
    % plot(gts_ideal);
end