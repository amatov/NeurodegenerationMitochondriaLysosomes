function segm = neu_segmcombine (segm1,segm2,p)
% segm = segmcombine (segm1,segm2,p)
%
% Apply a variation of hysteresis thresholding for segmentation of an
% image.
%
% In:
%  segm1    binary image with low thresholding result
%  segm2    binary image with high thresholding result
%  p        percentage of object pixels in segm1 required for each object
%           in segm2
%
% Out:
%  segm     segmentation result
%
% Copyright (C) 2004-2005 Antti Niemistö
% See angioquant.m for more copyright information.

[labeled1, N1] = bwlabel(segm1);
sizes1 = histc(labeled1(:),0:N1);
sizeimg1 = sizes1(labeled1+1);
sizeimg1(sizeimg1==max(sizes1)) = 0;

[labeled2, N2] = bwlabel(segm2);
sizes2 = histc(labeled2(:),0:N2);
sizeimg2 = sizes2(labeled2+1);

loc = find(sizeimg1>=p*sizeimg2);
segm = segm2 & imfill(~segm2,loc,8);
