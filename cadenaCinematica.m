%clase CadenaCinematica
% cambiar centro de rotacion a cada elemento.
%sum... centro de rotacion --> suma de los 4 puntos / 4

%function cadenaCinematica(YPRcadera, YPRrodilla, YPRtobillo)
%YPRtobillo =[0,0,flexoextension]
%YPRrodilla = [flexoextension,,]
%YPRcadera = [flexoextension,,]

%codigo de Borja copiado y pegado --> FALTA CAMBIARLO
function cadenaCinematica(YPRtorso,YPRhombro,YPRcodo,YPRwrist)

% YPRwrist = [pronosupinacion,flexoextension,0]
% YPRcodo = [0,0,flexion]
% YPRhombro = [rotacion,abduccion,flexoextension]
% YPRtorso = [rotacion, inclinacion der-izq,inclinacion delante-detras]

f = [1 2 3 4; 5 6 7 8;1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8];
color = [1 0 0;0 1 0;0 0 1;1 1 0;1 0 1;1 1 1];
torso = [30,10,10;30,20,10;60,20,10;60,10,10;30,10,120;30,20,120;60,20,120;60,10,120];
brazo = [10,10,60;10,20,60;30,20,60;30,10,60;10,10,120;10,20,120;30,20,120;30,10,120];
antebrazo = [10,10,10;10,20,10;30,20,10;30,10,10;10,10,60;10,20,60;30,20,60;30,10,60];
mano = [10,10,-10;10,20,-10;30,20,-10;30,10,-10;10,10,10;10,20,10;30,20,10;30,10,10];
% Nos aseguramos de que el codo no tenga un comportamiento extraño
YPRcodo(1:2)=[0,0];
% YPRwrist(2) = 0;

figure
patch('faces',f,'vertices',torso,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',brazo,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',antebrazo,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',mano,'FaceVertexCData',color,'FaceColor','flat')
view(3)
axis image
% Aplicamos una rotación del torso de 90 grados hacia la derecha
% Eso se traduce en un Yaw = -90
Rtorso = rotationMatrix(YPRtorso(1),YPRtorso(2),YPRtorso(3));
Rhombro = rotationMatrix(YPRhombro(1),YPRhombro(2),YPRhombro(3));
Rcodo = rotationMatrix(YPRcodo(1),YPRcodo(2),YPRcodo(3));
Rwrist = rotationMatrix(YPRwrist(1),YPRwrist(2),YPRwrist(3));

manoRotada = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(mano,...
    sum(antebrazo(1:4,:))/4,Rwrist),sum(brazo(1:4,:))/4,Rcodo),(torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);
antebrazoRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(antebrazo,...
    sum(brazo(1:4,:))/4,Rcodo),(torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);
brazoRotado = applyRotationNx3(applyRotationNx3(brazo,...
    (torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);
torsoRotado = applyRotationNx3(torso,...
    sum(torso)/8,Rtorso);

figure
patch('faces',f,'vertices',torsoRotado,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',brazoRotado,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',antebrazoRotado,'FaceVertexCData',color,'FaceColor','flat')
patch('faces',f,'vertices',manoRotada,'FaceVertexCData',color,'FaceColor','flat')
view(3)
axis image

end