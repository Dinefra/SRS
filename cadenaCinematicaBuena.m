
function cadenaCinematica(YPRtorso,YPRcadera,YPRrodilla,YPRtobillo)
% Movimientos en eje [z,y,x]
% YPRtorso = [rotacion, inclinacion der-izq,inclinacion delante-detras];
% YPRcadera = [rotacion,abduccion-aduccion,flexoextension];
% YPRrodilla = [0,rotacion,flexoextension];
% YPRtobillo =[abduccion-aduccion,pronacion-supinacion,flexoextension];
% YPRdedos = [0,0,0];

% Nos aseguramos de que la rodilla no tenga un comportamiento extraño
YPRrodilla(1) = 0;

% Nos aseguramos de que los dedos no tengan movimiento (lo movemos como un
% bloque)
% YPRdedos(1:3) = [0,0,0];

f = [1,2,3,4; 5,6,7,8; 5,6,2,1; 8,7,3,4; 6,7,3,2; 5,8,4,1];
color = [1,0,0; 0,1,0; 0,0,1; 1,1,0; 1,0,1; 0,1,1];

% Definicion de partes del cuerpo (lado izquierdo)
torso = [-10,-5,140;15,-5,140;15,55,140;-10,55,140;-10,-10,250;15,-10,250;15,60,250;-10,60,250];
piernaSuperior = [0,35,70;15,35,70;15,50,70;0,50,70;-10,30,140;15,30,140;15,55,140;-10,55,140];
piernaInferior = [0,35,10;15,35,10;15,50,10;0,50,10;0,35,70;15,35,70;15,50,70;0,50,70];
pie = [0,35,0;40,35,0;40,50,0;0,50,0;0,35,10;40,35,10;40,50,10;0,50,10];

figure;
patch('faces',f,'vertices',torso,'FaceVertexCData',color,'FaceColor','flat'),
patch('faces',f,'vertices',piernaSuperior,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaInferior,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',pie,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

% Centros de rotacion (articulaciones)
Rtorso = rotationMatrix(YPRtorso(1),YPRtorso(2),YPRtorso(3));
Rtobillo = rotationMatrix(YPRtobillo(1),YPRtobillo(2),YPRtobillo(3));
Rrodilla = rotationMatrix(YPRrodilla(1),YPRrodilla(2),YPRrodilla(3));
Rcadera = rotationMatrix(YPRcadera(1),YPRcadera(2),YPRcadera(3));
    %    prueba fallida
    %    R_torso = rotationMatrix(0,0,30);
    %    R_cadera = rotationMatrix(0,0,-30);
    %    R_rodilla = rotationMatrix(0,0,60);
    %    R_tobillo = rotationMatrix(0,0,20);

% Rotacion partes
torsoRotado = applyRotationNx3(torso,sum(torso)/8,Rtorso);

piernaSuperiorRotada = applyRotationNx3(applyRotationNx3(piernaSuperior,...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

piernaInferiorRotada = applyRotationNx3(applyRotationNx3(applyRotationNx3(piernaInferior,...
    sum(piernaSuperior(1:4,:))/4,Rrodilla),(torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

pieRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(pie,...
    sum(piernaInferior(1:4,:))/4,Rtobillo),sum(piernaSuperior(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

figure;
patch('faces',f,'vertices',torsoRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaSuperiorRotada,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaInferiorRotada,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',pieRotado,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

end