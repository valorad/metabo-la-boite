% Please run the simulations before running this script
clc
close all

originalData = squeeze(originalSoundwave{1}.Values.Data);
originalDataFreq = fft(originalData);

lowkeyData = squeeze(lowkeySoundwave{1}.Values.Data);
lowkeyDataFreq = fft(lowkeyData);

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
plot(lowkeyData);
title("Down Sample")
xlabel("t")
ylabel("x(t)")

subplot(2, 2, 4);
plot(abs(lowkeyDataFreq));
title("Down Sample in Frequency (Mag.)")
xlabel("w")
ylabel("x(w)")