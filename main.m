%% Gráficas 
% Tobillo subida
ts = aplicarFiltroCheby2(gts,2,0.5);
% Rodilla subida
rs = aplicarFiltroCheby2(grs,2,0.5);
% Cadera subida
cs = aplicarFiltroCheby2(gcs,2,0.5);

% Tobillo bajada
tb = aplicarFiltroCheby2(gtb,2,0.5);
% Rodilla bajada
rb = aplicarFiltroCheby2(grb,2,0.5);
% Cadera bajada
cb = aplicarFiltroCheby2(gcb,2,0.5);