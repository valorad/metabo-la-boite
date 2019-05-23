function [result] = isTimeInv(func, n, x, shift)
    % ISTIMEINV Tell if is time-invariant
    % func: (n, x, shift, cmode) => [] expression of y as a MATLAB function
    % x: the input signal
    % shift: The delay selected to verify time-invariance

    result = false;
    yShiftXOnly = func(n, x, shift, "");
    yShift = func(n, x, shift, "CALCY");
    if yShiftXOnly == yShift
      result = true;
    end

end
