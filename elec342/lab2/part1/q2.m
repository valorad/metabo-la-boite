clear
clc
close all

% part a)
% y[n] = 2 * x[n]
% x1[n] = sin( (2*pi /10 ) * n )
% x2[n] = cos( (2*pi /10 ) * n )
% 0 <= n <= 10

% To verify linearity, for simplicity, we select a = 10 and b = 5
a = 10;
b = 5;

n = (0: 10);

x1_a = a * sin(2 * pi .* n / 10);
x2_b = b * cos(2 * pi .* n / 10);

y1_a = 2 .* x1_a;
y2_b = 2 .* x2_b;

figure(1)
subplot(3, 1, 1);
plot(x1_a)
hold on
plot(y1_a)

subplot(3, 1, 2);
plot(x2_b)
hold on
plot(y2_b)

x3 = x1_a + x2_b;
y3 = y1_a + y2_b;

subplot(3, 1, 3);
plot(x3)
hold on
plot(y3)

if y3 == (x1_a + x2_b) * 2
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% part b)
% y_a[n] = x^2[n]
% y_b[n] = 2x[n] + 5δ[ n ]

x1 = (0: 1);
x2 = 2* x1;
y_a = x1 .^ 2;

% verify Linearity

if (a * x1 .^ 2 + b * x2 .^ 2) == ((x1 * a + x2 * b) .^ 2)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end


% verify tI

% right-shift k0 units
k0 = 5;
% then shifted version of x1 is
x1_s = horzcat(zeros(1, k0), x1);

y_as = x1_s .^ 2;

if y_as == horzcat(zeros(1, k0), y_a)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end

figure(2)
subplot(2, 2, 1)
stem(x1)
subplot(2, 2, 2)
stem(y_a,'r')

subplot(2, 2, 3)
stem(x1_s)
subplot(2, 2, 4)
stem(y_as,'r')

% create delta function
deltaN = x1;
deltaN(1) = 1;
length = max(deltaN) + 1;
if length >= 2
    deltaN(2:length) = 0;
end


% verify Linearity

if ((a * x1 * 2 + 5 * deltaN) + (b * x2 * 2 + 5 * deltaN)) == ((x1 * a + x2 * b) * 2 + 5 * deltaN)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% if ((a * x1 * 2) + (b * x2 * 2)) == ((x1 * a + x2 * b) * 2)
% 	disp("Outputs consistent with a linear system")
% else
%     disp("Not linear")
% end

% verify tI


y_b = x1 * 2 + 5 * deltaN;

x2_s = horzcat(zeros(1, k0), x1);
y_bs = x2_s * 2 + 5 * horzcat(zeros(1, k0), deltaN);

if y_bs == horzcat(zeros(1, k0), y_b)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end





