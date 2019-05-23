function [res] = delay(x, time)
    %DELAY Insert zeros at start
    %   Insert zeros before pos 1 of x
    %   time: units of delays i.e. # of 0s to insert at start
    res = horzcat(zeros(1, time), x);
end