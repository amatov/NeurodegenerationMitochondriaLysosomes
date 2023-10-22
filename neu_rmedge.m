function y = neu_rmedge (x)
% y = rmedge (x)
%
% Remove objects that touch the boundaries of a binary image. Faster than
% the function IMCLEARBORDER from the Image Processing Toolbox.
%
% In:
%  x    binary image
%
% Out:
%  y    binary image with objects touching the borders removed
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

[m,n] = size(x);
xx = ones (m+2,n+2);
xx(2:m+1,2:n+1) = x;

labeled = bwlabel(xx);
xx(labeled==1) = 0;

y = xx(2:end-1,2:end-1);
