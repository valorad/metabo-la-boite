function [result, ya, yb, x_ab, y_ab] = isLinearDetail(func, x1, x2)
  %ISLINEARDETAIL  Tell if a signal is linear with details
  %   returns true if is linear
  
    if nargin < 2
      x1 = (0: 1: 5);
    end
  
    if nargin < 3
      x2 = (0: 2: 10);
    end
  
    result = false;
    
    % To verify linearity, for simplicity, we select a = 10 and b = 5
    a = 10;
    b = 5;

    ya = a .* func(x1);
    yb = b .* func(x2);

    x_ab = a .* x1 + b .* x2;
    y_ab = func(x_ab);
  
    if (ya + yb - y_ab <= 0.000000001)
      result = true;
    end
    
  end
    