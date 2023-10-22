function [out] = gm_smooth(im,sigma,size)

if ~exist('sigma','var')
    sigma=1.5;
end
if ~exist('size','var')
    size=15;
end
kernel=fspecial('gaussian',size,sigma);
out =conv2(single(im),single(kernel),'same');