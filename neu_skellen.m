function y = neu_skellen (x)
% y = skellen (x)
%
% Calculate the length of a skeleton taking into account that the distance
% between two diagonally conneced pixels is not 1 but sqrt(2).
%
% In:
%  x    binary skeleton
%
% Out:
%  y    length of the skeleton
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

[labeled,N] = bwlabel(x,4);
Ndiag = N-1;
y = sum(x(:))+(sqrt(2)-1)*Ndiag-1;
