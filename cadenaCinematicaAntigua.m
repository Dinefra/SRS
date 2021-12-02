%clase CadenaCinematica
% cambiar centro de rotacion a cada elemento.
%sum... centro de rotacion --> suma de los 4 puntos / 4

function cadenaCinematica(YPRcadera, YPRrodilla, YPRtobillo) % Incluir dedos?
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

pieDTalon = [0,0,0; 20,0,0; 20,15,0; 0,15,0; 0,0,10; 20,0,10; 20,15,10; 0,15,10];
pieDPunta = [20,0,0; 35,0,0; 40,15,0; 20,15,0; 20,0,10; 35,0,5; 40,15,5; 20,15,10];
dedoGordo = [35,10,0; 45,10,0; 45,15,0; 40,15,0; 35,10,5; 45,10,5; 45,15,5; 40,15,5];
dedoIndice = [35,7,0; 43,7,0; 43,10,0; 35,10,0; 35,7,5; 43,7,5; 43,10,5; 35,10,5];
dedoCorazon = [35,4,0; 42,4,0; 42,7,0; 35,7,0; 35,4,5; 42,4,5; 42,7,5; 35,7,5];
dedoAnular = [35,2,0; 41,2,0; 41,4,0; 35,4,0; 35,2,5; 41,2,5; 41,4,5; 35,4,5];
dedoMenique = [35,0,0; 38,0,0; 38,2,0; 35,2,0; 35,0,5; 38,0,5; 38,2,5; 35,2,5];
pierna1 = [5,0,10; 15,0,10; 15,15,10; 5,15,10; 5,0,70; 15,0,70; 15,15,70; 5,15,70];
pierna2 = [0,0,10; 5,0,10; 5,15,10; 0,15,10; -5,0,45; 5,0,45; 5,15,45; -5,15,45];
pierna3 = [-5,0,45; 5,0,45; 5,15,45; -5,15,45; 0,0,70; 5,0,70; 5,15,70; 0,15,70];
piernaSuperior1 = [0,0,70; 15,0,70; 15,15,70; 0,15,70; -10,-5,120; 15,-5,120; 15,20,120;-10,20,120];
piernaSuperior2 = [-10,-5,120; 15,-5,120; 15,20,120; -10,20,120; -10,-5,140; 15,-5,140; 15,20,140; -10,20,140];
cadera = [-10,-5,140; 15,-5,140; 15,55,140; -10,55,140; -10,-5,160; 15,-5,160; 15,55,160; -10,55,160];
torso = [-10,-5,160;15,-5,160;15,55,160;-10,55,160;-10,-10,250;15,-10,250;15,60,250;-10,60,250];
% cambiar
figure;
% patch('faces',f,'vertices',dedos,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',pieDTalon,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',pieDPunta,'FaceVertexCData',color,'FaceColor','flat'),
patch('faces',f,'vertices',dedoGordo,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoIndice,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoCorazon,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoAnular,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoMenique,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',pierna1,'FaceVertexCData',color,'FaceColor','flat'),
patch('faces',f,'vertices',pierna2,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',pierna3,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaSuperior1,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaSuperior2,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',cadera,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',cadera,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',torso,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

Rtorso = rotationMatrix(YPRtorso(1),YPRtorso(2),YPRtorso(3));
Rtobillo = rotationMatrix(YPRtobillo(1),YPRtobillo(2),YPRtobillo(3));
Rrodilla = rotationMatrix(YPRrodilla(1),YPRrodilla(2),YPRrodilla(3));
Rcadera = rotationMatrix(YPRcadera(1),YPRcadera(2),YPRcadera(3));
% Rdedos = rotationMatrix(YPRdedos(1),YPRdedos(2),YPRdedos(3));

% rellenar
% tobilloRotado = ;
rodillaRotada = pplyRotationNx3(applyRotationNx3(applyRotationNx3(rodilla,...
    sum(cadera(1:4,:))/4,Rrodilla),(torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);;
caderaRotada = applyRotationNx3(applyRotationNx3(cadera,...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
torsoRotado = applyRotationNx3(torso,sum(torso)/8,Rtorso);
% dedosRotados = ;

% de referencia:
% manoRotada = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(mano,...
%     sum(antebrazo(1:4,:))/4,Rwrist),sum(brazo(1:4,:))/4,Rcodo),(torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);
% antebrazoRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(antebrazo,...
%     sum(brazo(1:4,:))/4,Rcodo),(torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);
% brazoRotado = applyRotationNx3(applyRotationNx3(brazo,...
%     (torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);
% torsoRotado = applyRotationNx3(torso,...
%     sum(torso)/8,Rtorso);

figure;
patch('faces',f,'vertices',tobilloRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',rodillaRotada,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',caderaRotada,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',torsoRotado,'FaceVertexCData',color,'FaceColor','flat');
%patch('faces',f,'vertices',dedosRotados,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

end