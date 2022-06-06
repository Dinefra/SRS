% codigo video 
clc;  clear all; close all; 
% practica vision artificial --> 9 de mayo

v = VideoReader('videoMarcadores.mp4');

% numero de frames ->
f = readFrame(v); % v está está en el instante x
% cada vez que lo ejecutamos el currentTime va avanzando


%% COLOR NARANJA 
% seleccionamos la zona de color con color thresholder
% createMaskN -> naranja
% 2 funciones, la propia mascara en blanca y negro y otra en color

[BN,maskedNImage] = createMaskN(f);
figure,imshow(maskedNImage); % imagen color naranja 
figure,imshow(BN); % imagen blanco y negro

%help bwareaopen;
%bwareaopen Remove small objects from binary image
% p = numero de pixeles donde corto el umbral;
% para saber p -> imagen region analyzer

% avanzamos al video al egundo 1.5
v.CurrentTime = 1;
f2 = readFrame (v);  %leemos el frame 2
 
v.CurrentTime = 2.00;
f3 = readFrame (v);
 
v.CurrentTime = 3.2;
f4 = readFrame (v);

figure, subplot(221), imshow(f);
subplot(222), imshow(f2);
subplot(223), imshow(f3);
subplot(224), imshow(f4);
 
[BN2,m2] = createMaskN(f2);
[BN3,m3] = createMaskN(f3);
[BN4,m4] = createMaskN(f4);
 
% comprobar
BN_ao = bwareaopen(BN,355); % 355

 
se = strel('disk',50);
BN_cl = imclose(BN_ao,se); % imagen que se puede pintar para poner en la interfaz
figure,imshow(BN_cl);

%% COLOR VERDE 
%Frame verde -> 382

[BV,maskedVImage] = createMaskV(f);
figure,imshow(maskedVImage); % imagen color Verde
figure,imshow(BV); % imagen blanco y negro

%help bwareaopen;
%bwareaopen Remove small objects from binary image
%p = numero de pixeles donde corto el umbral para saber p -> imagen region analyzer
  

% avanzamos al video al egundo 1.5
v.CurrentTime = 1;
f2 = readFrame (v);  %leemos el frame 2
 
v.CurrentTime = 2.00;
f3 = readFrame (v);
 
v.CurrentTime = 3.2;
f4 = readFrame (v);

figure, subplot(221), imshow(f);
subplot(222), imshow(f2);
subplot(223), imshow(f3);
subplot(224), imshow(f4);
  
[BV2,m5] = createMaskV(f2);
[BV3,m6] = createMaskV(f3);
[BV4,m7] = createMaskV(f4);
 
%comprobado
BV_ao = bwareaopen(BV,398); 

se = strel('disk',50);

BV_cl = imclose(BV_ao,se); % imagen que se puede pintar para poner en la interfaz
figure,imshow(BV_cl);

%% COLOR AMARILLO  

[BA,maskedAImage] = createMaskA(f);
figure,imshow(maskedAImage); % imagen color AMARILLO
figure,imshow(BA); % imagen blanco y negro

%help bwareaopen;
%bwareaopen Remove small objects from binary image
% p = numero de pixeles donde corto el umbral para saber p -> imagen region analyzer
% avanzamos al video al egundo 1.5
v.CurrentTime = 1;
f2 = readFrame (v);  %leemos el frame 2
 
v.CurrentTime = 2.00;
f3 = readFrame (v);
 
v.CurrentTime = 3.2;
f4 = readFrame (v);

figure, subplot(221), imshow(f);
subplot(222), imshow(f2);
subplot(223), imshow(f3);
subplot(224), imshow(f4);

[BA2,m8] = createMaskA(f2);
[BA3,m9] = createMaskA(f3);
[BA4,m10] = createMaskA(f4);
 
%comprobado
BA_ao = bwareaopen(BA,420);
se = strel('disk',50);
 
BA_cl = imclose(BA_ao,se); % imagen que se puede pintar para poner en la interfaz
figure,imshow(BA_cl);
