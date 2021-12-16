function grafica_filtradaB = aplicarFiltroButter(grafica,orden,frecuencia)
%Trabajamos con los datos de la grafica en una fila, no hace falta
%trasponer

% mostrar a partir de la muestra 2003 hasta el final
grafica= grafica(2003:end);

[bb,ab] = butter(orden,frecuencia); %meter info del filtro aquí 
grafica_filtradaB = filtfilt(bb,ab,grafica);

figure;
subplot(2,1,1), plot(grafica), title('Gráfica con ruido'), 
xlabel('Tiempo de movimiento (ms)'), ylabel('Ángulo de la articulación (º)');
subplot(2,1,2), plot(grafica_filtradaB), title('Gráfica filtrada'),
xlabel('Tiempo de movimiento (ms)'), ylabel('Ángulo de la articulación (º)');
end 

