clear
clc
close all

n = (0: 10);

x = 2 * sin(n * pi / 3 + pi / 4);
y = Sys1(x, n);

% parameter used to test Linearity
x1 = 5 * x;
x2 = x / 3;

if isLinear(@Sys1, x1, x2)
	disp("Outputs consistent with a linear system")
else
    disp("Not linear")
end

% parameter used to test TI
k0 = 4;

% verify tI

if isTimeInv(@Sys1, n, x, k0)
	disp("This system is time-invariant")
else
    disp("This system is NOT time-invariant")
end

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