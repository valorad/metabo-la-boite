clear
clc
close all


sampFreq = 12000;
halfPFreq1 = 300;
halfPFreq2 = 336;

n = (0: 1/sampFreq: 1);

x = sin(100 .* n) + sin(2000 .* n) + sin(6000 .* n);


%%%%%%%%%%%%%%%%%%%%%
% Butterworth filters
%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% order: 4
order = 4;
[b, a] = butter(order/2, [halfPFreq1 halfPFreq2]/ (sampFreq/2), 'bandpass');
[H, freqRange] = freqz(b, a);

y = filter(b, a, x);

xFreq = fft(x);
yFreq = fft(y);

figure(1);

subplot(3, 1, 1)
plot(abs(xFreq))
title("Magnitude of Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("Magnitude of 4th order Butterworth filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Magnitude of Output signal")
xlabel("w")
ylabel("x(w)")

%%%%%%%%%% order: 8
order = 8;
[b, a] = butter(order/2, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
[H, freqRange] = freqz(b, a);

y = filter(b, a, x);
xFreq = fft(x);
yFreq = fft(y);

figure(2);

subplot(3, 1, 1)
plot(abs(xFreq))
title("Magnitude of Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("Magnitude of 8th order Butterworth filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Magnitude of Output signal")
xlabel("w")
ylabel("x(w)")

%%%%%%%%%%%%%%%%%%%%%
% Chebyshev filters
%%%%%%%%%%%%%%%%%%%%%
Rp = 1;

%%%%%%%%%% order: 4
order = 4;

[b, a] = cheby1(order/2, Rp, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
y = filter(b, a, x);

xFreq = fft(x);
yFreq = fft(y);

figure(3);

subplot(3, 1, 1)
plot(abs(xFreq))
title("Magnitude of Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("Magnitude of 4th order Chebyshev I filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Magnitude of Output signal")
xlabel("w")
ylabel("x(w)")

%%%%%%%%%% order: 8
order = 8;

[b, a] = cheby1(order/2, Rp, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
y = filter(b, a, x);

xFreq = fft(x);
yFreq = fft(y);

figure(4);

subplot(3, 1, 1)
plot(abs(xFreq))
title("Magnitude of Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("Magnitude of 8th order Chebyshev I filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Magnitude of Output signal")
xlabel("w")
ylabel("x(w)")

%%%%%%%%%%%%%%%%%%%%%
% Elliptic filters
%%%%%%%%%%%%%%%%%%%%%

Rp = 1;
Rs = 60;

%%%%%%%%%% order: 4
order = 4;

[b, a] = ellip(order/2, Rp, Rs, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
y = filter(b, a, x);

xFreq = fft(x);
yFreq = fft(y);

figure(5);

subplot(3, 1, 1)
plot(abs(xFreq))
title("Magnitude of Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("Magnitude of 4th order Elliptic filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Magnitude of Output signal")
xlabel("w")
ylabel("x(w)")

%%%%%%%%%% order: 8
order = 8;

[b, a] = ellip(order/2, Rp, Rs, [halfPFreq1 halfPFreq2]/ (sampFreq/2));
y = filter(b, a, x);

xFreq = fft(x);
yFreq = fft(y);

figure(6);

subplot(3, 1, 1)
plot(abs(xFreq))
title("Magnitude of Input signal")
xlabel("w")
ylabel("x(w)")

subplot(3, 1, 2)
plot(freqRange/pi, abs(H));
title("Magnitude of 8th order Elliptic filter")
xlabel("w")
ylabel("H(w)")

subplot(3, 1, 3)
plot(abs(yFreq))
title("Magnitude of Output signal")
xlabel("w")
ylabel("x(w)")
