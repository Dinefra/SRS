arduinoObj = serialport("COM3",115200); 
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
while(i<2000)
    readRPYData(arduinoObj);
    i=i+1;
end

plot(arduinoObj.UserData.Data(:,1),'g') % Sensor1
%hold on;
figure(2);
plot(arduinoObj.UserData.Data(:,2),'r') % Sensor2
%hold on;
figure(3);
plot(arduinoObj.UserData.Data(:,3),'b') % Sensor2
%hold on;