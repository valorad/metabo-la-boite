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

x1 = sin(2 * pi .* n / 10);
x2 = cos(2 * pi .* n / 10);

[resultA, ya, yb, x_ab, y_ab] = isLinearDetail(@aGetY1, x1, x2);

figure(1)
subplot(3, 1, 1);
stem(x1)
hold on
stem(ya)
legend("x_1", "y_1")

subplot(3, 1, 2);
stem(x2)
hold on
stem(yb)
legend("x_2", "y_2")

x3 = x1 + x2;

subplot(3, 1, 3);
stem(x3)
hold on
stem(y_ab)
hold on
stem(ya + yb)
legend("x_3", "y_3", "y_4")

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

disp("Case1: n = [0, 1]")

disp("For y[n] = x^2[n]")
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

disp("For y[n] = 2x[n] + 5δ[n]")
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


nB = (0: 20);
x1B = nB;
x2B = 2 * x1B;


disp("Case2: n = [0, 1, ..., 20]")

disp("For y[n] = x^2[n]")
% verify Linearity
if isLinear(@bGetY1, x1B, x2B)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% verify tI

if isTimeInv(@bGetY1withShift, nB, x1B, k0)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end

disp("For y[n] = 2x[n] + 5δ[n]")
% verify Linearity
if isLinear(@bGetY2, x1B, x2B)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end


if isTimeInv(@bGetY2withShift, nB, x2B, k0)
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

function y1 = bGetY1withShift(x, n, shift, cmode)
    % n_ramp = getRamp(cmode)
    y1 = delay(x, shift) .^ 2;
end

function y2 = bGetY2(x)
    [~, sizeX] = size(x);
    y2 = x * 2 + 5 * createDeltaN(sizeX);
end

function y2 = bGetY2withShift(x, n, shift, cmode)
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