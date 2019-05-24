% clear
% clc
% close all

n = (0: 9);
[~, lengthN] = size(n);

% since 0 <= n <= 9, unit step function has no effect.
h = (1 / 4) .^ n;

x = zeros(1, lengthN);
x(2: 4) = 1;

y = conv(x, h);

figure(2)
stem(y)
title("y[n] = x[n] conv h[n]")
xlabel('n')
ylabel('y')

% The difference between outputs of q2 and q1 is about the x-axis length
