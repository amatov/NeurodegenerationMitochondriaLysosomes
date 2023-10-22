function y = neu_rmbranch (x,len)
% y = rmbranch (x,len)
%
% Remove short branches and small objects from a skeleton image.
%
% In:
%  x       skeleton image
%  len     maximum number of pixels in branches to be removed
%
% Out:
%  y       skeleton with short branches and small objects removed
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

y = x;
done = 0;

while ~done
  lasty = y;
  y = rmb(y,len);
  done = isequal(lasty,y);
end


function y = rmb (x,len)

ends = fends(x);
junc = fjunc(x);
se = ones(3);
juncn = imdilate(junc,se);

xmj = x;
xmj(juncn==1) = 0;
loc = find(ends);
objs = xmj & imfill(~xmj,loc,8);

[labeled,N] = bwlabel(objs);
y = x;
sizes = histc(labeled(:),0:N);
y(sizes(labeled+1)<len) = 0;

ends = fends(y);
junc = fjunc(y);
se = ones(3);
juncn = imdilate(junc,se);

ends = double(ends);
ends(juncn==1 & ends==1) = -1;
y(ends==-1) = 0;

function y = fends (x)
% y = fends (x)
%
% Find end points in a binary skeleton image.
%
% In:
%  x    binary skeleton image
%
% Out:
%  y    binary image with end points of the skeletons in x
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

lut = lutends;
y = applylut(x,lut);


function y = lutends()
% y = lutends()
%
% Look-up table for finding end points in a skeleton image.
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

y = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 1 1 1 1 0 1 0 0 0 1 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 1 0 0 0 1 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 ...
     0 0 1 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 1 0 0 ...
     0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 1 ...
     0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 1 1 1 0 1 1 1 1 1]';

 function y = fjunc (x)
% y = fjunc (x)
%
% Find junction points in a binary skeleton image.
%
% In:
%  x    binary skeleton image
%
% Out:
%  y    binary image with junction points of the skeletons in x
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

lut = lutjuncs;
y = applylut(x,lut);


function y = lutjuncs()
% y = lutjuncs()
%
% Look-up table for finding junction points in a skeleton image.
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

y = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 1 1 1 0 1 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 1 1 1 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 1 0 0 0 0 1 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 ...
     1 1 1 1 0 0 1 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 1 ...
     0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ...
     0 0 1 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
     1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 ...
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]';

