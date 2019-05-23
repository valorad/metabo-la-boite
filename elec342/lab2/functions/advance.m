function [res] = advance(x, time)
    %ADVANCE Insert zeros after at the end
    %   Insert zeros after the end of x
    %   time: units of advance i.e. # of 0s to after the end
    res = horzcat(x, zeros(1, time));
end

