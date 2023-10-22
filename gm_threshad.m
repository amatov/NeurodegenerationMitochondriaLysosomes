function [y] = gm_threshad(f,f1,f2)


if ~exist('f2','var')
    y = f1<=f;
else
    y = (f1<=f) & (f<=f2);
end

