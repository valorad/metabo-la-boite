% Please run the simulations before running this script
clc
close all

originalData = squeeze(originalSoundwave{1}.Values.Data);
originalDataFreq = fft(originalData);

highkeyData = squeeze(highkeySoundwave{1}.Values.Data);
highkeyDataFreq = fft(highkeyData);

figure(1);

subplot(2, 2, 1);
plot(originalData);
title("Original Sound")
xlabel("t")
ylabel("x(t)")

subplot(2, 2, 2);
plot(abs(originalDataFreq));
title("Original Sound in Frequency (Mag.)")
xlabel("w")
ylabel("x(w)")

subplot(2, 2, 3);
plot(highkeyData);
title("Up Sample")
xlabel("t")
ylabel("x(t)")

subplot(2, 2, 4);
plot(abs(highkeyDataFreq));
title("Up Sample in Frequency (Mag.)")
xlabel("w")
ylabel("x(w)")