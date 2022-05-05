% Para cargar el vídeo en un objeto
v = VideoReader("videoMarcadores.mp4");

% Para conocer sus propiedades, por ejemplo, la frecuencia de adquisición
% del vídeo (FPS)
frecuencia_adquisicion = v.FrameRate;

% Para saber el tiempo entre fotogramas
tiempo_fotogramas = 1/frecuencia_adquisicion;

% Para cargar el frame asociado al "CurrentTime" del video en la 
% variable deseada
vFrame1 = readFrame(v); % Cada vez que llamamos a esta función, se 
                        % actualiza el valor del CurrenTime del vídeo

% Para cargar el siguiente frame en otra variable
vFrame2 = readFrame(v); % Formato: filas (alto) x columnas (ancho)

% Para leer el frame indicado (en este caso el 4) del video v
vFrame3 = read(v,4);

% Para avanzar al frame asociado al "CurrentTime" especificado
v.CurrentTime = 0.678;

% Para leer los datos del vídeo a partir del segundo especificado (1.2), es
% decir, el CurrentTime será el especificado
v2 = VideoReader("bajada.mp4",'CurrentTime',1.2);

% Para visualizar frames previamente leídos 
imshow(vFrame1);
figure, imshow(vFrame2);

imtool(vFrame1); % Dentro de imtoll con Pixel Region se puede visualizar 
                 % los valores RGB de cada píxel

% Para generar una imagen binaria después de exportar la función con los 
% valores RGB de la región delimitada (círculo verde - cadera) en 
% ColorTresholder
[BW_C_RGB,maskedIMC] = createMaskC_RGB(vFrame1);
imshow(BW_C_RGB); 

% Para eliminar las regiones de la imagen binaria de la cadera que tengan 
% menos de 472 píxeles (tamaño de la región seleccionada)
BW_C2 = bwareaopen(BW_C_RGB,472);
imshow(BW_C2);

% Para generar una imagen binaria de la región delimitada HSV (círculo
% verde - cadera) en ColorTresholder
[BW_C_HSV,maskedIMC_HSV] = createMaskC_HSV(vFrame1);
imshow(BW_C_HSV); 

% Para compararlo con otro frame (segundo 2)
v.CurrentTime = 2;
vFrame3 = readFrame(v);
imshow(vFrame1);
figure, imshow(vFrame3);

% Para generar una imagen binaria de la región delimitada HSV (círculo
% verde - cadera) en ColorTresholder en el segundo 2 (vFrame3)
[BW_C_HSV_2,maskedIMC_HSV_2] = createMaskC_HSV(vFrame3);
imshow(BW_C_HSV_2); 

imread(vFrame1);