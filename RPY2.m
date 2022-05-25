arduinoObj = serialport("COM4",115200); 
configureTerminator(arduinoObj,"CR/LF");
% Crea un struct donde se almacenan los datos del usuario y los va contando
arduinoObj.UserData = struct("Data",[],"Count",1);

readline(arduinoObj);
for i=1:20
    readline(arduinoObj);
end
write(arduinoObj,"s","string");
flush(arduinoObj);
readline(arduinoObj);
readline(arduinoObj);
% readline(arduinoObj);
arduinoObj.UserData.Data = [];
i=1;
fprintf('Inicio de medición');
while(i<200)
    readRPYData(arduinoObj);
    i=i+1;
end

sensor_cadera = arduinoObj.UserData.Data(:,1);
sensor_rodilla = arduinoObj.UserData.Data(:,2);
sensor_tobillo = arduinoObj.UserData.Data(:,3);

% plot(sensor_cadera,'r') % Sensor1 - Cadera
% % hold on;
% figure(2);
% plot(sensor_rodilla,'g') % Sensor2 - Rodilla
% % hold on;
% figure(3);
% plot(sensor_tobillo,'b') % Sensor3 - Tobillo
% % hold on;