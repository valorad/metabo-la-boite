clear
clc
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%
% part a)
%%%%%%%%%%%%%%%%%%%%%%%%%%
% x[n] = e ^ (-2|n|) * sin( (2*pi/36)n) , 0 <= n <= 10

n1 = (0: 10);
x1_n = exp( (-2 .* abs(n1)) .* sin( 2 * pi .* n1 / 36 ) );

% get the mirror image
% n1_xflip = (-1) .* fliplr(n1);
x1_minusN = fliplr(x1_n);
% x1_minusN = exp( (-2 .* abs(n1_xflip)) .* sin( 2 * pi .* n1_xflip / 36 ) );
% fill up 0s for both in order to plot later
% n1_xflip = advance(n1_xflip, 10);

% fill up 0s for both in order to plot later
n1 = delay(n1, 10);
n1_flip = (-1) .* fliplr(n1);
x1_n = delay(x1_n, 10);
x1_minusN = advance(x1_minusN, 10);

% get the even and odd parts
x1_n_even = (x1_n + x1_minusN) / 2;
x1_n_odd = (x1_n - x1_minusN) / 2;

% plot them out
figure(1)
subplot(2, 2, 1)
plot(n1_flip, x1_minusN)

title("x[-n]")
xlabel('n')
ylabel('x')

subplot(2, 2, 2)
plot(n1, x1_n)

title("x[n]")
xlabel('n')
ylabel('x')

subplot(2, 2, 3)
plot((-10: 10), x1_n_even)

title("even part")
xlabel('n')
ylabel('x')

subplot(2, 2, 4)
plot((-10: 10), x1_n_odd)

title("odd part")
xlabel('n')
ylabel('x')

%%%%%%%%%%%%%%%%%%%%%%%%%%
% part b)
%%%%%%%%%%%%%%%%%%%%%%%%%%
% x[n] = (-1) ^ (n-1)
n2 = (-5: 5);
x2_n = (-1) .^ (n2 - 1);

% get the mirror image
n2_xflip = (-1) .* fliplr(n2);
x2_minusN = fliplr(x2_n);

% fill up 0s for both in order to plot later
% n2 = delay(n1, 10);
n2_flip = (-1) .* fliplr(n2);
% x2_n = delay(x2_n, 10);
% x2_minusN = advance(x2_minusN, 10);

% get the even and odd parts
x2_n_even = (x2_n + x2_minusN) / 2;
x2_n_odd = (x2_n - x2_minusN) / 2;

% plot them out
figure(2)
subplot(2, 2, 1)
plot(n2_flip, x2_minusN)

title("x[-n]")
xlabel('n')
ylabel('x')

subplot(2, 2, 2)
plot(n2, x2_n)

title("x[n]")
xlabel('n')
ylabel('x')

subplot(2, 2, 3)
plot((-5: 5), x2_n_even)

title("even part")
xlabel('n')
ylabel('x')

subplot(2, 2, 4)
plot((-5: 5), x2_n_odd)

title("odd part")
xlabel('n')
ylabel('x')

%%%%%%%%%%%%%%%%%%%%%%%%%%
% part c)
%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)

% T. Obuchowicz
%Fri Apr 27 16:03:27 EDT 2012

clear
n = [1 : 20];
x1 = sin((2*pi/40) * n) .* cos((2*pi/40) * n);

for index = 1 : 20
    % Note: In MATLAB, no need to pre-allocate the array,
    % unlike C++ and other high-level programming languages.
    x2(index) = sin((2*pi/40) * index) * cos((2*pi/40) * index);
end

subplot(2,1,1)
stem(n, x1)
title('Elegant method making full use of MATLABs array capabilities')
xlabel('n')
ylabel('x[n]')

subplot(2,1,2)
stem(n, x2)
title('Gets the job done, but it is a lot of work and we are not in the MATLAB mindset')
xlabel('n')
ylabel('x[n]')