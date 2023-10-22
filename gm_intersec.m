function [y] = gm_intersec(f1,f2,f3,f4,f5)

y = gm_minimum(f1,f2);

if exist('f3','var')
    y = gm_minimum(y,f3);
end
if exist('f4','var')
    y = gm_minimum(y,f4);
end
if exist('f5','var')
    y = gm_minimum(y,f5);
end
