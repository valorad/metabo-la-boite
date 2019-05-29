clear
clc
close all

n = (-10: 10);
x = zeros(1,length(n));
x(9: 13) = 1;

xFreqFFT = fft(x);

xFreqInvFFT = ifft(xFreqFFT);

figure(1)
subplot(2, 1, 1)
stem(n, x)
title("Original X[n]")
xlabel("n")
ylabel("x[n]")

subplot(2, 1, 2)
stem(n, abs(xFreqInvFFT))
title("FFT then IFFT version of X[n]")
xlabel("n")
ylabel("x[n]")