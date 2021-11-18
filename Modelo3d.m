
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

pieDTalon=[0,0,0;30,0,0;30,15,0;0,15,0;0,0,10;30,0,10;30,15,10;0,15,10];
patch('Faces',F,'Vertices',pieDTalon,'FaceVertexCData',C,'FaceColor','flat');
axis equal

pieDPunta=[30,0,0;45,0,0;50,15,0;30,15,0;30,0,10;45,0,5;50,15,5;30,15,10];
patch('Faces',F,'Vertices',pieDPunta,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoGordo=[45,10,0;55,10,0;55,15,0;50,15,0;45,10,5;55,10,5;55,15,5;50,15,5];
patch('Faces',F,'Vertices',DeoGordo,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoIndice=[45,7,0;53,7,0;53,10,0;45,10,0;45,7,5;53,7,5;53,10,5;45,10,5];
patch('Faces',F,'Vertices',DeoIndice,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoCorazon=[45,4,0;52,4,0;52,7,0;45,7,0;45,4,5;52,4,5;52,7,5;45,7,5];
patch('Faces',F,'Vertices',DeoCorazon,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoAnular=[45,2,0;51,2,0;51,4,0;45,4,0;45,2,5;51,2,5;51,4,5;45,4,5];
patch('Faces',F,'Vertices',DeoAnular,'FaceVertexCData',C,'FaceColor','flat');
axis equal

DeoMenique=[45,0,0;48,0,0;48,2,0;45,2,0;45,0,5;48,0,5;48,2,5;45,2,5];
patch('Faces',F,'Vertices',DeoMenique,'FaceVertexCData',C,'FaceColor','flat');
axis equal