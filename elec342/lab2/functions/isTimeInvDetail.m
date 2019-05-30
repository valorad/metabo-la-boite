function [result, yShiftXOnly, yShift] = isTimeInvDetail(func, n, x, shift)
    % ISTIMEINV Tell if is time-invariant with detailed output
    % func: is of type (x, n, shift, cmode) => [] expression of y as a MATLAB function
    % x: the input signal
    % shift: (optional) The delay selected to verify time-invariance

    if nargin < 4
      shift = 3;
    end

    result = false;
    yShiftXOnly = func(x, n, shift, "");
    yShift = func(x, n, shift, "CALCY");
    if yShiftXOnly == yShift
      result = true;
    end

end
