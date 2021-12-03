% Angulos de cadera en subida
y_cs = [8,9,11,12,10,9,6,5,4,4,3,0,-15,-18,-15,-10,3,6,10,10,8];
% Angulos de cadera en bajada
y_cb = [46,40,35,30,25,15,10,5,2,-2,-4,-6,-5,0,10,23,34,45,47,49,46];
% Angulos de rodilla en subida
y_rs = [6,10,20,26,28,27,26,27,35,45,55,55,75,87,93,87,65,50,30,10,6];
% Angulos de rodilla en bajada
y_rb = [60,58,56,53,45,35,26,22,12,8,7,7,10,23,45,65,85,94,90,75,60];
% Angulos de tobillo en subida
y_ts = [-20,-10,5,7,10,12,13,15,19,22,24,20,10,2,1,-2,-10,-15,-20,-26,-20];
% Angulos de tobillo en bajada
y_tb = [11,10,13,14,11,8,7,6,7,9,10,14,19,25,29,31,29,25,20,15,11];

% Movimiento progresivo de subida
for i = 1:size(y_cs,2)
    Rtorso = rotationMatrix(0,0,90);
    Rcadera = rotationMatrix(0,y_cs(i),90);
        for j = 1:size(y_rs,2)
           Rrodilla = rotationMatrix(0,y_rs(j),90);
                for k = 1:size(y_ts,2)
                    Rtobillo = rotationMatrix(0,y_ts(k),90);
                end
        end
end

% Movimiento progresivo de bajada
for ii = 1:size(y_cb,2)
    Rtorso = rotationMatrix(0,0,90);
    Rcadera = rotationMatrix(0,y_cb(ii),90);
        for jj = 1:size(y_rb,2)
            Rrodilla = rotationMatrix(0,y_rb(jj),90);
                for kk = 1:size(y_tb,2)
                    Rtobillo = rotationMatrix(0,y_tb(kk),90);
                end
        end
end

