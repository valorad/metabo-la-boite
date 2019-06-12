clear
clc
close all


% a) Contain a 200 Hz tone for 0 < t < 3.
% b) Contain a 330 Hz tone for 1 < t < 3.
% c) Contain a 480 Hz tone for 2 < t < 3.
% Note: The signal should have a sampling frequency equal to 8192 Hz.

sampFreq = 8192;
n1 = (0: 1/sampFreq: 3);

n2 = (1: 1/sampFreq: 3);
n2 = horzcat(zeros(1, length(n1) - length(n2)), n2);

n3 = (2: 1/sampFreq: 3);
n3 = horzcat(zeros(1, length(n1) - length(n3)), (2: 1/sampFreq: 3));

x = sin(400 * pi * n1) + sin(660 * pi * n2) + sin(960 * pi * n3);

% Part B: Design a filter to remove the 330 Hz component from the main signal.
% a) Plot the designed response (magnitude and phase) of the filter.
% b) Filter the main signal with the designed filter.
% c) Compare signals and spectra (in time domain and in frequency domain) before and after
% filtering, and listen to the filtered signal using soundsc command.

order = 8;
halfPFreq1 = 324;
halfPFreq2 = 336;

[b, a] = butter(order/2, [halfPFreq1 halfPFreq2]/ (sampFreq/2), 'stop');
[H, freqRange] = freqz(b, a);

y = filter(b, a, x);

xFreq = fft(x);
yFreq = fft(y);

figure(1);

subplot(5, 1, 1)
plot(freqRange/pi, abs(H));
title("8th order Butterworth filter")
xlabel("w")
ylabel("H(w)")

subplot(5, 1, 2)
plot(abs(xFreq))
title("Magnitude of Input signal")
xlabel("w")
ylabel("x(w)")

subplot(5, 1, 3)
plot(abs(yFreq))
title("Magnitude of Output signal")
xlabel("w")
ylabel("x(w)")

subplot(5, 1, 4)
plot(angle(xFreq))
title("Angle of Input signal")
xlabel("rad")
ylabel("<x")

subplot(5, 1, 5)
plot(angle(yFreq))
title("Angle of Output signal")
xlabel("rad")
ylabel("<y")


figure(2);

subplot(2, 1, 1)
plot(x)
title("Input signal")
xlabel("t")
ylabel("x(t)")

subplot(2, 1, 2)
plot(y)
title("Output signal")
xlabel("t")
ylabel("y(t)")



