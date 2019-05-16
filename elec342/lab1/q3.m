clear
clc
close all

format long

n = (0: 4096);
N = 1024;
x = cos( (2 * pi) / N * n );
stem(n, x);

if x(1)-x(1025) == 0.0
    disp('Yes x(1) x(1025) are equal')
else 
    disp(' x(1) x(1025) Not equal')
end

y = cos( (2 * 3.14) / N * n );

if y(1)-y(1025) == 0.0
    disp('Yes y(1), y(1025) are Equal')
else 
    disp('y(1), y(1025) Not equal')
end


z1 = cos((pi / 4) * n + pi/3);
z2 = cos((9 * pi/4) * n + pi/3);

if z1 - z2 <= 0.000000001
    disp('z1 z2 Are equal')
else 
    disp('z1 z2 Not equal')
end

% truncation effect, still have difference (0.000000000...1)
