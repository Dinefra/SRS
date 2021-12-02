F=[1,2,3,4;5,6,7,8;5,6,2,1;8,7,3,4;6,7,3,2;5,8,4,1];
C=[1,0,0;0,1,0;0,0,1;1,1,0;1,0,1;0,1,1];

pieDTalon=[0,0,0;40,0,0;40,15,0;0,15,0;0,0,10;40,0,10;40,15,10;0,15,10];
patch('Faces',F,'Vertices',pieDTalon,'FaceVertexCData',C,'FaceColor','flat');
axis equal

Pierna1=[0,0,10;15,0,10;15,15,10;0,15,10;0,0,70;15,0,70;15,15,70;0,15,70];
patch('Faces',F,'Vertices',Pierna1,'FaceVertexCData',C,'FaceColor','flat');
axis equal

PiernaSuperior1=[0,0,70;15,0,70;15,15,70;0,15,70;-10,-5,120;15,-5,120;15,20,120;-10,20,120];
patch('Faces',F,'Vertices',PiernaSuperior1,'FaceVertexCData',C,'FaceColor','flat');
axis equal

Cadera=[-10,-5,120;15,-5,120;15,40,120;-10,40,120;-10,-5,140;15,-5,140;15,40,140;-10,40,140];
patch('Faces',F,'Vertices',Cadera,'FaceVertexCData',C,'FaceColor','flat');
axis equal
view(3);
