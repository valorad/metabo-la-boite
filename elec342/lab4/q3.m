clear
clc
close all

[disData, disSRate] = audioread("musics/Distorted.wav");
[data0, srate0] = audioread("musics/Original.wav");

dataLength = length(data0);

mse_Inp_Dis = sum( (data0 - disData) .^ 2 ) / dataLength;

disp("MSE between Original and Input is " + mse_Inp_Dis);


hDistorted = fft(disData);
hOriginal = fft(data0);

% hChannel =  ./ hOriginal;
% hEqualizer = 1 ./ hChannel;
% can be simplified as
hEqualizer = hOriginal ./ hDistorted;

hProc = hDistorted .* hEqualizer;
dataProc = ifft(hProc);

% write the audio file

try
  audiowrite("musics/Recovered.wav", dataProc, srate0)
catch e
  warning("Failed to write the audio file: " + getReport(e));
end

mse_inp_Rec = sum( (data0 - dataProc) .^ 2 ) / dataLength;

disp("MSE between the Before and the After is " + mse_inp_Rec);



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

