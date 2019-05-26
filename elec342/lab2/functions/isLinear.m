function [result] = isLinear(func, x1, x2)
%ISLINEAR Tell if a signal is linear
%   returns true if is linear


  if nargin < 2
    x1 = (0: 1: 5);
  end

  if nargin < 3
    x2 = 2 * x1;
  end

  result = false;

  a = 10;
  b = 5;

  if (abs(a .* func(x1) + b .* func(x2) - func(a .* x1 + b .* x2)) <= 0.000000001)
    result = true;
  end
  
end
  
  