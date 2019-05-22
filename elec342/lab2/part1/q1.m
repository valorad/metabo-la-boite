clear
clc
close all

n = (0: 9);

% part a)

x_n = n;

y_n = n .^ 2;

E_x = sum(x_n .^ 2);

E_y = sum(y_n .^ 2);

disp("Energy of x[n] and y[n] are respectively " + E_x + " , " + E_y)

% part b)
% x[n] = sin( (2pi)/10 * n)
z_n = sin( 2 .* pi .* n ./ 10);

E_z = sum(z_n .^ 2);

disp("Energy of z[n] is " + E_z)