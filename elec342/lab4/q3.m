clear
clc
close all

[disData, disSRate] = audioread("musics/Distorted.wav");
[data0, srate0] = audioread("musics/Original.wav");

dataLength = length(data0);

hDistorted = fft(disData);
hOriginal = fft(data0);

hChannel = hDistorted ./ hOriginal;
hEqualizer = 1 ./ hChannel;

hProc = hDistorted .* hEqualizer;
dataProc = ifft(hProc);

mse = sum( (data0 - dataProc) .^ 2 ) / dataLength;


figure(1);

subplot(3, 1, 1)
plot(data0)
title("Original Music")
xlabel("t")
ylabel("x(t)")

subplot(3, 1, 2)
plot(disData)
title("Distorted Music")
xlabel("t")
ylabel("x(t)")

subplot(3, 1, 3)
plot(dataProc)
title("Processed Music") 
xlabel("t")
ylabel("x(t)")

