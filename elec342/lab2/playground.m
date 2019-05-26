clear
clc
close all


n = (0: 5);

x1 = 1 * n;
x2 = 2 * n;



[result, y1, y2, x12, y12] = isLinearDetail(@bGetY1, x1, x2);
tes = y1 + y2 - y12;
res = tes <= 0.000000001;

function y1 = bGetY1(x)
    y1 = x .^ 2;
end
% ti = isTimeInv(@getY1, n, x1, 2);

% l = isLinear(@getY2);

% [~, size] = size(n);

% dn = getDeltaN(size);

% function y1 = getY1(n, x, shift, cmode)
% % y = t * x(t)

%   n_ramp = getRamp(cmode, shift);

%   y1 = n_ramp .* delay(x, shift);

% end

% function y2 = getY2(x)
%   % y = x(t) ^ 2
%   y2 = x .^ 2;
% end

% function deltaN = getDeltaN(length)
%   % create delta function
%   deltaN = zeros(1, length);
%   deltaN(1) = 1;
% end

% function n_ramp = getRamp(cmode, shift)
%   if cmode == "CALCY"
%       n_ramp = delay(n, shift);
%   else
%       % fill up 0s to ensure equal size
%       n_ramp = advance(n, shift);
%   end
% end