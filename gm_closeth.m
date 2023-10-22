function [y] = gm_closeth(f,b)

%y = mmsubm(f, mmopen(f,b))
if ~exist('b','var')
    b=strel('disk',1);
end
y = gm_subm(imclose(f,b),f);

