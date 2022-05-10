%% Gráficas ideales 
% Tobillo subida
ts_ideal = grafica_tobillo_s_ideal();
% Rodilla subida
rs_ideal = grafica_rodilla_s_ideal();
% Cadera subida
cs_ideal = grafica_cadera_s_ideal();

% Tobillo bajada
tb_ideal = grafica_tobillo_b_ideal();
% Rodilla bajada
rb_ideal = grafica_rodilla_b_ideal();
% Cadera bajada
cb_ideal = grafica_cadera_b_ideal();

%% Gráficas paciente
% Tobillo subida
ts = aplicarFiltroCheby2(grafica_tobillo_s(),2,0.5);
% Rodilla subida
rs = aplicarFiltroCheby2(grafica_rodilla_s(),2,0.5);
% Cadera subida
cs = aplicarFiltroCheby2(grafica_cadera_s(),2,0.5);

% Tobillo bajada
tb = aplicarFiltroCheby2(grafica_tobillo_b(),2,0.5);
% Rodilla bajada
rb = aplicarFiltroCheby2(grafica_rodilla_b(),2,0.5);
% Cadera bajada
cb = aplicarFiltroCheby2(grafica_cadera_b(),2,0.5);


%% Avatar
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

%--------------------------------------------------------------------------
%PIERNA INFERIOR
Pierna1=[5,0,10;15,0,10;15,15,10;5,15,10;5,0,70;15,0,70;15,15,70;5,15,70];
Pierna2=[0,0,10;5,0,10;5,15,10;0,15,10;-5,0,45;5,0,45;5,15,45;-5,15,45];
Pierna3=[-5,0,45;5,0,45;5,15,45;-5,15,45;0,0,70;5,0,70;5,15,70;0,15,70];

%--------------------------------------------------------------------------
%PIERNA SUPERIOR
piernaSuperior1=[0,0,70;15,0,70;15,15,70;0,15,70;-10,-5,120;15,-5,120;15,20,120;-10,20,120];
piernaSuperior2=[-10,-5,120;15,-5,120;15,20,120;-10,20,120;-10,-5,140;15,-5,140;15,20,140;-10,20,140];

% Definicion de partes del cuerpo (lado izquierdo)
torso1 = [-10,-5,140;15,-5,140;15,55,140;-10,55,140;-10,-10,250;15,-10,250;15,60,250;-10,60,250];
torso= [-10,-5,140;2,-5,140;2,55,140;-10,55,140;-10,-5,150;2,-5,150;2,55,150;-10,55,150];

        Rtorso = rotationMatrix(0,0,0);
        Rcadera = rotationMatrix(0,0,0);
        Rrodilla = rotationMatrix(0,0,0);
        Rtobillo = rotationMatrix(0,0,0);


% Angulos de cadera en subida
y_cs = [-8,-9,-11,-12,-10,-9,-6,-5,-4,-4,-3,-0,-15,-12,-15,-10,-3,-6,-0,-0,-28];

% Angulos de rodilla en subida
y_rs = [6,10,20,26,28,27,26,27,35,45,55,55,75,87,93,87,65,50,30,10,6];

% Angulos de tobillo en subida
y_ts = [-20,-10,5,7,10,12,13,15,19,22,24,20,10,2,1,-2,-10,-15,-20,-26,-20];

% Angulos de cadera en bajada
y_cb = [46,40,35,30,25,15,10,5,2,-2,-4,-6,-5,0,10,23,34,45,47,49,46];

% Angulos de rodilla en bajada
y_rb = [60,58,56,53,45,35,26,22,12,8,7,7,10,23,45,65,85,94,90,75,60];

% Angulos de tobillo en bajada
y_tb = [11,10,13,14,11,8,7,6,7,9,10,14,19,25,29,31,29,25,20,15,11];