function out=find_outliers(img,neiborhood,thresh)
%neiborhood=[2 2];
%thresh = 50;
%show=0;
%imj =  remove_outliers(img, [3 3], 50, 0);

z=medfilt2(img,neiborhood);
wout=img(:)-z(:) > thresh;
out=false(size(img));
if ~isempty(wout) out(wout)=1; end;



