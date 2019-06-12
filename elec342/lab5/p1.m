clear
clc
close all

% n = (0:  1);
% 
% x = sin(100 .* n) + sin(2000 .* n) + sin(6000 .* n);

% Butterworth filters

order = 4;
sampFreq = 12000;
halfPFreq1 = 300;
halfPFreq2 = 336;

n = (0: 1/sampFreq: 1);

x = sin(100 .* n) + sin(2000 .* n) + sin(6000 .* n);

[b, a] = butter(order/2, [halfPFreq1 halfPFreq2]/ (sampFreq/2), 'bandpass');
[H, freqRange] = freqz(b, a);

% butter4th = designfilt('bandpassiir','FilterOrder',order, ...
%     'HalfPowerFrequency1',halfPFreq1,'HalfPowerFrequency2',halfPFreq2, ...
%     'SampleRate', sampFreq);

y = filter(b, a, x);

xFreq = fft(x);
yFreq = fft(y);

figure(1);

% subplot(5, 1, 1)
% plot(x)
% title("Input signal")
% xlabel("t")
% ylabel("x(t)")

subplot(3, 1, 1)
plot(abs(xFreq))
title("Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("4th order filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Output signal")
xlabel("w")
ylabel("x(w)")

% subplot(5, 1, 5)
% plot(y)
% title("Output signal") 
% xlabel("t")
% ylabel("y(t)")


order = 8;
[b, a] = butter(order/2, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
[H, freqRange] = freqz(b, a);
% % [A, B, C, D] = butter(order/2, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
% butter8th = designfilt('bandpassiir','FilterOrder',order, ...
%     'HalfPowerFrequency1',halfPFreq1,'HalfPowerFrequency2',halfPFreq2, ...
%     'SampleRate', sampFreq);
% 
y = filter(b, a, x);

figure(2);

subplot(3, 1, 1)
plot(abs(xFreq))
title("Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("8th order filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Output signal")
xlabel("w")
ylabel("x(w)")

% Chebyshev filters

% order = 4;
% [b, a] = butter(order/2, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
% 
% cheby4th = designfilt('bandpassiir','FilterOrder',order, ...
%     'HalfPowerFrequency1',halfPFreq1,'HalfPowerFrequency2',halfPFreq2, ...
%     'SampleRate', sampFreq);