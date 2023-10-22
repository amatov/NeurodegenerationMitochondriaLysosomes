function out=despeckle(img,neiborhood, show)
%neiborhood=[3 3];
%show=0;

out=medfilt2(img,neiborhood);

if show==1
    z=uint8(mat2gray(out)*255);
    figure, imshow(z);
end;
