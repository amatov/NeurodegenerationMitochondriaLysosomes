function [y] = gm_openth(f,b)

%y = mmsubm(f, mmopen(f,b))
if ~exist('b','var')
    b=strel('disk',1);
end
y = gm_subm(f,imopen(f,b));

