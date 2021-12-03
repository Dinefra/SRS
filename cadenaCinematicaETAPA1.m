function cadenaCinematicaETAPA1(YPRtorso,YPRcadera,YPRrodilla,YPRtobillo)
% Movimientos en eje [z,y,x]
% YPRtorso = [rotacion, inclinacion der-izq,inclinacion delante-detras];
% YPRcadera = [rotacion,abduccion-aduccion,flexoextension];
% YPRrodilla = [0,rotacion,flexoextension];
% YPRtobillo =[abduccion-aduccion,pronacion-supinacion,flexoextension];
% YPRdedos = [0,0,0];

%--------------------------------------------------------------------------

% Nos aseguramos de que la rodilla no tenga un comportamiento extraño
YPRrodilla(1) = 0;

% Nos aseguramos de que los dedos no tengan movimiento (lo movemos como un
% bloque)
% YPRdedos(1:3) = [0,0,0];

f = [1,2,3,4; 5,6,7,8; 5,6,2,1; 8,7,3,4; 6,7,3,2; 5,8,4,1];
color = [1,0,0; 0,1,0; 0,0,1; 1,1,0; 1,0,1; 0,1,1];
%--------------------------------------------------------------------------
%PIE
pieDTalon=[0,0,0;20,0,0;20,15,0;0,15,0;0,0,10;20,0,10;20,15,10;0,15,10];


pieDPunta=[20,0,0;35,0,0;40,15,0;20,15,0;20,0,10;35,0,5;40,15,5;20,15,10];


dedoGordo=[35,10,0;45,10,0;45,15,0;40,15,0;35,10,5;45,10,5;45,15,5;40,15,5];


dedoIndice=[35,7,0;43,7,0;43,10,0;35,10,0;35,7,5;43,7,5;43,10,5;35,10,5];


dedoCorazon=[35,4,0;42,4,0;42,7,0;35,7,0;35,4,5;42,4,5;42,7,5;35,7,5];


dedoAnular=[35,2,0;41,2,0;41,4,0;35,4,0;35,2,5;41,2,5;41,4,5;35,4,5];


dedoMenique=[35,0,0;38,0,0;38,2,0;35,2,0;35,0,5;38,0,5;38,2,5;35,2,5];


%-----------------------------------------------------------------------------
%PIERNA INFERIOR
Pierna1=[5,0,10;15,0,10;15,15,10;5,15,10;5,0,70;15,0,70;15,15,70;5,15,70];

Pierna2=[0,0,10;5,0,10;5,15,10;0,15,10;-5,0,45;5,0,45;5,15,45;-5,15,45];

Pierna3=[-5,0,45;5,0,45;5,15,45;-5,15,45;0,0,70;5,0,70;5,15,70;0,15,70];

%-----------------------------------------------------------------------------
%PIERNA SUPERIOR
piernaSuperior1=[0,0,70;15,0,70;15,15,70;0,15,70;-10,-5,120;15,-5,120;15,20,120;-10,20,120];

piernaSuperior2=[-10,-5,120;15,-5,120;15,20,120;-10,20,120;-10,-5,140;15,-5,140;15,20,140;-10,20,140];



% Definicion de partes del cuerpo (lado izquierdo)
torso = [-10,-5,140;15,-5,140;15,55,140;-10,55,140;-10,-10,250;15,-10,250;15,60,250;-10,60,250];
%piernaSuperior = [0,35,70;15,35,70;15,50,70;0,50,70;-10,30,140;15,30,140;15,55,140;-10,55,140];
%piernaInferior = [0,35,10;15,35,10;15,50,10;0,50,10;0,35,70;15,35,70;15,50,70;0,50,70];
%pie = [0,35,0;40,35,0;40,50,0;0,50,0;0,35,10;40,35,10;40,50,10;0,50,10];

figure;
patch('faces',f,'vertices',torso,'FaceVertexCData',color,'FaceColor','flat');

%-------------------PIERNA SUPERIOR----------------------------------------------------------

patch('faces',f,'vertices',piernaSuperior1,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaSuperior2,'FaceVertexCData',color,'FaceColor','flat');

%-------------------PIERNA INFERIOR----------------------------------------------------------

patch('Faces',f,'Vertices',Pierna1,'FaceVertexCData',color,'FaceColor','flat');
patch('Faces',f,'Vertices',Pierna2,'FaceVertexCData',color,'FaceColor','flat');
patch('Faces',f,'Vertices',Pierna3,'FaceVertexCData',color,'FaceColor','flat');


%-------------------PIE----------------------------------------------------------

patch('faces',f,'vertices',pieDTalon,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',pieDPunta,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoGordo,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoIndice,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoCorazon,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoAnular,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoMenique,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

% Centros de rotacion (articulaciones)
% Rtorso = rotationMatrix(YPRtorso(1),YPRtorso(2),YPRtorso(3));
% Rtobillo = rotationMatrix(YPRtobillo(1),YPRtobillo(2),YPRtobillo(3));
% Rrodilla = rotationMatrix(YPRrodilla(1),YPRrodilla(2),YPRrodilla(3));
% Rcadera = rotationMatrix(YPRcadera(1),YPRcadera(2),YPRcadera(3));

    %    prueba fallida
    %    R_torso = rotationMatrix(0,0,30);
    %    R_cadera = rotationMatrix(0,0,-30);
    %    R_rodilla = rotationMatrix(0,0,60);
    %    R_tobillo = rotationMatrix(0,0,20);

        %prueba 2
%        Rtorso = rotationMatrix(0,0,10);
%        Rcadera = rotationMatrix(0,0,10);
%        Rrodilla = rotationMatrix(0,0,27);
%        Rtobillo = rotationMatrix(0,0,10);

       %prueba3
%        Rtorso = rotationMatrix(0,0,0);
%         Rcadera = rotationMatrix(0,0,10);
%         Rrodilla = rotationMatrix(0,0,-27);
%         Rtobillo = rotationMatrix(0,0,10);

        Rtorso = rotationMatrix(0,-10,0);
        Rcadera = rotationMatrix(0,-10,0);
        Rrodilla = rotationMatrix(0,10,10);
        Rtobillo = rotationMatrix(0,10,10);

%info util
%inclinacion rodilla 23º hombres, 27ºmujeres
%inclinacion cadera entre 90º y 135º
%inclinacion tobillo 90º? --> duda



% Rotacion partes
%---------------ROTACIÓN DEL TORSO-------------------------------------------

torsoRotado = applyRotationNx3(torso,sum(torso)/8,Rtorso);

%---------------ROTACIÓN DELA PIERNA SUPERIOR-------------------------------------------

piernaSuperiorRotada1 = applyRotationNx3(applyRotationNx3(piernaSuperior1,...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
piernaSuperiorRotada2 = applyRotationNx3(applyRotationNx3(piernaSuperior2,...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

%---------------ROTACIÓN DE LA PIERNA INFERIOR----------------------------------------

piernaInferiorRotada1 = applyRotationNx3(applyRotationNx3(applyRotationNx3(Pierna1,...
    sum(piernaSuperior1(1:4,:))/4,Rrodilla),(torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

piernaInferiorRotada2 = applyRotationNx3(applyRotationNx3(applyRotationNx3(Pierna2,...
    sum(piernaSuperior1(1:4,:))/4,Rrodilla),(torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

piernaInferiorRotada3 = applyRotationNx3(applyRotationNx3(applyRotationNx3(Pierna3,...
    sum(piernaSuperior1(1:4,:))/4,Rrodilla),(torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

%---------------ROTACIÓN DEL PIE-------------------------------------------

pieTalonRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(pieDTalon,...
    sum(Pierna1(1:4,:))/4,Rtobillo),sum(piernaSuperior1(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
piePuntaRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(pieDPunta,...
    sum(Pierna1(1:4,:))/4,Rtobillo),sum(piernaSuperior1(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
dedoPulgarRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(dedoGordo,...
    sum(Pierna1(1:4,:))/4,Rtobillo),sum(piernaSuperior1(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
dedoIndiceRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(dedoIndice,...
    sum(Pierna1(1:4,:))/4,Rtobillo),sum(piernaSuperior1(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
dedoCorazonRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(dedoCorazon,...
    sum(Pierna1(1:4,:))/4,Rtobillo),sum(piernaSuperior1(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
dedoAnularRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(dedoAnular,...
    sum(Pierna1(1:4,:))/4,Rtobillo),sum(piernaSuperior1(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);
dedoMeniqueRotado = applyRotationNx3(applyRotationNx3(applyRotationNx3(applyRotationNx3(dedoMenique,...
    sum(Pierna1(1:4,:))/4,Rtobillo),sum(piernaSuperior1(1:4,:))/4,Rrodilla), ...
    (torso(5,:)+torso(6,:))/2,Rcadera),sum(torso)/8,Rtorso);

figure;
%Tronco rotado
patch('faces',f,'vertices',torsoRotado,'FaceVertexCData',color,'FaceColor','flat');

%Pierna Superior rotada
patch('faces',f,'vertices',piernaSuperiorRotada1,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaSuperiorRotada2,'FaceVertexCData',color,'FaceColor','flat');

%Pierna Inferior rotada
patch('faces',f,'vertices',piernaInferiorRotada1,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaInferiorRotada2,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piernaInferiorRotada3,'FaceVertexCData',color,'FaceColor','flat');
    
%Pie rotado
patch('faces',f,'vertices',pieTalonRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',piePuntaRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoPulgarRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoIndiceRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoCorazonRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoAnularRotado,'FaceVertexCData',color,'FaceColor','flat');
patch('faces',f,'vertices',dedoMeniqueRotado,'FaceVertexCData',color,'FaceColor','flat');
view(3);
axis image;

end