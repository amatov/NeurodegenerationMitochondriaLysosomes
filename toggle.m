function toggle(im1, im2)
 
n = 0;
% Loop, picking up the points.
disp('any mouse button toggles images')
disp('press any key to stop')
but = 0;
%figure; 
n=1;

hFig = figure;
hIm = imshow(im1,[],'InitialMagnification',100);
hSP = imscrollpanel(hFig,hIm);
api = iptgetapi(hSP);

while but == 0
    
    if(n==1) 
        %imshow(im1,[],'InitialMagnification',100, 'border','tight');axis image;axis off; 
        %imshow(im1,[]);axis image;axis off;
        api.replaceImage(im1,[]);
        n=2;
    else
        %imshow(im2,[],'InitialMagnification',100, 'border','tight');axis image;axis off;
        %imshow(im2,[]);axis image;axis off;
        api.replaceImage(im2,[]);
        n=1;
    end;
   
    w = waitforbuttonpress;
    if w ~= 0
        break
    end
end

