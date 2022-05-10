function readRPYData(src, ~)

% Lee datos del puerto serie
data = readline(src); % Lee una línea del src, que es la fuente (source)
data = split(data); % Separa los datos de la línea que se ha leído cuando 
                    % encuentra espacios en blanco
data = str2double(data); % Convierte los datos leídos de string a double

% Añade una línea nueva al struct y en ella guarda los datos de la
% última línea leída. Después transpone esos datos para que se almacenen en
% columnas y no en filas
%src.UserData.Data(size(src.UserData.Data,1)+1,:) = data';
if(size(data)==[3 1])
src.UserData.Data(size(src.UserData.Data,1)+1,:) = data';
fprintf('Bien\n');
end

% Actualiza el valor del contador del puerto serie
src.UserData.Count = src.UserData.Count + 1;
% write(src,"s","string");

% Si el contador llega a 1001 datos recogidos de Arduino, apaga los
% callbacks y muestra los datos
%if src.UserData.Count > 2001
if src.UserData.Count < 2001
    configureCallback(src, "off");
    %plot(src.UserData.Data(2:end),'g');
    figure(1);
    plot(src.UserData.Data(:,1),'g');
    figure(2);
    plot(src.UserData.Data(:,2),'r');
    figure(3);
    plot(src.UserData.Data(:,3),'b');
end

end