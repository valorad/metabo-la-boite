clear
clc
close all

% x[n] = e ^ (-2|n|) * sin( (2*pi/36)n) , 0 <= n <= 10

n1 = (0: 10);
x1_n = exp( (-2 .* abs(n1)) .* sin( 2 * pi .* n1 / 36 ) );

% get the mirror image
n1_xflip = (-1) .* fliplr(n1);
x1_minusN = fliplr(x1_n);

% get the even and odd parts
x1_n_even = (x1_n + x1_minusN) / 2;
x1_n_odd = (x1_n - x1_minusN) / 2;

% plot them out
figure(1)
subplot(2, 2, 1)
plot(n1_xflip, x1_minusN)

title("x[-n]")
xlabel('n')
ylabel('x')

subplot(2, 2, 2)
plot(n1, x1_n)

title("x[n]")
xlabel('n')
ylabel('x')



% x[n] = (-1) ^ (n-1)
n2 = (-5: 5);
x2 = (-1) .^ (n2 - 1);

figure(2)
subplot(2, 2, 1)
plot(x2)

