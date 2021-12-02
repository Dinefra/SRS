

function cadenaCinematica(YPRcadera, YPRrodilla, YPRtobillo) % Incluir dedos?
% YPRtobillo =[flexoextension,pronacion-supinacion,abduccion-aduccion];
% YPRrodilla = [flexoextension,rotacion,0];
% YPRcadera = [flexoextension,abduccion-aduccion,rotacion];
% YPRdedos = [0,0,0];

% Nos aseguramos de que la rodilla no tenga un comportamiento extraño
YPRrodilla(2) = 0;

% Nos aseguramos de que los dedos no tengan movimiento (lo movemos como un
% bloque)
%YPRdedos(1:3) = [0,0,0];

f = [1,2,3,4; 5,6,7,8; 5,6,2,1; 8,7,3,4; 6,7,3,2; 5,8,4,1];
color = [1,0,0; 0,1,0; 0,0,1; 1,1,0; 1,0,1; 0,1,1];

pieDTalon=[0,0,0;40,0,0;40,15,0;0,15,0;0,0,10;40,0,10;40,15,10;0,15,10];
Pierna1=[0,0,10;15,0,10;15,15,10;0,15,10;0,0,70;15,0,70;15,15,70;0,15,70];
PiernaSuperior1=[0,0,70;15,0,70;15,15,70;0,15,70;-10,-5,120;15,-5,120;15,20,120;-10,20,120];
Cadera=[-10,-5,120;15,-5,120;15,40,120;-10,40,120;-10,-5,140;15,-5,140;15,40,140;-10,40,140];

Rtobillo = rotationMatrix(YPRtobillo(1),YPRtobillo(2),YPRtobillo(3));
Rrodilla = rotationMatrix(YPRrodilla(1),YPRrodilla(2),YPRrodilla(3));
Rcadera = rotationMatrix(YPRcadera(1),YPRcadera(2),YPRcadera(3));
%Rdedos = rotationMatrix(YPRdedos(1),YPRdedos(2),YPRdedos(3));
%pierna 1 
%piernasuperior muslo 
figure;
patch('faces',f,'vertices',pieDTalon,'FaceVertexCData',color,'FaceColor','flat'),
patch('faces',f,'vertices',Pierna1,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',PiernaSuperior1,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',Cadera,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

%rotacion
caderaRotada =applyRotationNx3(Cadera,sum(Cadera)/8,Rcadera) ;

rodillaRotada = applyRotationNx3(applyRotationNx3(applyRotationNx3(PiernaSuperior1, ...
    sum(Pierna1)/8,Rcadera),(Cadera(5,:)+Cadera(6,:)),Rrodilla,sum(Cadera)/8,Rcadera));

tobilloRotado =applyRotationNx3(applyRotationNx3(applyRotationNx3())) ;
% dedosRotados = ;

%ejemplo borja tren superior
%torso - cadera
%antebrazo - rodilla 
%brazo - tobillo
%mano - pie

% manoRotada = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(mano,...
%     sum(antebrazo(1:4,:))/4,Rwrist),sum(brazo(1:4,:))/4,Rcodo),(torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);

% antebrazoRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(antebrazo,...
%     sum(brazo(1:4,:))/4,Rcodo),(torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);

% brazoRotado = applyRotationNx3(applyRotationNx3(brazo,...
%     (torso(5,:)+torso(6,:))/2,Rhombro),sum(torso)/8,Rtorso);

figure;
patch('faces',f,'vertices',tobilloRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',rodillaRotada,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',caderaRotada,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedosRotados,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

end