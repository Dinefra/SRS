function grafica_filtradaCheby1 = aplicarFiltroCheby1(grafica,orden,frecuencia)
%Trabajamos con los datos de la grafica en una fila, no hace falta
%trasponer

% mostrar a partir de la muestra 2003 hasta el final
grafica= grafica(2003:end);

[bc1,ac1] = cheby1(orden,5,frecuencia);  %meter info del filtro aquí 
grafica_filtradaCheby1 = filtfilt(bc1,ac1,grafica);

figure;
subplot(2,1,1), plot(grafica), title('Gráfica con ruido'), 
xlabel('Tiempo de movimiento (ms)'), ylabel('Ángulo de la articulación (º)');
subplot(2,1,2), plot(grafica_filtradaCheby1), title('Gráfica filtrada'),
xlabel('Tiempo de movimiento (ms)'), ylabel('Ángulo de la articulación (º)');
end 

