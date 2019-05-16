clear
clc
close all

rvec1 = zeros(1, 10);
rvec1(9:10) = 1;

rvec2 = ones(1, 10);
rvec2(1:5) = 0;

x1 = (-5: 1: 4);
x2 = (0: 1: 9);

subplot(2,2,1)
stem(x1, rvec1);

subplot(2,2,2)
stem(x2, rvec1);


subplot(2,2,3)
stem(x1, rvec2);

subplot(2,2,4)
stem(x2, rvec2);
