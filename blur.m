function out=blur(I, size, btype)
if ~exist('btype','var')
    btype='flat';
end
switch lower(btype)
   case {'gauss'}
     PSF = fspecial('gaussian',size,size);
     out = imfilter(I,PSF,'symmetric','conv');     
   case 'flat'
     PSF=ones(size); PSF=PSF/sum(PSF(:));
     out = imfilter(I,PSF,'symmetric','conv'); 
   otherwise
      disp('Unknown blur method.');
      out=I;
end
