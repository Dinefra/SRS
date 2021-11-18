
%V1=[0,0,0];
%V2=[10,0,0];
%V3=[10,10,0];
%V4=[0,10,0];
%V5=[0,0,10];
%V6=[10,0,10];
%V7=[10,10,10];
%V8=[0,10,10];

%V=[V1;V2;V3;V4;V5;V6;V7;V8];
F=[1,2,3,4;5,6,7,8;5,6,2,1;8,7,3,4;6,7,3,2;5,8,4,1];
C=[1,0,0;0,1,0;0,0,1;1,1,0;1,0,1;0,1,1];
%patch('Faces',F,'Vertices',V,'FaceVertexCData',C,'FaceColor','flat');

pieDTalon=[0,0,0;20,0,0;20,15,0;0,15,0;0,0,10;20,0,10;20,15,10;0,15,10];
patch('Faces',F,'Vertices',pieDTalon,'FaceVertexCData',C,'FaceColor','flat');
axis equal

pieDPunta=[20,0,0;35,0,0;40,15,0;20,15,0;20,0,10;35,0,5;40,15,5;20,15,10];
patch('Faces',F,'Vertices',pieDPunta,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoGordo=[35,10,0;45,10,0;45,15,0;40,15,0;35,10,5;45,10,5;45,15,5;40,15,5];
patch('Faces',F,'Vertices',DeoGordo,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoIndice=[35,7,0;43,7,0;43,10,0;35,10,0;35,7,5;43,7,5;43,10,5;35,10,5];
patch('Faces',F,'Vertices',DeoIndice,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoCorazon=[35,4,0;42,4,0;42,7,0;35,7,0;35,4,5;42,4,5;42,7,5;35,7,5];
patch('Faces',F,'Vertices',DeoCorazon,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoAnular=[35,2,0;41,2,0;41,4,0;35,4,0;35,2,5;41,2,5;41,4,5;35,4,5];
patch('Faces',F,'Vertices',DeoAnular,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoMenique=[35,0,0;38,0,0;38,2,0;35,2,0;35,0,5;38,0,5;38,2,5;35,2,5];
patch('Faces',F,'Vertices',DeoMenique,'FaceVertexCData',C,'FaceColor','flat');
axis equal

Pierna1=[5,0,10;15,0,10;15,15,10;5,15,10;5,0,70;15,0,70;15,15,70;5,15,70];
patch('Faces',F,'Vertices',Pierna1,'FaceVertexCData',C,'FaceColor','flat');
axis equal


Pierna2=[0,0,10;5,0,10;5,15,10;0,15,10;-5,0,45;5,0,45;5,15,45;-5,15,45];
patch('Faces',F,'Vertices',Pierna2,'FaceVertexCData',C,'FaceColor','flat');
axis equal

Pierna3=[-5,0,45;5,0,45;5,15,45;-5,15,45;0,0,70;5,0,70;5,15,70;0,15,70];
patch('Faces',F,'Vertices',Pierna3,'FaceVertexCData',C,'FaceColor','flat');
axis equal

PiernaSuperior1=[0,0,70;15,0,70;15,15,70;0,15,70;-10,-5,120;15,-5,120;15,20,120;-10,20,120];
patch('Faces',F,'Vertices',PiernaSuperior1,'FaceVertexCData',C,'FaceColor','flat');
axis equal

PiernaSuperior2=[-10,-5,120;15,-5,120;15,20,120;-10,20,120;-10,-5,140;15,-5,140;15,20,140;-10,20,140];
patch('Faces',F,'Vertices',PiernaSuperior2,'FaceVertexCData',C,'FaceColor','flat');
axis equal

%Parte de cadera no me acaba de convencer
Cadera=[-10,-5,140;15,-5,140;15,40,140;-10,40,140;-10,-5,160;15,-5,160;15,40,160;-10,40,160];
patch('Faces',F,'Vertices',Cadera,'FaceVertexCData',C,'FaceColor','flat');
axis equal