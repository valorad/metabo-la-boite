clear
clc
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%
% input A
%%%%%%%%%%%%%%%%%%%%%%%%%%

n = (0: 10);

x = 2 * sin(n * pi / 3 + pi / 4);


% parameter used to test Linearity
x1 = 5 * x;
x2 = x / 3;

y1 = Sys1(x1, n);
y2 = Sys1(x2, n);

% plot them out
figure(1)
subplot(2, 2, 1)
stem(x1)

title("x_1[n]= 10sin(n * pi / 3 + pi / 4)")
xlabel('n')
ylabel('x1')

subplot(2, 2, 2)
stem(y1)

title("y_1[n] = n * x_1[n - 1]")
xlabel('n')
ylabel('y1')

subplot(2, 2, 3)
stem(x2)

title("x_2[n]= (2/3)sin(n * pi / 3 + pi / 4)")
xlabel('n')
ylabel('x2')

subplot(2, 2, 4)
stem(y2)

title("y_2[n] = n * x_2[n - 1]")
xlabel('n')
ylabel('y2')

disp("input A:")

if isLinear(@Sys1, x1, x2)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% parameter used to test TI
k0 = 4;

% verify tI
[tiResult, yShiftXOnly, yShift] = isTimeInvDetail(@Sys1, n, x, k0);

% plot them out
figure(2)
subplot(3, 1, 1)
stem(x1)

title("x_1[n]= 10sin(n * pi / 3 + pi / 4)")
xlabel('n')
ylabel('x1')


subplot(3, 1, 2)
stem(yShiftXOnly)

title("y_1[n] = n * x_1[n - 1]")
xlabel('n')
ylabel('yShiftXOnly')


subplot(3, 1, 3)
stem(yShift)

title("y_1[n] = (n - 1) * x_1[n - 1]")
xlabel('n')
ylabel('yShift')

if (tiResult)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end


%%%%%%%%%%%%%%%%%%%%%%%%%%
% input B
%%%%%%%%%%%%%%%%%%%%%%%%%%

n = (0: 10);

x = 2 * sin(n * pi / 3 + pi / 4) ./ (n * pi / 3 + pi / 4) + 8;

% parameter used to test Linearity
x1 = 5 * x;
x2 = x / 3;

y1 = Sys1(x1, n);
y2 = Sys1(x2, n);

% plot them out
figure(3)
subplot(2, 2, 1)
stem(x1)

title("x_1[n]= 10sinc(n * pi / 3 + pi / 4) + 40")
xlabel('n')
ylabel('x1')


subplot(2, 2, 2)
stem(y1)

title("y_1[n] = n * x_1[n - 1]")
xlabel('n')
ylabel('y1')


subplot(2, 2, 3)
stem(x2)

title("x_2[n]= (2/3) * sinc(n * pi / 3 + pi / 4) + 8/3")
xlabel('n')
ylabel('x2')


subplot(2, 2, 4)
stem(y2)

title("y_2[n] = n * x_2[n - 1]")
xlabel('n')
ylabel('y2')

disp("input B:")

if isLinear(@Sys1, x1, x2)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% parameter used to test TI
k0 = 4;

% verify tI
[tiResult, yShiftXOnly, yShift] = isTimeInvDetail(@Sys1, n, x, k0);

% plot them out
figure(4)
subplot(3, 1, 1)
stem(x1)

title("x_1[n]= 10sinc(n * pi / 3 + pi / 4) + 40")
xlabel('n')
ylabel('x1')


subplot(3, 1, 2)
stem(yShiftXOnly)

title("y_1[n] = n * x_1[n - 1]")
xlabel('n')
ylabel('yShiftXOnly')


subplot(3, 1, 3)
stem(yShift)

title("y_1[n] = (n - 1) * x_1[n - 1]")
xlabel('n')
ylabel('yShift')

if (tiResult)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% input C
%%%%%%%%%%%%%%%%%%%%%%%%%%
n = (0: 10);

[~, lengthN] = size(n);

x = ones(1, lengthN);

% parameter used to test Linearity
x1 = 1 * x;
x2 = x / 2;

y1 = Sys1(x1, n);
y2 = Sys1(x2, n);

% plot them out
figure(5)
subplot(2, 2, 1)
stem(x1)

title("x_1[n]= u[n]")
xlabel('n')
ylabel('x1')


subplot(2, 2, 2)
stem(y1)

title("y_1[n] = n * x_1[n - 1]")
xlabel('n')
ylabel('y1')


subplot(2, 2, 3)
stem(x2)

title("x_2[n]= 0.5u[n]")
xlabel('n')
ylabel('x2')


subplot(2, 2, 4)
stem(y2)

title("y_2[n] = n * x_2[n - 1]")
xlabel('n')
ylabel('y2')

disp("input C:")

if isLinear(@Sys1, x1, x2)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% parameter used to test TI
k0 = 4;

% verify tI
[tiResult, yShiftXOnly, yShift] = isTimeInvDetail(@Sys1, n, x, k0);

% plot them out
figure(6)
subplot(3, 1, 1)
stem(x1)

title("x_1[n]= u[n]")
xlabel('n')
ylabel('x1')


subplot(3, 1, 2)
stem(yShiftXOnly)

title("y_1[n] = n * x_1[n - 1]")
xlabel('n')
ylabel('yShiftXOnly')


subplot(3, 1, 3)
stem(yShift)

title("y_1[n] = (n - 1) * x_1[n - 1]")
xlabel('n')
ylabel('yShift')

if (tiResult)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end


%%%%%%%%%%%%%%%%%%%%%%%%%%
% The system
%%%%%%%%%%%%%%%%%%%%%%%%%%

function systemeMystere1 = Sys1(x, n, shift, cmode)
    % Sys1 - Description
    %
    % Syntax: systemeMystere1 = Sys1(x, shift, cmode)
    %
    % This is the blackbox to determine linearity and time-invariance.
    % System nature: y[n] = n * x[n - 1]
    % (Note that the system has delay)
    % Parameters:
    % x: the input
    % n: the x-axis range on figure
    % shift: (optional, used for time-invariance detection) the extra delay introduced
    % cmode: (optional, used for time-invariance detection) whether the delay to the ramp is needed.
    % cmode == "CALCY": ramp delay is needed. Other cases: ramp delay is not performed.

    if nargin < 2
        n = (0: 10);
    end

    if nargin < 3
        shift = 0;
    end

    if nargin < 4
        cmode = "";
    end

    n_ramp = getRamp(cmode, n, shift);

    n_ramp = advance(n_ramp, 1); % to ensure the equal size

    % y1 = 0 % y[0]
    % yOther = n_ramp .* delay(x, shift + 1);

    xinput = delay(x, 1); % To achieve x[n - 1]

    systemeMystere1 = n_ramp .* delay(xinput, shift);
  
end

function n_ramp = getRamp(cmode, n, shift)
    if cmode == "CALCY"
        n_ramp = delay(n, shift);
    else
        % fill up 0s to ensure equal size
        n_ramp = advance(n, shift);
    end
end