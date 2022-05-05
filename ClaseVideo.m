% Clase proyecto iii

%1º Creamos Objeto VideoReader 
v = VideoReader('videoMarcadores.mp4');

%v es un objeto y podemos acceder a sus PROPIEDADES con nombreObjeto.nombrePropiedad
v = VideoReader('videoMarcadores.mp4','CurrentTime',1.2);


%2º Leer frames de video
%Lee el Frame asociado al “CurrentTime” del video file
vFrame = readFrame(v); %cada vez que llamamos se actualiza el valor de CurrentTime en el video file

%Lee el Frame i del video file v
vFrame = read(v,4); % te da el frame 4

%vframe es Image Data => por defecto RGB → XxYx3


%IMAGE PROCESSING TOOLBOX
% leer imagen
moon=imread('moon.tif'); 
%imtool(moon)  o imtool('moon.tif');




