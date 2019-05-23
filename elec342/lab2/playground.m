clear
clc
close all


n = (0: 5);

x1 = 2 * n;

ti = isTimeInv(@getY1, n, x1, 2);

l = isLinear(@getY2);

function y1 = getY1(n, x, shift, cmode)
% y = t * x(t)

  if cmode == "CALCY"
    n_ramp = delay(n, shift);
  else
    % fill up 0s to ensure equal size
    n_ramp = advance(n, shift);
  end

  y1 = n_ramp .* delay(x, shift);

end

function y2 = getY2(x)
  % y = x(t) ^ 2
  y2 = x .^ 2;
end