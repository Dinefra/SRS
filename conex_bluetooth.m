bluetoothlist;
% Para saber cómo se llama el dispositivo que queremos conectar y en qué 
% canal está. Sólo se hace la primera vez para configurarlo. Para ello 
% previamente se debe haber vinculado el dispositivo al ordenador con
% Bluetooth.

device = bluetooth("ESP32Test", 1); 
% Generamos una variable llamada device que contiene todas las propiedades 
% de la placa especificada conectada por Bluetooth al canal indicado.

writeline(device,"hello"); 
% Para escribir lo especificado en Arduino IDE

readline(device);
% Para leer lo especificado en Arduino IDE, es decir, datos recogidos por
% los sensores