function ypr = eulerAngles(R)
ypr(1) = atan2d(R(2,1),R(1,1)); % Arctang de 4 cuadrantes en º
ypr(2) = -asind(R(3,1)); % Arcsen en º
ypr(3) = atan2d(R(3,2),R(3,3)); % Arctang de 4 cuadrantes en º
end