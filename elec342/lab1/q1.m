clear
clc
close all

sLength = (1: 1: 10);

sphereVolume = (4/3) * pi * sLength .^ 3;
sphereSurface = sLength .^ 3;

squareVolume = 4 * pi * sLength .^ 2;
squareSurface = 6 * sLength .^ 2;


subplot(1,2,1)
plot(sphereVolume);
hold on
plot(sphereSurface);

title("Sphere Volume and Surface")
xlabel('sLength')
ylabel('value')


subplot(1,2,2)
plot(squareVolume);
hold on
plot(squareSurface);
title("Square Volume and Surface")
xlabel('sLength')
ylabel('value')

