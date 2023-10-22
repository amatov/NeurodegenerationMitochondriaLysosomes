function  imscroll1(I, immag)
if nargin < 2
  immag = 100;
end 
hFig = figure;
hIm = imshow(I,[],'InitialMagnification',immag);




