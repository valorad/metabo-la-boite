clear
clc
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%
% part a)
%%%%%%%%%%%%%%%%%%%%%%%%%%
% y[n] = 2 * x[n]
% x1[n] = sin( (2*pi /10 ) * n )
% x2[n] = cos( (2*pi /10 ) * n )
% 0 <= n <= 10

n = (0: 10);

x1 = a * sin(2 * pi .* n / 10);
x2 = b * cos(2 * pi .* n / 10);

[resultA, ya, yb, x_ab, y_ab] = isLinearDetail(@aGetY1, x1, x2);

figure(1)
subplot(3, 1, 1);
plot(x1)
hold on
plot(ya)

subplot(3, 1, 2);
plot(x2)
hold on
plot(yb)

subplot(3, 1, 3);
plot(x_ab)
hold on
plot(y_ab)

if resultA
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% part b)
%%%%%%%%%%%%%%%%%%%%%%%%%%
% y_a[n] = x^2[n]
% y_b[n] = 2x[n] + 5δ[ n ]

nA = (0: 1);
x1A = (0: 1);
x2A = 2 * x1A;

% right-shift k0 units used to verify TI
k0 = 5;

% verify Linearity

if isLinear(@bGetY1, x1A, x2A)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% verify tI

if isTimeInv(@bGetY1withShift, nA, x1A, k0)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end

% figure(2)
% subplot(2, 2, 1)
% stem(x1)
% subplot(2, 2, 2)
% stem(y_a,'r')

% subplot(2, 2, 3)
% stem(x1_s)
% subplot(2, 2, 4)
% stem(y_as,'r')

% create delta function
% deltaN = x1A;
% deltaN(1) = 1;
% length = max(deltaN) + 1;
% if length >= 2
%     deltaN(2:length) = 0;
% end


% verify Linearity

if isLinear(@bGetY2, x1A, x2A)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end


if isTimeInv(@bGetY2withShift, nA, x1A, k0)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end

function y1 = aGetY1(x)
    y1 = 2 * x;
end

function y1 = bGetY1(x)
    y1 = x .^ 2;
end

function y1 = bGetY1withShift(n, x, shift, cmode)
    % n_ramp = getRamp(cmode)
    y1 = delay(x, shift) .^ 2;
end

function y2 = bGetY2(x)
    [~, sizeX] = size(x);
    y2 = x * 2 + 5 * createDeltaN(sizeX);
end

function y2 = bGetY2withShift(n, x, shift, cmode)
    % n_ramp = getRamp(cmode)
    [~, sizeX] = size(x);
    y2 = delay(x, shift) * 2 + 5 * delay(createDeltaN(sizeX), shift);
end

function n_ramp = getRamp(cmode, shift)
    if cmode == "CALCY"
        n_ramp = delay(n, shift);
    else
        % fill up 0s to ensure equal size
        n_ramp = advance(n, shift);
    end
end

function deltaN = createDeltaN(length)
    % create delta function
    deltaN = zeros(1, length);
    deltaN(1) = 1;
end