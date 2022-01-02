%% Gráficas 
% Tobillo subida
ts = aplicarFiltroCheby2(grafica_tobillo_s(),2,0.5);
% Rodilla subida
rs = aplicarFiltroCheby2(grafica_rodilla_s(),2,0.5);
% Cadera subida
cs = aplicarFiltroCheby2(grafica_cadera_s(),2,0.5);

% Tobillo bajada
tb = aplicarFiltroCheby2(grafica_tobillo_b(),2,0.5);
% Rodilla bajada
rb = aplicarFiltroCheby2(grafica_rodilla_b(),2,0.5);
% Cadera bajada
cb = aplicarFiltroCheby2(grafica_cadera_b(),2,0.5);