function [result, ya, yb, y_ab] = isLinearDetail(func, x1, x2)
  %ISLINEARDETAIL  Tell if a signal is linear with details
  %   returns true if is linear
  
    if nargin < 2
      x1 = (0: 1: 5);
    end
  
    if nargin < 3
      x2 = (0: 2: 10);
    end
  
    result = false;
  
    a = 10;
    b = 5;

    ya = a .* func(x1);
    yb = b .* func(x2);

    y_ab = func(a .* x1 + b .* x2);
  
    if (ya + yb == y_ab)
      result = true;
    end
    
  end
    