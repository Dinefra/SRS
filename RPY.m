% Inicia comunicación por puerto serie indicando el puerto y la 
% velocidad de comunicación
arduinoObj = serialport("COM3",115200); 
% Configura el objeto de Arduino (arduinoObj) como terminal de escritura y 
% lectura
configureTerminator(arduinoObj,"CR/LF");
%flush(arduinoObj);
% Crea un struct donde se almacenan los datos del usuario y los va contando
arduinoObj.UserData = struct("Data",[],"Count",1);
% Escribe un caracter en el puerto serie
write(arduinoObj,"s","string");
% Lee la línea de datos que procede del puerto serie
readline(arduinoObj);
for i=1:10
    readline(arduinoObj);
end
write(arduinoObj,"s","string");
% Vacía el puerto serie
flush(arduinoObj);
readline(arduinoObj);
readline(arduinoObj);
readline(arduinoObj);
arduinoObj.UserData.Data = [];
% Para leer el puerto serie el número de veces deseado, llamando a la
% función RPYData
i=1;
while(i<1000)
    readRPYData(arduinoObj);
    i=i+1;
end
% Imprime los datos que se van leyendo
plot(arduinoObj.UserData.Data(:,1),'g'); % Roll
% hold on;
% plot(arduinoObj.USerData.Data(:,2),'r'); % Pitch
% hold on;
% plot(arduinoObj.USerData.Data(:,3),'g'); % Yaw