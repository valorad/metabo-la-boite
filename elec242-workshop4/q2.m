clc

% clean all
% close all

% H(w) = 1.25 * 0.8 / [(jw + 0.6) ^2 + 0.8 ^2]
% j = 1i in matlab

w = (-10:10);

H = 1 ./ ((1i .* w + 0.6) .^ 2 + 0.64);

Hmag = 1 ./ (1 + w .^2);

hmag = abs(H);

% Hphase = 

hphase = angle(H);

% subplot(2, 1, 1)
figure(1)

plot(hmag)
title("Magnitude of H(w)")
xlabel('w')
ylabel('|H(w)|')

figure(2)

plot(hphase)
title("Phase of H(w)")
xlabel('w')
ylabel('<H(w)')

