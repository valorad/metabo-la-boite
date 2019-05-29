clear
clc
close all

n = (-10: 10);
x = zeros(1,length(n));
x(9: 13) = 1;

wStep = 2 * pi / 21;
% wStep = 2 * pi / (length(n) - 1);
w = (0: wStep: 40 * pi/21); % The same freq range of fft

xFreq = zeros(1, length(w)); % initiate xFreq array

freqIndex = 1;
for indexW = w
    s = 0; % sum
    for indexN = n
        s = s + x(indexN + 11) * exp(-1j * indexW * indexN);
    end
    xFreq(freqIndex) = s;
    freqIndex = freqIndex + 1;
end

xFreqFFT = fft(x);

figure(1)

subplot(2, 1, 1)
plot(w, abs(xFreq))
title("Manual X(w)")
xlabel("w")
ylabel("x[w]")

subplot(2, 1, 2)
plot(w, abs(xFreqFFT))
title("FFT X(w)")
xlabel("w")
ylabel("x[w]")

