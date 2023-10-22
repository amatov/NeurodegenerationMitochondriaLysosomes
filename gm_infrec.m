function [y] = gm_infrec(f,g, b)

%y = mmsubm(f, mmopen(f,b))
if ~exist('b','var')
    b=strel('disk',1);
end

n=prod(size(f));
y = gm_cdil(f,g,b,n);