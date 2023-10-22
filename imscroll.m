function  imscroll(I, immag)
if nargin < 2
  immag = 100;
end 
hFig = figure;
hIm = imshow(I,[],'InitialMagnification',immag);
hSP = imscrollpanel(hFig,hIm);



