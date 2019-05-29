clear
clc
close all


n = (-10: 10);
x = zeros(1,length(n));
x(9: 13) = 1;

wStep = 2 * pi / (length(n) - 1);

w = (-pi: wStep: pi); % to make sure the same number of samples

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

figure(1)
subplot(2, 1, 1)
stem(n, x)
title("x[n]")
xlabel("n")
ylabel("x[n]")

subplot(2, 1, 2);
plot(w, abs(xFreq))
title("magnitude of X(w)")
xlabel("w")
ylabel("x[w]")