clear
clc
close all

n = (0: 9);
[~, lengthN] = size(n);

x = zeros(1, lengthN);

x(2: 4) = 1;

y = zeros(1, lengthN);
y(1) = x(1);
for i = 2: lengthN
  y(i) = x(i) + (1 / 4) * y(i - 1);
end

figure(1)
stem(y)
title("y[n]=x[n] + (1/4) * y[n-1])")
xlabel('n')
ylabel('y')