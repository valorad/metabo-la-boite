clear
clc
close all

H = pre2_I();

sosMatrix = H.coeffs().SOSMatrix;
[b,a] = sos2tf(sosMatrix);

% b: numerator, a: denominator

br = round(b);
ar = round(a);

% original pole-zero plot

figure(1)
pzmap(tf(b,a))
title("Original")

% rounded pole-zero plot

figure(2)
pzmap(tf(br,ar))
title("Rounded")