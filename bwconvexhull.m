
function out = bwconvexhull(in)
%BWCONVHULL Convex hull of binary image
%   out = bwconvexhull(in) computes the convex hulls of the CC in the bw
%   input image and returns it as another binary image, out.
%


s=regionprops(bwlabel(in>0), {'Area', 'BoundingBox', 'ConvexImage' });
out=false(size(in));

for kk=1:length(s),
 i2=floor(s(kk).BoundingBox(2)) + (1:size(s(kk).ConvexImage,1));
 i1=floor(s(kk).BoundingBox(1)) + (1:size(s(kk).ConvexImage,2));
 out(i2,i1)=s(kk).ConvexImage;
end; 





